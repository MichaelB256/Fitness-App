class Food {
  String foodName;
  String foodBrand;
  String servingSize;
  String calories;
  String totalFat;
  String cholesterol;
  String sodium;
  String potassium;
  String totalCarbs;
  String dietaryFiber;
  String sugars;
  String protein;

  Food(
      this.foodName,
      this.foodBrand,
      this.servingSize,
      this.calories,
      this.totalFat,
      this.cholesterol,
      this.sodium,
      this.potassium,
      this.totalCarbs,
      this.dietaryFiber,
      this.sugars,
      this.protein);
}

class Meal {
  String mealType;
  List<Food> mealFoodList;
  DateTime mealDate;

  Meal(this.mealType, this.mealFoodList, this.mealDate);

  static void addCustomFood(Food food) {
    foodList.add(food);
  }

  static void addCustomMeal(Meal meal) {
    mealList.add(meal);
  }

  static List<Meal> mealList = [
    Meal("Breakfast 8/5/2023", [foodList[0], foodList[1], foodList[2]],
        DateTime(2023, 10, 4)),
    Meal("Lunch 8/5/2023", [foodList[3], foodList[4], foodList[5]],
        DateTime(2023, 10, 4)),
    Meal("Dinner 8/5/2023", [foodList[6], foodList[7], foodList[8]],
        DateTime(2023, 10, 4)),
    Meal("Breakfast 9/5/2023", [foodList[9], foodList[10], foodList[11]],
        DateTime(2023, 10, 3)),
    Meal("Dinner 9/5/2023", [foodList[12], foodList[13], foodList[14]],
        DateTime(2023, 10, 3)),
  ];

  static List<Food> foodList = [
    Food("Banana", "Fruit Company", "1 medium (7\" to 7-7/8\" long)", "105",
        "0.4", "0mg", "1mg", "422mg", "27g", "3.1g", "14g", "1.3"),
    Food("Sandwich", "Bakery Inc.", "1 serving (1 sandwich)", "320", "10",
        "40mg", "780mg", "300mg", "44g", "3g", "5g", "14"),
    Food("Yogurt", "Dairy Inc.", "1 container (5.3 oz)", "120", "0", "5mg",
        "60mg", "240mg", "17g", "0g", "15g", "11"),
    Food("Hotdog", "Meat Co.", "1 hotdog", "151", "13", "28mg", "481mg",
        "163mg", "1.1g", "0g", "1g", "5.4"),
    Food("Apple", "Fruit Company", "1 medium (2-3/4\" dia)", "95", "0.3", "0mg",
        "1mg", "195mg", "25g", "4g", "19g", "0.5"),
    Food("Juice", "Beverage Co.", "1 serving (8 fl oz)", "110", "0.5", "0mg",
        "25mg", "200mg", "27g", "0.5g", "21g", "0.5"),
    Food("Pizza", "Pizza Co.", "1 slice (14\" pizza)", "285", "10", "25mg",
        "560mg", "180mg", "36g", "2g", "4g", "12"),
    Food("Salad", "Green Garden", "1 serving (2 cups)", "120", "3", "0mg",
        "220mg", "600mg", "20g", "5g", "10g", "8"),
    Food("Chicken Breast", "Meat Co.", "1 piece (4 oz)", "165", "3.6", "85mg",
        "70mg", "360mg", "0g", "0g", "0g", "31"),
    Food("Pasta", "Italian Delight", "1 serving (2 oz)", "200", "1", "0mg",
        "0mg", "0mg", "42g", "2g", "2g", "7"),
    Food("Milk", "Dairy Inc.", "1 cup (8 fl oz)", "150", "8", "30mg", "125mg",
        "400mg", "12g", "0g", "12g", "8"),
    Food("Hamburger", "Burger Joint", "1 hamburger", "250", "8", "45mg",
        "480mg", "200mg", "33g", "2g", "7g", "15"),
    Food("Cereal", "Breakfast Co.", "1 cup", "120", "2", "0mg", "170mg", "60mg",
        "26g", "3g", "9g", "2"),
    Food("Steak", "Meat Co.", "1 piece (8 oz)", "450", "30", "120mg", "80mg",
        "420mg", "0g", "0g", "0g", "40"),
    Food("Rice", "Asian Delight", "1 serving (1 cup)", "205", "0.4", "0mg",
        "2mg", "50mg", "45g", "1g", "0g", "4"),
    Food("Ice Cream", "Dessert Co.", "1 scoop (2.5 fl oz)", "160", "9", "45mg",
        "65mg", "160mg", "18g", "0g", "14g", "2"),
  ];
}
