import 'package:flutter/material.dart';
// import 'package:meal_planner/add_food.dart';
// import 'package:meal_planner/add_meal.dart';
// import 'package:meal_planner/meal.dart';

import 'add_food.dart';
import 'add_meal.dart';
import 'meal.dart';

class MealPlannerPage extends StatefulWidget {
  const MealPlannerPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MealPlanner();
  }
}

class MealPlanner extends State<MealPlannerPage> {
  late String? selectedMeal = null;
  int totalCalories = 0;
  double totalFat = 0;
  double totalProtein = 0;

  void calculateTotals() {
    totalCalories = 0;
    totalFat = 0;
    totalProtein = 0;

    for (Meal meal in Meal.mealList) {
      if (meal.mealType == selectedMeal) {
        for (Food food in meal.mealFoodList) {
          totalCalories += int.parse(food.calories);
          totalFat += double.parse(food.totalFat);
          totalProtein += double.parse(food.protein);
        }
      }
    }
  }

  void refreshDropdown() {
    setState(() {
      selectedMeal = null;
      totalCalories = 0;
      totalFat = 0;
      totalProtein = 0;
    });
  }

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
          "Nutrition",
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButton<String>(
              value: selectedMeal,
              hint: const Text('Select a meal'),
              onChanged: (String? newValue) {
                setState(() {
                  selectedMeal = newValue!;
                  calculateTotals();
                });
              },
              items: Meal.mealList.map((Meal meal) {
                return DropdownMenuItem<String>(
                  value: meal.mealType,
                  child: Text('${meal.mealType}'),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Text(
              'Total Calories: $totalCalories',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Total Fat: $totalFat',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Total Protein: $totalProtein',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddFood()));
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: const Text('Add Food'),
                ),
                const SizedBox(width: 20),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddMeal()));
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: const Text('Add Meal'),
                ),
              ],
            ),
            SizedBox(height: 20),
            MaterialButton(
              onPressed: () {
                refreshDropdown();
              },
              color: Colors.blue,
              textColor: Colors.white,
              child: Text('Refresh'),
            ),
          ],
        ),
      ),
    );
  }
}
