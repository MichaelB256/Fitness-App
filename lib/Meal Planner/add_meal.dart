import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
//import 'package:meal_planner/meal.dart';
import 'add_food.dart';
import 'meal.dart';

class AddMeal extends StatefulWidget {
  const AddMeal({Key? key}) : super(key: key);
  @override
  State<AddMeal> createState() => _AddMealState();
}

class _AddMealState extends State<AddMeal> {
  late String _mealType = '';
  final List<Food> _selectedFoodList = [];
  late final DateTime _mealDate = DateTime.now();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void _saveMeal() {
    if (_mealType == null || _selectedFoodList.isEmpty || _mealDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please fill all fields!")));
      return;
    }
    /*final meal = Meal(_mealType, _selectedFoodList.toList(), _mealDate);
    Meal.addCustomMeal(meal); // Add the custom meal to the meal list*/
    final mealTypeDate =
        "$_mealType ${_mealDate.month}/${_mealDate.day}/${_mealDate.year}";
    final meal = Meal(mealTypeDate, _selectedFoodList.toList(), _mealDate);
    Meal.addCustomMeal(meal); // Add the custom meal to the meal list

    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Meal logged successfully!")));

    if (_mealType == null || _selectedFoodList.isEmpty || _mealDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please fill all fields!")));
      return;
    }

    /*Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AddFood())
    );*/
    //Hotkey: Ctrl + Shift + "/"
    /*print("Meal Type: ${meal.mealType}");
    print("Meal Food List:");
    for (var food in meal.mealFoodList) {
      print("- ${food.foodName}");
    }
    print("Meal Date: ${meal.mealDate}");*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("Log Meal"),
        //backgroundColor: const Color(0xffa9d9e8),
      ),
      body: Center(
        child: Stack(
          children: [
            Column(
              children: [
                DropdownButton<String>(
                  value: null,
                  hint: const Text("Select Meal Type"),
                  items: ["Breakfast", "Lunch", "Dinner"]
                      .map((meal) => DropdownMenuItem<String>(
                            value: meal,
                            child: Text(meal),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _mealType = value!;
                    });
                  },
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: Meal.foodList.length,
                    itemBuilder: (context, index) {
                      final food = Meal.foodList[index];
                      return CheckboxListTile(
                        title: Text(food.foodName),
                        subtitle: Text("${food.calories} calories"),
                        value: _selectedFoodList.contains(food),
                        onChanged: (value) {
                          setState(() {
                            if (value!) {
                              _selectedFoodList.add(food);
                            } else {
                              _selectedFoodList.remove(food);
                            }
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: ElevatedButton(
                onPressed: _saveMeal,
                child: const Text("Save Meal"),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddFood()));
        },
      ),
    );
  }
}
