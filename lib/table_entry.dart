import 'dart:ffi';
import 'package:flutter/cupertino.dart';

final String table_logins = 'logins'; //name of table we want to create
final String table_user_details = 'user_details';
final String table_user_activity = 'user_avtivity';
final String table_exercise_category = 'exercise_category';
final String table_user_exercise = 'user_exercise';
final String table_workout_planner = 'workout_planner';
final String table_meal_planner = 'meal_planner';
final String table_food_info = 'table_food_info';
final String table_food_nutrition = 'food_nutrition';
final String table_user_movement_tracker = 'user_movement_tracker';
final String table_settings = 'settings';
final String table_user_health = 'table_user_health';
final String table_friends_list = 'friends_list';
final String table_friend_friendship = 'friend_friendship';
final String table_friendship = 'friendship';

//////////////////////////////LOGIN TABLE INFO///////////////////////////////////////////////////

class loginFields {
  static final List<String> values = [login_id, login_email, login_password];

  static final String login_id = '_login_id';
  static final String login_email = 'login_email';
  static final String login_password = 'login_password';
}

class login {
  final int? login_id;
  final String login_email;
  final String login_password;
  //feilds we want to store in database

  const login({
    this.login_id,
    required this.login_email,
    required this.login_password,
    //initalises this content
  });

  login copy({
    int? login_id,
    String? login_email,
    String? login_password,
  }) =>
      login(
        login_id: login_id ?? this.login_id,
        login_email: login_email ?? this.login_email,
        login_password: login_password ?? this.login_password,
      );

  static login fromJson(Map<String, Object?> json) => login(
    login_id: json[loginFields.login_id] as int?,
    login_email: json[loginFields.login_email] as String,
    login_password: json[loginFields.login_password] as String,
  );

  Map<String, Object?> toJson() => {
    loginFields.login_id: login_id,
    loginFields.login_email: login_email,
    loginFields.login_password: login_password,
  };
}

//////////////////////////////USER_DETAILS TABLE INFO///////////////////////////////////////////////////

class user_detailFields {
  static final List<String> values = [
    user_details_id,
    user_login_id,
    user_fname,
    user_lname,
    user_b_date,
    user_height,
    user_sex,
    user_gender,
    user_phone_num
  ];

  static final String user_details_id = '_user_details_id';
  static final String user_login_id = 'user_login_id';
  static final String user_fname = 'user_fname';
  static final String user_lname = 'user_lname';
  static final String user_b_date = 'user_b_date';
  static final String user_height = 'user_height';
  static final String user_sex = 'user_sex';
  static final String user_gender = 'user_gender';
  static final String user_phone_num = 'user_phone_num';
}

class user_details {
  final int? user_details_id;
  final int? user_login_id;
  final String user_fname;
  final String user_lname;
  final DateTime user_b_date;
  final int user_height;
  final String user_sex;
  final String user_gender;
  final BigInt user_phone_num;

  const user_details({
    this.user_details_id,
    required this.user_login_id,
    required this.user_fname,
    required this.user_lname,
    required this.user_b_date,
    required this.user_height,
    required this.user_sex,
    required this.user_gender,
    required this.user_phone_num,
  });

  user_details copy({
    int? user_details_id,
    int? user_login_id,
    String? user_fname,
    String? user_lname,
    DateTime? user_b_date,
    int? user_height,
    String? user_sex,
    String? user_gender,
    BigInt? user_phone_num,
  }) =>
      user_details(
        user_details_id: user_details_id ?? this.user_details_id,
        user_login_id: user_login_id ?? this.user_login_id,
        user_fname: user_fname ?? this.user_fname,
        user_lname: user_lname ?? this.user_lname,
        user_b_date: user_b_date ?? this.user_b_date,
        user_height: user_height ?? this.user_height,
        user_sex: user_sex ?? this.user_sex,
        user_gender: user_gender ?? this.user_gender,
        user_phone_num: user_phone_num ?? this.user_phone_num,
      );

  static user_details fromJson(Map<String, Object?> json) => user_details(
    user_details_id: json[user_detailFields.user_details_id] as int?,
    user_login_id: json[user_detailFields.user_login_id] as int?,
    user_fname: json[user_detailFields.user_fname] as String,
    user_lname: json[user_detailFields.user_lname] as String,
    user_b_date:
    DateTime.parse(json[user_detailFields.user_b_date] as String),
    user_height: json[user_detailFields.user_height] as int,
    user_sex: json[user_detailFields.user_sex] as String,
    user_gender: json[user_detailFields.user_gender] as String,
    user_phone_num: json[user_detailFields.user_phone_num] as BigInt,
  );

  Map<String, Object?> toJson() => {
    user_detailFields.user_details_id: user_details_id,
    user_detailFields.user_login_id: user_login_id,
    user_detailFields.user_fname: user_fname,
    user_detailFields.user_lname: user_lname,
    user_detailFields.user_b_date: user_b_date.toIso8601String(),
    user_detailFields.user_height: user_height,
    user_detailFields.user_sex: user_sex,
    user_detailFields.user_gender: user_gender,
    user_detailFields.user_phone_num: user_phone_num,
  };
}

//////////////////////////////USER_ACTIVITY TABLE INFO///////////////////////////////////////////////////

class user_activityFields {
  static final List<String> values = [
    user_activity_id,
    user_login_id,
    user_exercise_category_id,
    user_exercise_id,
    user_activity_intensity,
    user_activity_dateTime,
    user_activity_duration,
    user_activity_rep,
    user_activity_set,
    user_activity_calories_burnt
  ];

  static final String user_activity_id = '_user_activity_id';
  static final String user_login_id = 'user_login_id';
  static final String user_exercise_category_id = 'user_exercise_category_id';
  static final String user_exercise_id = 'user_exercise_id';
  static final String user_activity_intensity = 'user_activity_intensity';
  static final String user_activity_dateTime = 'user_activity_date';
  static final String user_activity_duration = 'user_activity_duration';
  static final String user_activity_rep = 'user_activity_rep';
  static final String user_activity_set = 'user_activity_set';
  static final String user_activity_calories_burnt =
      'user_activity_calories_burnt';
}

class user_activity {
  final int? user_activity_id;
  final int? user_login_id;
  final int? user_exercise_category_id;
  final int? user_exercise_id;
  final String user_activity_intensity;
  final DateTime user_activity_dateTime;
  final int user_activity_duration;
  final int user_activity_rep;
  final int user_activity_set;
  final int user_activity_calories_burnt;

  const user_activity({
    this.user_activity_id,
    required this.user_login_id,
    required this.user_exercise_category_id,
    required this.user_exercise_id,
    required this.user_activity_intensity,
    required this.user_activity_dateTime,
    required this.user_activity_duration,
    required this.user_activity_rep,
    required this.user_activity_set,
    required this.user_activity_calories_burnt,
  });

  user_activity copy({
    int? user_activity_id,
    int? user_login_id,
    int? user_exercise_category_id,
    int? user_exercise_id,
    String? user_activity_intensity,
    DateTime? user_activity_dateTime,
    int? user_activity_duration,
    int? user_activity_rep,
    int? user_activity_set,
    int? user_activity_calories_burnt,
  }) =>
      user_activity(
        user_activity_id: user_activity_id ?? this.user_activity_id,
        user_login_id: user_login_id ?? this.user_login_id,
        user_exercise_category_id:
        user_exercise_category_id ?? this.user_exercise_category_id,
        user_exercise_id: user_exercise_id ?? this.user_exercise_id,
        user_activity_intensity:
        user_activity_intensity ?? this.user_activity_intensity,
        user_activity_dateTime:
        user_activity_dateTime ?? this.user_activity_dateTime,
        user_activity_duration:
        user_activity_duration ?? this.user_activity_duration,
        user_activity_rep: user_activity_rep ?? this.user_activity_rep,
        user_activity_set: user_activity_set ?? this.user_activity_set,
        user_activity_calories_burnt:
        user_activity_calories_burnt ?? this.user_activity_calories_burnt,
      );

  static user_activity fromJson(Map<String, Object?> json) => user_activity(
    user_activity_id: json[user_activityFields.user_activity_id] as int?,
    user_login_id: json[user_activityFields.user_login_id] as int?,
    user_exercise_category_id:
    json[user_activityFields.user_exercise_category_id] as int?,
    user_exercise_id: json[user_activityFields.user_exercise_id] as int?,
    user_activity_intensity:
    json[user_activityFields.user_activity_intensity] as String,
    user_activity_dateTime: DateTime.parse(
        json[user_activityFields.user_activity_dateTime] as String),
    user_activity_duration:
    json[user_activityFields.user_activity_duration] as int,
    user_activity_rep: json[user_activityFields.user_activity_rep] as int,
    user_activity_set: json[user_activityFields.user_activity_set] as int,
    user_activity_calories_burnt:
    json[user_activityFields.user_activity_calories_burnt] as int,
  );

  Map<String, Object?> toJson() => {
    user_activityFields.user_activity_id: user_activity_id,
    user_activityFields.user_login_id: user_login_id,
    user_activityFields.user_exercise_category_id:
    user_exercise_category_id,
    user_activityFields.user_exercise_id: user_exercise_id,
    user_activityFields.user_activity_intensity: user_activity_intensity,
    user_activityFields.user_activity_dateTime:
    user_activity_dateTime.toIso8601String(),
    user_activityFields.user_activity_duration: user_activity_duration,
    user_activityFields.user_activity_rep: user_activity_rep,
    user_activityFields.user_activity_set: user_activity_set,
    user_activityFields.user_activity_calories_burnt:
    user_activity_calories_burnt,
  };
}

//////////////////////////////EXERCISE_CATEGORY TABLE INFO///////////////////////////////////////////////////

class exercise_categoryFields {
  static final List<String> values = [
    exercise_category_id,
    exercise_category_name,
    exercise_category_description
  ];

  static final String exercise_category_id = '_exercise_category_id';
  static final String exercise_category_name = 'exercise_category_name';
  static final String exercise_category_description =
      'exercise_category_description';
}

class exercise_category {
  final int? exercise_category_id;
  final String exercise_category_name;
  final String exercise_category_description;

  const exercise_category({
    this.exercise_category_id,
    required this.exercise_category_name,
    required this.exercise_category_description,
  });

  exercise_category copy({
    int? exercise_category_id,
    String? exercise_category_name,
    String? exercise_category_description,
  }) =>
      exercise_category(
          exercise_category_id:
          exercise_category_id ?? this.exercise_category_id,
          exercise_category_name:
          exercise_category_name ?? this.exercise_category_name,
          exercise_category_description: exercise_category_description ??
              this.exercise_category_description);

  static exercise_category fromJson(Map<String, Object?> json) =>
      exercise_category(
        exercise_category_id:
        json[exercise_categoryFields.exercise_category_id] as int?,
        exercise_category_name:
        json[exercise_categoryFields.exercise_category_name] as String,
        exercise_category_description:
        json[exercise_categoryFields.exercise_category_description]
        as String,
      );

  Map<String, Object?> toJson() => {
    exercise_categoryFields.exercise_category_id: exercise_category_id,
    exercise_categoryFields.exercise_category_name: exercise_category_name,
    exercise_categoryFields.exercise_category_description:
    exercise_category_description,
  };
}

//////////////////////////////USER_EXERCISE TABLE INFO///////////////////////////////////////////////////

class user_exerciseFields {
  static final List<String> values = [
    user_exercise_id,
    user_exercise_category_id,
    user_exercise_name,
    user_exercise_target_area,
    user_exercise_default_weight,
    user_exercise_instruction,
    user_exercise_video
  ];

  static final String user_exercise_id = '_user_exercise_id';
  static final String user_exercise_category_id = 'user_exercise_category_id';
  static final String user_exercise_name = 'user_exercise_name';
  static final String user_exercise_target_area = 'user_exercise_target_area';
  static final String user_exercise_default_weight =
      'user_exercise_default_weight';
  static final String user_exercise_instruction = 'user_exercise_instruction';
  static final String user_exercise_video = 'user_exercise_video';
}

class user_exercise {
  final int? user_exercise_id;
  final int? user_exercise_category_id;
  final String user_exercise_name;
  final String user_exercise_target_area;
  final int user_exercise_default_weight;
  final String user_exercise_instructions;
  final String user_exercise_video;

  const user_exercise({
    this.user_exercise_id,
    required this.user_exercise_category_id,
    required this.user_exercise_name,
    required this.user_exercise_target_area,
    required this.user_exercise_default_weight,
    required this.user_exercise_instructions,
    required this.user_exercise_video,
  });

  user_exercise copy({
    int? user_exercise_id,
    int? user_exercise_category_id,
    String? user_exercise_name,
    String? user_exercise_target_area,
    int? user_exercise_default_weight,
    String? user_exercise_instructions,
    String? user_exercise_video,
  }) =>
      user_exercise(
        user_exercise_id: user_exercise_id ?? this.user_exercise_id,
        user_exercise_category_id:
        user_exercise_category_id ?? this.user_exercise_category_id,
        user_exercise_name: user_exercise_name ?? this.user_exercise_name,
        user_exercise_target_area:
        user_exercise_target_area ?? this.user_exercise_target_area,
        user_exercise_default_weight:
        user_exercise_default_weight ?? this.user_exercise_default_weight,
        user_exercise_instructions:
        user_exercise_instructions ?? this.user_exercise_instructions,
        user_exercise_video: user_exercise_video ?? this.user_exercise_video,
      );

  static user_exercise fromJson(Map<String, Object?> json) => user_exercise(
    user_exercise_id: json[user_exerciseFields.user_exercise_id] as int?,
    user_exercise_category_id:
    json[user_exerciseFields.user_exercise_category_id] as int?,
    user_exercise_name:
    json[user_exerciseFields.user_exercise_name] as String,
    user_exercise_target_area:
    json[user_exerciseFields.user_exercise_target_area] as String,
    user_exercise_default_weight:
    json[user_exerciseFields.user_exercise_default_weight] as int,
    user_exercise_instructions:
    json[user_exerciseFields.user_exercise_instruction] as String,
    user_exercise_video:
    json[user_exerciseFields.user_exercise_video] as String,
  );

  Map<String, Object?> toJson() => {
    user_exerciseFields.user_exercise_id: user_exercise_id,
    user_exerciseFields.user_exercise_category_id:
    user_exercise_category_id,
    user_exerciseFields.user_exercise_name: user_exercise_name,
    user_exerciseFields.user_exercise_target_area:
    user_exercise_target_area,
    user_exerciseFields.user_exercise_default_weight:
    user_exercise_default_weight,
    user_exerciseFields.user_exercise_instruction:
    user_exercise_instructions,
    user_exerciseFields.user_exercise_video: user_exercise_video,
  };
}

//////////////////////////////WORKOUT_PLANNER TABLE INFO///////////////////////////////////////////////////

class workout_plannerFields {
  static final List<String> values = [
    workout_planner_id,
    user_login_id,
    user_exercise_id,
    exercise_category_id,
    workout_time_date,
    workout_rep,
    workout_set,
    workout_duration
  ];

  static final String workout_planner_id = '_workout_planner_id';
  static final String user_login_id = 'user_login_id';
  static final String user_exercise_id = 'user_exercise_id';
  static final String exercise_category_id = 'exercise_category_id';
  static final String workout_time_date = 'workout_time_date';
  static final String workout_rep = 'workout_rep';
  static final String workout_set = 'workout_set';
  static final String workout_duration = 'workout_duration';
}

class workout_planner {
  final int? workout_planner_id;
  final int? user_login_id;
  final int? user_exercise_id;
  final int? exercise_category_id;
  final DateTime workout_time_date;
  final int workout_rep;
  final int workout_set;
  final int workout_duration;

  const workout_planner({
    this.workout_planner_id,
    required this.user_login_id,
    required this.user_exercise_id,
    required this.exercise_category_id,
    required this.workout_time_date,
    required this.workout_rep,
    required this.workout_set,
    required this.workout_duration,
  });

  workout_planner copy({
    int? workout_planner_id,
    int? user_login_id,
    int? user_exercise_id,
    int? exercise_category_id,
    DateTime? workout_time_date,
    int? workout_rep,
    int? workout_set,
    int? workout_duration,
  }) =>
      workout_planner(
        workout_planner_id: workout_planner_id ?? this.workout_planner_id,
        user_login_id: user_login_id ?? this.user_login_id,
        user_exercise_id: user_exercise_id ?? this.user_exercise_id,
        exercise_category_id: exercise_category_id ?? this.exercise_category_id,
        workout_time_date: workout_time_date ?? this.workout_time_date,
        workout_rep: workout_rep ?? this.workout_rep,
        workout_set: workout_set ?? this.workout_set,
        workout_duration: workout_duration ?? this.workout_duration,
      );

  static workout_planner fromJson(Map<String, Object?> json) => workout_planner(
    workout_planner_id:
    json[workout_plannerFields.workout_planner_id] as int?,
    user_login_id: json[workout_plannerFields.user_login_id] as int?,
    user_exercise_id: json[workout_plannerFields.user_exercise_id] as int?,
    exercise_category_id:
    json[workout_plannerFields.exercise_category_id] as int,
    workout_time_date: DateTime.parse(
        json[workout_plannerFields.workout_time_date] as String),
    workout_rep: json[workout_plannerFields.workout_rep] as int,
    workout_set: json[workout_plannerFields.workout_set] as int,
    workout_duration: json[workout_plannerFields.workout_duration] as int,
  );

  Map<String, Object?> toJson() => {
    workout_plannerFields.workout_planner_id: workout_planner_id,
    workout_plannerFields.user_login_id: user_login_id,
    workout_plannerFields.user_exercise_id: user_exercise_id,
    workout_plannerFields.exercise_category_id: exercise_category_id,
    workout_plannerFields.workout_time_date:
    workout_time_date.toIso8601String(),
    workout_plannerFields.workout_rep: workout_rep,
    workout_plannerFields.workout_set: workout_set,
    workout_plannerFields.workout_duration: workout_duration,
  };
}

//////////////////////////////MEAL_PLANNER TABLE INFO///////////////////////////////////////////////////

class meal_plannerFields {
  static final List<String> values = [
    meal_planner_id,
    user_login_id,
    food_id,
    meal_planner_date_time,
    meal_name
  ];

  static final String meal_planner_id = '_meal_planner_id';
  static final String user_login_id = 'user_login_id';
  static final String food_id = 'food_id';
  static final String meal_planner_date_time = 'meal_planner_date_time';
  static final String meal_name = 'meal_name';
}

class meal_planner {
  final int? meal_planner_id;
  final int? user_login_id;
  final int? food_id;
  final DateTime meal_planner_date_time;
  final String meal_name;

  const meal_planner({
    this.meal_planner_id,
    required this.user_login_id,
    required this.food_id,
    required this.meal_planner_date_time,
    required this.meal_name,
  });

  meal_planner copy({
    int? meal_planner_id,
    int? user_login_id,
    int? food_id,
    DateTime? meal_planner_date_time,
    String? meal_name,
  }) =>
      meal_planner(
          meal_planner_id: meal_planner_id ?? this.meal_planner_id,
          user_login_id: user_login_id ?? this.user_login_id,
          food_id: food_id ?? this.food_id,
          meal_planner_date_time:
          meal_planner_date_time ?? this.meal_planner_date_time,
          meal_name: meal_name ?? this.meal_name);

  static meal_planner fromJson(Map<String, Object?> json) => meal_planner(
    meal_planner_id: json[meal_plannerFields.meal_planner_id] as int?,
    user_login_id: json[meal_plannerFields.user_login_id] as int?,
    food_id: json[meal_plannerFields.food_id] as int?,
    meal_planner_date_time: DateTime.parse(
        json[meal_plannerFields.meal_planner_date_time] as String),
    meal_name: json[meal_plannerFields.meal_name] as String,
  );

  Map<String, Object?> toJson() => {
    meal_plannerFields.meal_planner_id: meal_planner_id,
    meal_plannerFields.user_login_id: user_login_id,
    meal_plannerFields.food_id: food_id,
    meal_plannerFields.meal_planner_date_time:
    meal_planner_date_time.toIso8601String(),
    meal_plannerFields.meal_name: meal_name,
  };
}

//////////////////////////////FOOD_INFO TABLE INFO///////////////////////////////////////////////////

class food_infoFields {
  static final List<String> values = [
    food_id,
    food_category,
    food_description,
    food_serving_size,
    food_calories,
    food_nutrition_id
  ];

  static final String food_id = '_food_id';
  static final String food_category = 'food_category';
  static final String food_description = 'food_description';
  static final String food_serving_size = 'food_serving_size';
  static final String food_calories = 'food_calories';
  static final String food_nutrition_id = 'food_nutrition_id';
}

class food_info {
  final int? food_id;
  final String food_category;
  final String food_description;
  final int food_serving_size;
  final int food_calories;
  final int? food_nutrition_id;

  const food_info({
    this.food_id,
    required this.food_category,
    required this.food_description,
    required this.food_serving_size,
    required this.food_calories,
    required this.food_nutrition_id,
  });

  food_info copy({
    int? food_id,
    String? food_category,
    String? food_description,
    int? food_serving_size,
    int? food_calories,
    int? food_nutrition_id,
  }) =>
      food_info(
        food_id: food_id ?? this.food_id,
        food_category: food_category ?? this.food_category,
        food_description: food_description ?? this.food_description,
        food_serving_size: food_serving_size ?? this.food_serving_size,
        food_calories: food_calories ?? this.food_calories,
        food_nutrition_id: food_nutrition_id ?? this.food_nutrition_id,
      );

  static food_info fromJson(Map<String, Object?> json) => food_info(
    food_id: json[food_infoFields.food_id] as int?,
    food_category: json[food_infoFields.food_category] as String,
    food_description: json[food_infoFields.food_description] as String,
    food_serving_size: json[food_infoFields.food_serving_size] as int,
    food_calories: json[food_infoFields.food_calories] as int,
    food_nutrition_id: json[food_infoFields.food_nutrition_id] as int?,
  );

  Map<String, Object?> toJson() => {
    food_infoFields.food_id: food_id,
    food_infoFields.food_category: food_category,
    food_infoFields.food_description: food_description,
    food_infoFields.food_serving_size: food_serving_size,
    food_infoFields.food_calories: food_calories,
    food_infoFields.food_nutrition_id: food_nutrition_id,
  };
}

//////////////////////////////FOOD_NUTRITION TABLE INFO///////////////////////////////////////////////////

class food_nutritionFields {
  static final List<String> values = [
    food_nutrition_id,
    total_carbs,
    calcium,
    cholesterol,
    protein,
    fiber,
    total_fat,
    iron,
    potassium,
    sugar,
    sodium,
    vitamin_A,
    vitamin_C
  ];

  static final String food_nutrition_id = '_food_nutrition_id';
  static final String total_carbs = 'total_carbs';
  static final String calcium = 'calcium';
  static final String cholesterol = 'cholesterol';
  static final String protein = 'protein';
  static final String fiber = 'fiber';
  static final String total_fat = 'total_fat';
  static final String iron = 'iron';
  static final String potassium = 'potassium';
  static final String sugar = 'sugar';
  static final String sodium = 'sodium';
  static final String vitamin_A = 'vitamin_A';
  static final String vitamin_C = 'vitamin_C';
}

class food_nutrition {
  final int? food_nutrition_id;
  final int total_carbs;
  final int calcium;
  final int cholesterol;
  final int protein;
  final int fiber;
  final int total_fat;
  final int iron;
  final int potassium;
  final int sugar;
  final int sodium;
  final int vitamin_A;
  final int vitamin_C;

  const food_nutrition({
    this.food_nutrition_id,
    required this.total_carbs,
    required this.calcium,
    required this.cholesterol,
    required this.protein,
    required this.fiber,
    required this.total_fat,
    required this.iron,
    required this.potassium,
    required this.sugar,
    required this.sodium,
    required this.vitamin_A,
    required this.vitamin_C,
  });

  food_nutrition copy({
    int? food_nutrition_id,
    int? total_carbs,
    int? calcium,
    int? cholesterol,
    int? protein,
    int? fiber,
    int? total_fat,
    int? iron,
    int? potassium,
    int? sugar,
    int? sodium,
    int? vitamin_A,
    int? vitamin_C,
  }) =>
      food_nutrition(
        food_nutrition_id: food_nutrition_id ?? this.food_nutrition_id,
        total_carbs: total_carbs ?? this.total_carbs,
        calcium: calcium ?? this.calcium,
        cholesterol: cholesterol ?? this.cholesterol,
        protein: protein ?? this.protein,
        fiber: fiber ?? this.fiber,
        total_fat: total_fat ?? this.total_fat,
        iron: iron ?? this.iron,
        potassium: potassium ?? this.potassium,
        sugar: sugar ?? this.sugar,
        sodium: sodium ?? this.sodium,
        vitamin_A: vitamin_A ?? this.vitamin_A,
        vitamin_C: vitamin_C ?? this.vitamin_C,
      );

  static food_nutrition fromJson(Map<String, Object?> json) => food_nutrition(
    food_nutrition_id: json[food_nutritionFields.food_nutrition_id] as int?,
    total_carbs: json[food_nutritionFields.total_carbs] as int,
    calcium: json[food_nutritionFields.calcium] as int,
    cholesterol: json[food_nutritionFields.cholesterol] as int,
    protein: json[food_nutritionFields.protein] as int,
    fiber: json[food_nutritionFields.fiber] as int,
    total_fat: json[food_nutritionFields.total_fat] as int,
    iron: json[food_nutritionFields.iron] as int,
    potassium: json[food_nutritionFields.potassium] as int,
    sugar: json[food_nutritionFields.sugar] as int,
    sodium: json[food_nutritionFields.sodium] as int,
    vitamin_A: json[food_nutritionFields.vitamin_A] as int,
    vitamin_C: json[food_nutritionFields.vitamin_C] as int,
  );

  Map<String, Object?> toJson() => {
    food_nutritionFields.food_nutrition_id: food_nutrition_id,
    food_nutritionFields.total_carbs: total_carbs,
    food_nutritionFields.calcium: calcium,
    food_nutritionFields.cholesterol: cholesterol,
    food_nutritionFields.protein: protein,
    food_nutritionFields.fiber: fiber,
    food_nutritionFields.total_fat: total_fat,
    food_nutritionFields.iron: iron,
    food_nutritionFields.potassium: potassium,
    food_nutritionFields.sugar: sugar,
    food_nutritionFields.sodium: sodium,
    food_nutritionFields.vitamin_A: vitamin_A,
    food_nutritionFields.vitamin_C: vitamin_C,
  };
}

//////////////////////////////USER_MOVEMENT_TRACKER TABLE INFO///////////////////////////////////////////////////

class user_movement_trackerFields {
  static final List<String> values = [
    user_movement_tracker_id,
    user_login_id,
    user_step_count,
    user_distance,
    user_avg_speed,
    user_movement_duration,
    user_movement_date_time
  ];

  static final String user_movement_tracker_id = '_user_movement_tracker_id';
  static final String user_login_id = 'user_login_id';
  static final String user_step_count = 'user_step_count';
  static final String user_distance = 'user_distance';
  static final String user_avg_speed = 'user_avg_speed';
  static final String user_movement_duration = 'user_movement_duration';
  static final String user_movement_date_time = 'user_movement_date_time';
}

class user_movement_tracker {
  final int? user_movement_tracker_id;
  final int? user_login_id;
  final int user_step_count;
  final int user_distance;
  final int user_avg_speed;
  final int user_movement_duration;
  final DateTime user_movement_date_time;

  const user_movement_tracker(
      {this.user_movement_tracker_id,
        required this.user_login_id,
        required this.user_step_count,
        required this.user_distance,
        required this.user_avg_speed,
        required this.user_movement_duration,
        required this.user_movement_date_time});

  user_movement_tracker copy({
    int? user_movement_tracker_id,
    int? user_login_id,
    int? user_step_count,
    int? user_distance,
    int? user_avg_speed,
    int? user_movement_duration,
    DateTime? user_movement_date_time,
  }) =>
      user_movement_tracker(
        user_movement_tracker_id:
        user_movement_tracker_id ?? this.user_movement_tracker_id,
        user_login_id: user_login_id ?? this.user_login_id,
        user_step_count: user_step_count ?? this.user_step_count,
        user_distance: user_distance ?? this.user_distance,
        user_avg_speed: user_avg_speed ?? this.user_avg_speed,
        user_movement_duration:
        user_movement_duration ?? this.user_movement_duration,
        user_movement_date_time:
        user_movement_date_time ?? this.user_movement_date_time,
      );

  static user_movement_tracker fromJson(Map<String, Object?> json) =>
      user_movement_tracker(
        user_movement_tracker_id:
        json[user_movement_trackerFields.user_movement_tracker_id] as int?,
        user_login_id: json[user_movement_trackerFields.user_login_id] as int?,
        user_step_count:
        json[user_movement_trackerFields.user_step_count] as int,
        user_distance: json[user_movement_trackerFields.user_distance] as int,
        user_avg_speed: json[user_movement_trackerFields.user_avg_speed] as int,
        user_movement_duration:
        json[user_movement_trackerFields.user_movement_duration] as int,
        user_movement_date_time: DateTime.parse(
            [user_movement_trackerFields.user_movement_date_time] as String),
      );

  Map<String, Object?> toJson() => {
    user_movement_trackerFields.user_movement_tracker_id:
    user_movement_tracker_id,
    user_movement_trackerFields.user_login_id: user_login_id,
    user_movement_trackerFields.user_step_count: user_step_count,
    user_movement_trackerFields.user_distance: user_distance,
    user_movement_trackerFields.user_avg_speed: user_avg_speed,
    user_movement_trackerFields.user_movement_duration:
    user_movement_duration,
    user_movement_trackerFields.user_movement_date_time:
    user_movement_date_time.toIso8601String(),
  };
}

//////////////////////////////SETTINGS TABLE INFO///////////////////////////////////////////////////

class settingFields {
  static final List<String> values = [
    setting_id,
    login_id,
    setting_distance_unit,
    setting_weight_unit,
    setting_speed_unit,
    setting_language
  ];

  static final String setting_id = '_setting_id';
  static final String login_id = 'login_id';
  static final String setting_distance_unit = 'setting_distance_unit';
  static final String setting_weight_unit = 'setting_weight_unit';
  static final String setting_speed_unit = 'setting_speed_unit';
  static final String setting_language = 'setting_language';
}

class setting {
  final int? setting_id;
  final int? login_id;
  final String setting_distance_unit;
  final String setting_weight_unit;
  final String setting_speed_unit;
  final String setting_language;

  const setting(
      {this.setting_id,
        required this.login_id,
        required this.setting_distance_unit,
        required this.setting_weight_unit,
        required this.setting_speed_unit,
        required this.setting_language});

  setting copy({
    int? setting_id,
    int? login_id,
    String? setting_distance_unit,
    String? setting_weight_unit,
    String? setting_speed_unit,
    String? setting_language,
  }) =>
      copy(
        setting_id: setting_id ?? this.setting_id,
        login_id: login_id ?? this.login_id,
        setting_distance_unit:
        setting_distance_unit ?? this.setting_distance_unit,
        setting_weight_unit: setting_weight_unit ?? this.setting_weight_unit,
        setting_speed_unit: setting_speed_unit ?? this.setting_speed_unit,
        setting_language: setting_language ?? this.setting_language,
      );

  static setting fromJson(Map<String, Object?> json) => setting(
    setting_id: json[settingFields.setting_id] as int?,
    login_id: json[settingFields.login_id] as int?,
    setting_distance_unit:
    json[settingFields.setting_distance_unit] as String,
    setting_weight_unit: json[settingFields.setting_weight_unit] as String,
    setting_speed_unit: json[settingFields.setting_speed_unit] as String,
    setting_language: json[settingFields.setting_language] as String,
  );

  Map<String, Object?> toJson() => {
    settingFields.setting_id: setting_id,
    settingFields.login_id: login_id,
    settingFields.setting_distance_unit: setting_distance_unit,
    settingFields.setting_weight_unit: setting_weight_unit,
    settingFields.setting_speed_unit: setting_speed_unit,
    settingFields.setting_language: setting_language,
  };
}

//////////////////////////////FRIENDS_LIST TABLE INFO///////////////////////////////////////////////////

class friends_listFields {
  static final List<String> values = [
    friend_list_id,
    user_login_id,
    friend_email
  ];

  static final String friend_list_id = '_friend_list_id';
  static final String user_login_id = 'user_login_id';
  static final String friend_email = 'friend_email';
}

class friends_list {
  final int? friend_list_id;
  final int? user_login_id;
  final String? friend_email;

  const friends_list(
      {this.friend_list_id,
        required this.user_login_id,
        required this.friend_email});

  friends_list copy({
    int? friend_list_id,
    int? user_login_id,
    String? friend_email,
  }) =>
      friends_list(
          friend_list_id: friend_list_id ?? this.friend_list_id,
          user_login_id: user_login_id ?? this.user_login_id,
          friend_email: friend_email ?? this.friend_email);

  static friends_list fromJson(Map<String, Object?> json) => friends_list(
    friend_list_id: json[friends_listFields.friend_list_id] as int?,
    user_login_id: json[friends_listFields.user_login_id] as int?,
    friend_email: json[friends_listFields.friend_email] as String?,
  );

  Map<String, Object?> toJson() => {
    friends_listFields.friend_list_id: friend_list_id,
    friends_listFields.user_login_id: user_login_id,
    friends_listFields.friend_email: friend_email,
  };
}

//////////////////////////////FRIENDS_FRIENDSHIP TABLE INFO///////////////////////////////////////////////////

class friend_friendshipFields {
  static final List<String> values = [friend_list_id, friendship_id];

  static final String friend_list_id = '_friend_list_id';
  static final String friendship_id = 'friendship_id';
  static final String friend_friendship_id = 'friend_friendship_id';
}

class friend_friendship {
  final int? friend_friendship_id;
  final int? friend_list_id;
  final int? friendship_id;

  const friend_friendship(
      {this.friend_list_id,
        required this.friendship_id,
        required this.friend_friendship_id});

  friend_friendship copy({
    int? friend_list_id,
    int? friendship_id,
    int? friend_friendship_id,
  }) =>
      friend_friendship(
          friend_friendship_id:
          friend_friendship_id ?? this.friend_friendship_id,
          friend_list_id: friend_list_id ?? this.friend_list_id,
          friendship_id: friendship_id ?? this.friendship_id);

  static friend_friendship fromJson(Map<String, Object?> json) =>
      friend_friendship(
        friend_friendship_id:
        json[friend_friendshipFields.friend_friendship_id] as int?,
        friend_list_id: json[friend_friendshipFields.friend_list_id] as int?,
        friendship_id: json[friend_friendshipFields.friendship_id] as int?,
      );

  Map<String, Object?> toJson() => {
    friend_friendshipFields.friend_friendship_id: friend_friendship_id,
    friend_friendshipFields.friend_list_id: friend_list_id,
    friend_friendshipFields.friendship_id: friendship_id,
  };
}

//////////////////////////////FRIENDSHIP TABLE INFO///////////////////////////////////////////////////

class friendshipFields {
  static final List<String> values = [friendship_id, friendship_type];

  static final String friendship_id = '_friendship_id';
  static final String friendship_type = 'friendship_type';
}

class friendship {
  final int? friendship_id;
  final String friendship_type;

  const friendship({
    this.friendship_id,
    required this.friendship_type,
  });

  friendship copy({int? friendship_id, String? friendship_type}) => friendship(
      friendship_id: friendship_id ?? this.friendship_id,
      friendship_type: friendship_type ?? this.friendship_type);

  static friendship fromJson(Map<String, Object?> json) => friendship(
    friendship_id: json[friendshipFields.friendship_id] as int?,
    friendship_type: json[friendshipFields.friendship_type] as String,
  );

  Map<String, Object?> toJson() => {
    friendshipFields.friendship_id: friendship_id,
    friendshipFields.friendship_type: friendship_type,
  };
}

//////////////////////////////USER_HEALTH TABLE INFO///////////////////////////////////////////////////

class user_healthFields {
  static final List<String> values = [
    health_id,
    user_id,
    user_weight,
    user_bmi,
    user_calories_burnt,
    user_calories_consumed,
    date_time_recorded,
    user_hydration_litres
  ];

  static final String health_id = '_health_id';
  static final String user_id = 'user_id';
  static final String user_weight = 'user_weight';
  static final String user_bmi = 'user_bmi';
  static final String user_calories_burnt = 'user_calories_burnt';
  static final String user_calories_consumed = 'user_calories_consumed';
  static final String date_time_recorded = 'date_time_recorded';
  static final String user_hydration_litres = 'user_hydration_litres';
}

class user_health {
  final int? health_id;
  final int? user_id;
  final int user_weight;
  final int user_bmi;
  final int user_calories_burnt;
  final int user_calories_consumed;
  final DateTime date_time_recorded;
  final double user_hydration_litres;

  const user_health({
    this.health_id,
    required this.user_id,
    required this.user_weight,
    required this.user_bmi,
    required this.user_calories_burnt,
    required this.user_calories_consumed,
    required this.date_time_recorded,
    required this.user_hydration_litres,
  });

  user_health copy({
    int? health_id,
    int? user_id,
    int? user_weight,
    int? user_bmi,
    int? user_calories_burnt,
    int? user_calories_consumed,
    DateTime? date_time_recorded,
    double? user_hydration_litres,
  }) =>
      user_health(
        health_id: health_id ?? this.health_id,
        user_id: user_id ?? this.user_id,
        user_weight: user_weight ?? this.user_weight,
        user_bmi: user_bmi ?? this.user_bmi,
        user_calories_burnt: user_calories_burnt ?? this.user_calories_burnt,
        user_calories_consumed:
        user_calories_consumed ?? this.user_calories_burnt,
        date_time_recorded: date_time_recorded ?? this.date_time_recorded,
        user_hydration_litres:
        user_hydration_litres ?? this.user_hydration_litres,
      );

  static user_health fromJson(Map<String, Object?> json) => user_health(
    health_id: json[user_healthFields.health_id] as int?,
    user_id: json[user_healthFields.user_id] as int?,
    user_weight: json[user_healthFields.user_weight] as int,
    user_bmi: json[user_healthFields.user_bmi] as int,
    user_calories_burnt: json[user_healthFields.user_calories_burnt] as int,
    user_calories_consumed:
    json[user_healthFields.user_calories_consumed] as int,
    date_time_recorded: DateTime.parse(
        json[user_healthFields.date_time_recorded] as String),
    user_hydration_litres:
    json[user_healthFields.user_hydration_litres] as double,
  );

  Map<String, Object?> toJson() => {
    user_healthFields.health_id: health_id,
    user_healthFields.user_id: user_id,
    user_healthFields.user_weight: user_weight,
    user_healthFields.user_bmi: user_bmi,
    user_healthFields.user_calories_burnt: user_calories_burnt,
    user_healthFields.user_calories_consumed: user_calories_consumed,
    user_healthFields.date_time_recorded:
    date_time_recorded.toIso8601String(),
    user_healthFields.user_hydration_litres: user_hydration_litres,
  };
}
