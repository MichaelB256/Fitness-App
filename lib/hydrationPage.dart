import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HydrationPage extends StatefulWidget {
  const HydrationPage({Key? key});

  @override
  _HydrationPageState createState() => _HydrationPageState();
}

class _HydrationPageState extends State<HydrationPage> {
  late List<hydrationData> _chartData;

  List<MapEntry<String, Widget>> _graphs = [];
  List<DropdownMenuItem<String>> dropDownItems = [
    DropdownMenuItem(
      child: Text('Weight'),
      value: 'Weight',
    ),
    DropdownMenuItem(
      child: Text('BMI'),
      value: 'BMI',
    ),
    DropdownMenuItem(
      child: Text('Calorie Intake'),
      value: 'Calorie Intake',
    ),
    DropdownMenuItem(
      child: Text('Calories Burnt'),
      value: 'Calories Burnt',
    ),
    DropdownMenuItem(
      child: Text('Water Intake'),
      value: 'Water Intake',
    ),
  ];

  @override
  void initState() {
    _chartData = getChartData();
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

  Widget healthDataEntryButton(){
    return TextButton(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: 10),
      ),
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(title:
        Text('Health Entry'),
            content: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:[
                  SizedBox(
                    height: 50.0, // set the height as per your requirement
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Weight',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'BMI',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Calorie Intake',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Calories Burnt',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Water Intake',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Date',
                      ),
                    ),
                  ),

                ],
              ),
            ),
            actions:[TextButton(
              child: Text('CANCEL'),
              onPressed: () {Navigator.pop(context);},
            ),
              TextButton(
                child: Text('SUBMIT'),
                onPressed: () {},
              ),]
        ),
      ),
      child: const Text('Add Health Data'),
    );
  }


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
                  child: Text(title.toString()),
                  value: title,
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
          child: SfCartesianChart(
            primaryXAxis: NumericAxis(
              edgeLabelPlacement: EdgeLabelPlacement.shift,
            ),
            series: <ChartSeries>[
              LineSeries<hydrationData, double>(
                dataSource: _chartData,
                xValueMapper: (hydrationData consumption, _) =>
                consumption.day,
                yValueMapper: (hydrationData consumption, _) =>
                consumption.consumption,
              ),
            ],
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
      body: Align(
        alignment: FractionalOffset.topCenter,
        child: Column(children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child:IconButton(
                  iconSize: 20,
                  splashRadius: 10,
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    setState(() {});
                  },
                ),
              ),
              const Align(
                alignment: Alignment.center,
                child: Text('Qualitative Fitness Data',style: TextStyle(
                  fontSize: 20,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            ],
          ),
          Expanded(
            flex: 20,
            child: Container(
              height: height,
              width: width * 0.9,
              child: ListView.builder(
                itemCount: _graphs.length,
                itemBuilder: (context, index) => _graphs[index].value,
              ),
            ),
          ),
        ]),
      ),
    );
  }

  List<hydrationData> getChartData() {
    final List<hydrationData> chartData = [
      hydrationData(1, 300),
      hydrationData(2, 200),
      hydrationData(3, 500),
      hydrationData(4, 700),
      hydrationData(5, 600),
      hydrationData(6, 100),
      hydrationData(7, 800)
    ];
    return chartData;
  }
}

class hydrationData {
  hydrationData(this.day, this.consumption);
  final double day;
  final double consumption;
}
