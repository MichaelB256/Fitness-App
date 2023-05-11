import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'pwer_database.dart';
import 'table_entry.dart';

class depreciated_HydrationPage extends StatefulWidget {
  const depreciated_HydrationPage({Key? key});

  @override
  _depreciated_HydrationPageState createState() => _depreciated_HydrationPageState();
}

class _depreciated_HydrationPageState extends State<depreciated_HydrationPage> {
  List<MapEntry<String, Widget>> _graphs = [];
  List<DropdownMenuItem<String>> dropDownItems = [
    DropdownMenuItem(
      value: 'Weight (kilograms)',
      child: Text('Weight (kilograms)'),
    ),
    DropdownMenuItem(
      value: 'BMI',
      child: Text('BMI'),
    ),
    DropdownMenuItem(
      value: 'Calorie Intake (kcal)',
      child: Text('Calorie Intake (kcal)'),
    ),
    DropdownMenuItem(
      value: 'Calories Burnt (kcal)',
      child: Text('Calories Burnt (kcal)'),
    ),
    DropdownMenuItem(
      value: 'Water Intake (litres)',
      child: Text('Water Intake (litres)'),
    ),
  ];

  Map<String, String> tableKeys = {
    'Weight (kilograms)': 'user_weight',
    'BMI': 'user_bmi',
    'Calorie Intake (kcal)': 'user_calories_burnt',
    'Calories Burnt (kcal)': 'user_calories_consumed',
    'Water Intake (litres)': 'user_hydration_litres'
  };

  late List<Map<String, dynamic>> results;

  @override
  void initState() {
    fetchAndStoreUserHealthData(1);
    _graphs.insert(0, MapEntry('data-button', healthDataEntryButton()));
    _graphs.insert(0, MapEntry('dropdown', dropDown()));
    super.initState();
  }

  Widget dropDown() {
    return DropdownButton(
      items: dropDownItems,
      onChanged: (value) {
        setState(() {
          _graphs.insert(
            0,
            MapEntry(
                value!,
                graph(value,
                    dropDownItems.indexWhere((item) => item.value == value))),
          );
          dropDownItems.removeWhere((item) => item.value == value);
        });
      },
    );
  }

  Widget healthDataEntryButton() {
    final weightController = TextEditingController();
    final bmiController = TextEditingController();
    final calorieIntakeController = TextEditingController();
    final caloriesBurntController = TextEditingController();
    final waterIntakeController = TextEditingController();
    final dateController = TextEditingController();

    return TextButton(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: 10),
      ),
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
            title: Text('Health Entry'),
            content: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 50.0, // set the height as per your requirement
                    child: TextField(
                      controller: weightController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Weight',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                    child: TextField(
                      controller: bmiController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'BMI',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                    child: TextField(
                      controller: calorieIntakeController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Calorie Intake',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                    child: TextField(
                      controller: caloriesBurntController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Calories Burnt',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                    child: TextField(
                      controller: waterIntakeController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Water Intake',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                    child: TextField(
                      controller: dateController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Date',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: Text('CANCEL'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: Text('SUBMIT'),
                onPressed: () async {
                  await pwerDatabase.instance.createUser_health(user_health(
                      user_id: 1,
                      user_weight: int.tryParse(weightController.text) ?? 0,
                      user_bmi: int.tryParse(bmiController.text) ?? 0,
                      user_calories_burnt:
                          int.tryParse(caloriesBurntController.text) ?? 0,
                      user_calories_consumed:
                          int.tryParse(calorieIntakeController.text) ?? 0,
                      date_time_recorded:
                          DateTime.tryParse(dateController.text) ??
                              DateTime(2022),
                      user_hydration_litres:
                          double.tryParse(waterIntakeController.text) ?? 0));
                  Navigator.pop(context);
                  setState(() {
                    fetchAndStoreUserHealthData(1);
                  });
                },
              ),
            ]),
      ),
      child: const Text('Add Health Data'),
    );
  }

  // ... your other functions here...

  Widget graph(String? title, int index) {
    return Column(children: [
      Row(
        children: [
          Expanded(
            flex: 20,
            child: Text(
              title.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
            iconSize: 20,
            splashRadius: 10,
            icon: const Icon(Icons.close),
            onPressed: () {
              setState(() {
                _removeGraph(title!);
                dropDownItems.add(DropdownMenuItem(
                  value: title,
                  child: Text(title.toString()),
                ));
              });
            },
          ),
        ],
      ),
      Material(
        elevation: 5, // Set the elevation to control the size of the shadow
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: Colors.lightBlue,
              width: 2.0,
            ),
          ),
          height: 300,
          child: FutureBuilder<List<tableData>>(
            future: getChartData(1, title),
            builder: (BuildContext context,
                AsyncSnapshot<List<tableData>> snapshot) {
              if (snapshot.hasData) {
                return SfCartesianChart(
                  primaryXAxis: DateTimeAxis(
                    dateFormat: DateFormat.yMd(),
                    title: AxisTitle(text: 'Date'),
                  ),
                  primaryYAxis: NumericAxis(
                    edgeLabelPlacement: EdgeLabelPlacement.shift,
                    title: AxisTitle(text: title),
                  ),
                  series: <ChartSeries>[
                    LineSeries<tableData, DateTime>(
                      dataSource: snapshot.data!,
                      xValueMapper: (tableData data, _) => data.day,
                      yValueMapper: (tableData data, _) => data.consumption,
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              }
              // Show a loading spinner while waiting for the data
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    ]);
  }

  void _removeGraph(String title) {
    _graphs.removeWhere((element) => element.key == title);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          AppBar(
            title: const Text(
              'Fitness Data',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.blueAccent),
          ),
          Expanded(
            flex: 20,
            child: SizedBox(
              height: height,
              width: width * 0.9,
              child: ListView.builder(
                itemCount: _graphs.length,
                itemBuilder: (context, index) => _graphs[index].value,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void fetchAndStoreUserHealthData(int userId) async {
    this.results = await pwerDatabase.instance.getUserHealthData(userId);
  }

  Future<List<tableData>> getChartData(int user_id, String? dataType) async {
    List<tableData> chartData = [];
    for (var i = 0; i < this.results.length; i++) {
      final int consumption = results[i][tableKeys[dataType]];
      final DateTime day = DateTime.parse(results[i]['date_time_recorded']);
      final tableData data = tableData(day, consumption);
      chartData.add(data);
    }
    return chartData;
  }
}

class tableData {
  tableData(this.day, this.consumption);
  final DateTime day;
  final int consumption;
}
