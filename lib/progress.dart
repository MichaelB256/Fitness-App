import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Workout {
  final dynamic day;
  final int count;

  Workout(this.day, this.count);
}

class Goal {
  final String name;
  final int percent;

  Goal(this.name, this.percent);
}

class ProgressTrackerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xffffffff),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title: const Text(
          "Progress Over Time",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontSize: 18,
            color: Color(0xff000000),
          ),
        ),
        leading: const Icon(
          Icons.arrow_back,
          color: Color(0xff212435),
          size: 24,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Weekly Progress',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 10.0),
              _buildBarChart(),
              const SizedBox(height: 20.0),
              const Text(
                'Monthly Progress',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 10.0),
              _buildLineChart(),
              const SizedBox(height: 20.0),
              const Text(
                'Yearly Progress',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              // const SizedBox(height: 10.0),
              // _buildPieChart(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBarChart() {
    List<charts.Series<Workout, String>> data = [
      charts.Series<Workout, String>(
        id: 'Workouts',
        data: [
          Workout('Mon', 3),
          Workout('Tue', 4),
          Workout('Wed', 2),
          Workout('Thu', 5),
          Workout('Fri', 4),
          Workout('Sat', 6),
          Workout('Sun', 2),
        ],
        domainFn: (Workout workout, _) => workout.day,
        measureFn: (Workout workout, _) => workout.count,
        colorFn: (Workout workout, _) =>
            charts.ColorUtil.fromDartColor(Colors.blue),
      ),
    ];

    return SizedBox(
      height: 200.0,
      child: charts.BarChart(
        data,
        animate: true,
        barRendererDecorator: charts.BarLabelDecorator<String>(),
        domainAxis: const charts.OrdinalAxisSpec(
          renderSpec: charts.SmallTickRendererSpec(
            labelRotation: 60,
            labelStyle: charts.TextStyleSpec(
              fontSize: 12,
              color: charts.MaterialPalette.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLineChart() {
    List<charts.Series<Workout, int>> data = [
      charts.Series<Workout, int>(
        id: 'Workouts',
        data: [
          Workout(1, 3),
          Workout(2, 4),
          Workout(3, 2),
          Workout(4, 5),
          Workout(5, 4),
          Workout(6, 6),
          Workout(7, 2),
          Workout(8, 3),
          Workout(9, 4),
          Workout(10, 6),
          Workout(11, 2),
          Workout(12, 5),
        ],
        domainFn: (Workout workout, _) => workout.day,
        measureFn: (Workout workout, _) => workout.count,
        colorFn: (Workout workout, _) =>
            charts.ColorUtil.fromDartColor(Colors.blue),
      ),
    ];

    return SizedBox(
      height: 200.0,
      child: charts.LineChart(
        data,
        animate: true,
        domainAxis: const charts.NumericAxisSpec(
          tickProviderSpec:
              charts.BasicNumericTickProviderSpec(zeroBound: false),
          renderSpec: charts.SmallTickRendererSpec(
            labelStyle: charts.TextStyleSpec(
              fontSize: 12,
              color: charts.MaterialPalette.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPieChart() {
    List<charts.Series<Goal, String>> data = [
      charts.Series<Goal, String>(
        id: 'Goals',
        data: [
          Goal('Weight Loss', 70),
          Goal('Muscle Gain', 20),
          Goal('Endurance', 10),
        ],
        domainFn: (Goal goal, _) => goal.name,
        measureFn: (Goal goal, _) => goal.percent,
        colorFn: (Goal goal, _) => charts.ColorUtil.fromDartColor(Colors.blue),
        labelAccessorFn: (Goal goal, _) => '${goal.name}: ${goal.percent}%',
      ),
    ];

    return SizedBox(
      height: 200.0,
      child: charts.PieChart(
        data,
        animate: true,
        defaultRenderer: charts.ArcRendererConfig(
          arcRendererDecorators: [
            charts.ArcLabelDecorator(
              labelPosition: charts.ArcLabelPosition.inside,
            )
          ],
        ),
      ),
    );
  }
}
