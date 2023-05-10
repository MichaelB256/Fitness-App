import 'package:flutter/animation.dart';
import 'package:flutter/gestures.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'table_entry.dart';

class pwerDatabase {
  static final pwerDatabase instance =
      pwerDatabase._init(); // calls the constructor

  static Database? _database; //from sqflite package

  pwerDatabase._init(); //private constructor

  Future<Database> get database async {
    //creates database
    if (_database != null) {
      return _database!; //return to make sure it dosent exist
    }

    _database = await _initDB(
        'table_entry.dart'); //initalizes database, the file is where the database will be stored
    return _database!; //returns database
  }

  Future<Database> _initDB(String filePath) async {
    //creates a new method where we get our file path
    final dbpath =
        await getDatabasesPath(); //here we are storing our database in our file system specific to iOS and Android
    final path = join(dbpath, filePath); //gives us path to open databse from

    return await openDatabase(path,
        version: 1,
        onCreate:
            _createDB); //open database from path and on create means when creating a new databse run this command
  }

  Future _createDB(Database db, int version) async {
    final idType =
        'INTEGER PRIMARY KEY AUTOINCREMENT'; //creates parameters for the field
    final integerTypeNotNull = 'INTEGER NOT NULL';
    final integerType = 'INTEGER';
    final textTypeNotNull = 'TEXT NOT NULL';
    final textType = 'TEXT';
    final BigIntNotNullType = 'BIGINT NOT NULL';
    final BigIntType = 'BIGINT';
    final DoubleTypeNotNullType = 'DOUBLE NOT NULL';
    final DoubleType = 'DOUBLE';

    await db.execute('''
CREATE TABLE $table_logins(
  ${loginFields.login_id} $idType,
  ${loginFields.login_email} $textTypeNotNull,
  ${loginFields.login_password} $textTypeNotNull
)

CREATE TABLE $table_user_details(
  ${user_detailFields.user_details_id} $idType,
  FOREIGN KEY ${user_detailFields.user_login_id} REFERENCES ${loginFields.login_id},
  ${user_detailFields.user_fname} $textTypeNotNull,
  ${user_detailFields.user_lname} $textTypeNotNull,
  ${user_detailFields.user_b_date} $textTypeNotNull,
  ${user_detailFields.user_height} $integerTypeNotNull,
  ${user_detailFields.user_sex} $textTypeNotNull,
  ${user_detailFields.user_gender} $textType,
  ${user_detailFields.user_phone_num} $BigIntType,
)

CREATE TABLE $table_exercise_category(
  ${exercise_categoryFields.exercise_category_id} $idType,
  ${exercise_categoryFields.exercise_category_name} $textTypeNotNull,
  ${exercise_categoryFields.exercise_category_description} $textTypeNotNull,
)

CREATE TABLE $table_user_exercise(
  ${user_exerciseFields.user_exercise_id} $idType,
  FOREIGN KEY ${user_exerciseFields.user_exercise_category_id} REFERENCES ${exercise_categoryFields.exercise_category_id},
  ${user_exerciseFields.user_exercise_name} $textTypeNotNull,
  ${user_exerciseFields.user_exercise_target_area} $textTypeNotNull,
  ${user_exerciseFields.user_exercise_default_weight} $integerTypeNotNull,
  ${user_exerciseFields.user_exercise_instruction} $textType,
  ${user_exerciseFields.user_exercise_video} $textType,
)

CREATE TABLE $table_user_activity(
  ${user_activityFields.user_activity_id} $idType,
  FOREIGN KEY ${user_activityFields.user_login_id}  REFERENCES ${loginFields.login_id},
  FOREIGN KEY ${user_activityFields.user_exercise_category_id}  REFERENCES ${exercise_categoryFields.exercise_category_id},
  FOREIGN KEY ${user_activityFields.user_exercise_id} REFERENCES ${user_exerciseFields.user_exercise_id},
  ${user_activityFields.user_activity_intensity} $textType,
  ${user_activityFields.user_activity_dateTime} $textType,
  ${user_activityFields.user_activity_duration} $integerType,
  ${user_activityFields.user_activity_rep} $integerType,
  ${user_activityFields.user_activity_set} $integerType,
  ${user_activityFields.user_activity_calories_burnt} $integerType,
)

CREATE TABLE $table_workout_planner(
  ${workout_plannerFields.workout_planner_id} $idType,
  FOREIGN KEY ${workout_plannerFields.user_login_id}  REFERENCES ${loginFields.login_id},
  FOREIGN KEY ${workout_plannerFields.exercise_category_id}  REFERENCES ${exercise_categoryFields.exercise_category_id},
  FOREIGN KEY ${workout_plannerFields.user_exercise_id} REFERENCES ${user_exerciseFields.user_exercise_id},
  ${workout_plannerFields.workout_time_date} $textTypeNotNull,
  ${workout_plannerFields.workout_rep} $integerTypeNotNull,
  ${workout_plannerFields.workout_set} $integerTypeNotNull,
  ${workout_plannerFields.workout_duration} $integerType,
)

CREATE TABLE $table_food_nutrition(
  ${food_nutritionFields.food_nutrition_id} $idType,
  ${food_nutritionFields.total_carbs} $integerType,
  ${food_nutritionFields.total_fat} $integerType,
  ${food_nutritionFields.calcium} $integerType,
  ${food_nutritionFields.cholesterol} $integerType,
  ${food_nutritionFields.protein} $integerType,
  ${food_nutritionFields.fiber} $integerType,
  ${food_nutritionFields.iron} $integerType,
  ${food_nutritionFields.potassium} $integerType,
  ${food_nutritionFields.sugar} $integerType,
  ${food_nutritionFields.sodium} $integerType,
  ${food_nutritionFields.vitamin_A} $integerType,
  ${food_nutritionFields.vitamin_C} $integerType,
)

CREATE TABLE $table_food_info(
  ${food_infoFields.food_id} $idType,
  ${food_infoFields.food_category} $textTypeNotNull,
  ${food_infoFields.food_description} $textTypeNotNull,
  ${food_infoFields.food_serving_size} $integerTypeNotNull,
  ${food_infoFields.food_calories} $integerTypeNotNull,
  FOREIGN KEY ${food_infoFields.food_nutrition_id} REFERENCES ${food_nutritionFields.food_nutrition_id},
)

CREATE TABLE $table_meal_planner(
  ${meal_plannerFields.meal_planner_id} $idType,
  FOREIGN KEY ${meal_plannerFields.user_login_id} REFERENCES ${loginFields.login_id},
  FOREIGN KEY ${meal_plannerFields.food_id} REFERENCES ${food_infoFields.food_id},
  ${meal_plannerFields.meal_planner_date_time} $textTypeNotNull,
  ${meal_plannerFields.meal_name} $textTypeNotNull,
)

CREATE TABLE $table_user_movement_tracker(
  ${user_movement_trackerFields.user_movement_tracker_id} $idType,
  FOREIGN KEY ${user_movement_trackerFields.user_login_id} REFERENCES ${loginFields.login_id},
  ${user_movement_trackerFields.user_step_count} $integerTypeNotNull,
  ${user_movement_trackerFields.user_distance} $integerTypeNotNull,
  ${user_movement_trackerFields.user_avg_speed} $integerTypeNotNull,
  ${user_movement_trackerFields.user_movement_duration} $integerTypeNotNull,
  ${user_movement_trackerFields.user_movement_date_time} $textTypeNotNull,
)

CREATE TABLE $table_settings(
  ${settingFields.setting_id} $idType,
  FOREIGN KEY ${settingFields.login_id} REFERENCES ${loginFields.login_id},
  ${settingFields.setting_distance_unit} $textTypeNotNull,
  ${settingFields.setting_weight_unit} $textTypeNotNull,
  ${settingFields.setting_speed_unit} $textTypeNotNull,
  ${settingFields.setting_language} $textTypeNotNull,
)

CREATE TABLE $table_friendship(
  ${friendshipFields.friendship_id} $idType,
  ${friendshipFields.friendship_type} $textTypeNotNull,
)

CREATE TABLE $table_friends_list(
  ${friends_listFields.friend_list_id} $idType,
  FOREIGN KEY ${friends_listFields.user_login_id} REFERENCES ${loginFields.login_id},
  FOREIGN KEY ${friends_listFields.friend_email} REFERENCES ${loginFields.login_email},
)

CREATE TABLE $table_friend_friendship(
  ${friend_friendshipFields.friend_friendship_id} $idType,
  FOREIGN KEY ${friend_friendshipFields.friend_list_id} REFERENCES ${friends_listFields.friend_list_id},
  FOREIGN KEY ${friend_friendshipFields.friendship_id} REFERENCES ${friendshipFields.friendship_id},
)

CREATE TABLE $table_user_health(
  ${user_healthFields.health_id} $idType,
  FOREIGN KEY ${user_healthFields.user_id} REFERENCES ${loginFields.login_id},
  ${user_healthFields.user_weight} $integerTypeNotNull,
  ${user_healthFields.user_bmi} $integerType,
  ${user_healthFields.user_calories_burnt} $integerType,
  ${user_healthFields.user_calories_consumed} $integerType,
  ${user_healthFields.date_time_recorded} $textTypeNotNull,
  ${user_healthFields.user_hydration_litres} $DoubleType,
)

''');
  }

///////////////////////////////////CRUD OPERATIONS FOR LOGIN/////////////////////////////////////////

  Future<login> createLogin(login table_entry) async {
    final db = await instance.database;

    final id = await db.insert(table_logins, table_entry.toJson());

    return table_entry.copy(login_id: id);
  }

  Future<login> readLogin(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      table_logins,
      columns: loginFields.values,
      where: '${loginFields.values} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return login.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<int> updateLogin(login table_entry) async {
    final db = await instance.database;

    return await db.update(
      table_logins,
      table_entry.toJson(),
      where: '${loginFields.login_id} = ?',
      whereArgs: [table_entry.login_id],
    );
  }

  Future<int> deleteLogin(int id) async {
    final db = await instance.database;

    return await db.delete(
      table_logins,
      where: '${loginFields.login_id} = ?',
      whereArgs: [id],
    );
  }

///////////////////////////////////CRUD OPERATIONS FOR USER_DETAILS/////////////////////////////////////////

  Future<user_details> createUser_details(user_details table_entry) async {
    final db = await instance.database;

    final id = await db.insert(table_user_details, table_entry.toJson());

    return table_entry.copy(user_details_id: id);
  }

  Future<user_details> readUser_details(int id) async {
    final db = await instance.database;

    final maps = await db.query(table_user_details,
        columns: user_detailFields.values,
        where: '${user_detailFields.values}',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return user_details.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<int> updateUser_details(user_details table_entry) async {
    final db = await instance.database;

    return await db.update(
      table_user_details,
      table_entry.toJson(),
      where: '${user_detailFields.user_details_id} = ?',
      whereArgs: [table_entry.user_details_id],
    );
  }

  Future<int> deleteUser_details(int id) async {
    final db = await instance.database;

    return await db.delete(table_user_details,
        where: '${user_detailFields.user_details_id} = ?', whereArgs: [id]);
  }
///////////////////////////////////CRUD OPERATIONS FOR USER_ACTIVITY/////////////////////////////////////////

  Future<user_activity> createUser_activity(user_activity table_entry) async {
    final db = await instance.database;

    final id = await db.insert(table_user_activity, table_entry.toJson());

    return table_entry.copy(user_activity_id: id);
  }

  Future<user_activity> readUser_activity(int id) async {
    final db = await instance.database;

    final maps = await db.query(table_user_activity,
        columns: user_activityFields.values,
        where: '${user_activityFields.values}',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return user_activity.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<int> updateUser_activity(user_activity table_entry) async {
    final db = await instance.database;

    return await db.update(
      table_user_activity,
      table_entry.toJson(),
      where: '${user_activityFields.user_activity_id} = ?',
      whereArgs: [table_entry.user_activity_id],
    );
  }

  Future<int> deleteUser_activity(int id) async {
    final db = await instance.database;

    return await db.delete(table_user_activity,
        where: '${user_activityFields.user_activity_id} = ?', whereArgs: [id]);
  }

///////////////////////////////////CRUD OPERATIONS FOR EXERCISE_CATEGORY/////////////////////////////////////////

  Future<exercise_category> createExercise_category(
      exercise_category table_entry) async {
    final db = await instance.database;

    final id = await db.insert(table_exercise_category, table_entry.toJson());

    return table_entry.copy(exercise_category_id: id);
  }

  Future<exercise_category> readExercise_category(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      table_exercise_category,
      columns: exercise_categoryFields.values,
      where: '${exercise_categoryFields.values}',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return exercise_category.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<int> updateExercise_category(exercise_category table_entry) async {
    final db = await instance.database;

    return await db.update(
      table_exercise_category,
      table_entry.toJson(),
      where: '${exercise_categoryFields.exercise_category_id} = ?',
      whereArgs: [table_entry.exercise_category_id],
    );
  }

  Future<int> deleteExercise_category(int id) async {
    final db = await instance.database;

    return await db.delete(table_exercise_category,
        where: '${exercise_categoryFields.exercise_category_id} = ?',
        whereArgs: [id]);
  }

///////////////////////////////////CRUD OPERATIONS FOR USER_EXERCISE/////////////////////////////////////////

  Future<user_exercise> createUser_exercise(user_exercise table_entry) async {
    final db = await instance.database;

    final id = await db.insert(table_user_exercise, table_entry.toJson());

    return table_entry.copy(user_exercise_category_id: id);
  }

  Future<user_exercise> readUser_exercise(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      table_user_exercise,
      columns: user_exerciseFields.values,
      where: '${user_exerciseFields.values}',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return user_exercise.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<int> updateUser_exercise(user_exercise table_entry) async {
    final db = await instance.database;

    return db.update(
      table_user_exercise,
      table_entry.toJson(),
      where: '${user_exerciseFields.user_exercise_id} = ?',
      whereArgs: [table_entry.user_exercise_id],
    );
  }

  Future<int> deleteUser_exercise(int id) async {
    final db = await instance.database;

    return await db.delete(
      table_user_exercise,
      where: '${user_exerciseFields.user_exercise_id} = ?',
      whereArgs: [id],
    );
  }

///////////////////////////////////CRUD OPERATIONS FOR WORKOUT_PLANNER/////////////////////////////////////////

  Future<workout_planner> createWorkout_planner(
      workout_planner table_entry) async {
    final db = await instance.database;

    final id = await db.insert(table_workout_planner, table_entry.toJson());

    return table_entry.copy(workout_planner_id: id);
  }

  Future<workout_planner> readWorkout_planner(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      table_workout_planner,
      columns: workout_plannerFields.values,
      where: '${workout_plannerFields.values}',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return workout_planner.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<int> updateWorkout_planner(workout_planner table_entry) async {
    final db = await instance.database;

    return db.update(
      table_workout_planner,
      table_entry.toJson(),
      where: '${workout_plannerFields.workout_planner_id} = ?',
      whereArgs: [table_entry.workout_planner_id],
    );
  }

  Future<int> deleteWorkout_planner(int id) async {
    final db = await instance.database;

    return await db.delete(
      table_workout_planner,
      where: '${workout_plannerFields.workout_planner_id} = ?',
      whereArgs: [id],
    );
  }

///////////////////////////////////CRUD OPERATIONS FOR MEAL_PLANNER/////////////////////////////////////////

  Future<meal_planner> createMeal_planner(meal_planner table_entry) async {
    final db = await instance.database;

    final id = await db.insert(table_meal_planner, table_entry.toJson());

    return table_entry.copy(meal_planner_id: id);
  }

  Future<meal_planner> readMeal_planner(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      table_meal_planner,
      columns: meal_plannerFields.values,
      where: '${meal_plannerFields.values}',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return meal_planner.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<int> updateMeal_planner(meal_planner table_entry) async {
    final db = await instance.database;

    return db.update(
      table_meal_planner,
      table_entry.toJson(),
      where: '${meal_plannerFields.meal_planner_id} = ?',
      whereArgs: [table_entry.meal_planner_id],
    );
  }

  Future<int> deleteMeal_planner(int id) async {
    final db = await instance.database;

    return await db.delete(
      table_meal_planner,
      where: '${meal_plannerFields.meal_planner_id} = ?',
      whereArgs: [id],
    );
  }

///////////////////////////////////CRUD OPERATIONS FOR FOOD_INFO/////////////////////////////////////////

  Future<food_info> createFood_info(food_info table_entry) async {
    final db = await instance.database;

    final id = await db.insert(table_food_info, table_entry.toJson());

    return table_entry.copy(food_id: id);
  }

  Future<food_info> readFood_info(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      table_food_info,
      columns: food_infoFields.values,
      where: '${food_infoFields.values}',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return food_info.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<int> updateFood_info(food_info table_entry) async {
    final db = await instance.database;

    return db.update(
      table_food_info,
      table_entry.toJson(),
      where: '${food_infoFields.food_id} = ?',
      whereArgs: [table_entry.food_id],
    );
  }

  Future<int> deleteFood_info(int id) async {
    final db = await instance.database;

    return await db.delete(
      table_food_info,
      where: '${food_infoFields.food_id} = ?',
      whereArgs: [id],
    );
  }

///////////////////////////////////CRUD OPERATIONS FOR FOOD_NUTRITION/////////////////////////////////////////

  Future<food_nutrition> createdFood_nutrition(
      food_nutrition table_entry) async {
    final db = await instance.database;

    final id = await db.insert(table_food_nutrition, table_entry.toJson());

    return table_entry.copy(food_nutrition_id: id);
  }

  Future<food_nutrition> readFood_nutrition(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      table_food_nutrition,
      columns: food_nutritionFields.values,
      where: '${food_nutritionFields.values}',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return food_nutrition.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<int> updateFood_nurition(food_nutrition table_entry) async {
    final db = await instance.database;

    return db.update(
      table_food_nutrition,
      table_entry.toJson(),
      where: '${food_nutritionFields.food_nutrition_id} = ?',
      whereArgs: [table_entry.food_nutrition_id],
    );
  }

  Future<int> deleteFood_nutrition(int id) async {
    final db = await instance.database;

    return await db.delete(
      table_food_nutrition,
      where: '${food_nutritionFields.food_nutrition_id} = ?',
      whereArgs: [id],
    );
  }

///////////////////////////////////CRUD OPERATIONS FOR SETTING/////////////////////////////////////////

  Future<setting> createSetting(setting table_entry) async {
    final db = await instance.database;

    final id = await db.insert(table_settings, table_entry.toJson());

    return table_entry.copy(setting_id: id);
  }

  Future<setting> readSetting(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      table_settings,
      columns: settingFields.values,
      where: '${settingFields.values}',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return setting.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<int> updateSetting(setting table_entry) async {
    final db = await instance.database;

    return db.update(
      table_settings,
      table_entry.toJson(),
      where: '${settingFields.setting_id} = ?',
      whereArgs: [table_entry.setting_id],
    );
  }

  Future<int> deleteSetting(int id) async {
    final db = await instance.database;

    return await db.delete(
      table_settings,
      where: '${settingFields.setting_id} = ?',
      whereArgs: [id],
    );
  }

///////////////////////////////////CRUD OPERATIONS FOR USER_MOVEMENT_TRACKER/////////////////////////////////////////

  Future<user_movement_tracker> createUser_movement_tracker(
      user_movement_tracker table_entry) async {
    final db = await instance.database;

    final id =
        await db.insert(table_user_movement_tracker, table_entry.toJson());

    return table_entry.copy(user_movement_tracker_id: id);
  }

  Future<user_movement_tracker> readUser_movement_tracker(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      table_user_movement_tracker,
      columns: user_movement_trackerFields.values,
      where: '${user_movement_trackerFields.values}',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return user_movement_tracker.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<int> updateUser_movement_tracker(
      user_movement_tracker table_entry) async {
    final db = await instance.database;

    return db.update(
      table_user_movement_tracker,
      table_entry.toJson(),
      where: '${user_movement_trackerFields.user_movement_tracker_id} = ?',
      whereArgs: [table_entry.user_movement_tracker_id],
    );
  }

  Future<int> deleteUser_movement_tracker(int id) async {
    final db = await instance.database;

    return await db.delete(
      table_user_movement_tracker,
      where: '${user_movement_trackerFields.user_movement_tracker_id} = ?',
      whereArgs: [id],
    );
  }

///////////////////////////////////CRUD OPERATIONS FOR FRIENDS_LIST/////////////////////////////////////////

  Future<friends_list> createFriend_list(friends_list table_entry) async {
    final db = await instance.database;

    final id = await db.insert(table_friends_list, table_entry.toJson());

    return table_entry.copy(friend_list_id: id);
  }

  Future<friends_list> readFriend_list(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      table_friends_list,
      columns: friends_listFields.values,
      where: '${friends_listFields.values}',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return friends_list.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<int> updateFriend_list(friends_list table_entry) async {
    final db = await instance.database;

    return db.update(
      table_friends_list,
      table_entry.toJson(),
      where: '${friends_listFields.friend_list_id} = ?',
      whereArgs: [table_entry.friend_list_id],
    );
  }

  Future<int> deleteFriend_list(int id) async {
    final db = await instance.database;

    return await db.delete(
      table_friends_list,
      where: '${friends_listFields.friend_list_id} = ?',
      whereArgs: [id],
    );
  }

///////////////////////////////////CRUD OPERATIONS FOR FRIEND_FRIENDSHIP/////////////////////////////////////////

  Future<friend_friendship> createFriend_friendship(
      friend_friendship table_entry) async {
    final db = await instance.database;

    final id = await db.insert(table_friend_friendship, table_entry.toJson());

    return table_entry.copy(friend_friendship_id: id);
  }

  Future<friend_friendship> readFriend_friendship(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      table_friend_friendship,
      columns: friend_friendshipFields.values,
      where: '${friend_friendshipFields.values}',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return friend_friendship.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<int> updateFriend_friendship(friend_friendship table_entry) async {
    final db = await instance.database;

    return db.update(
      table_friend_friendship,
      table_entry.toJson(),
      where: '${friend_friendshipFields.friend_friendship_id} = ?',
      whereArgs: [table_entry.friend_friendship_id],
    );
  }

  Future<int> deleteFriend_friendship(int id) async {
    final db = await instance.database;

    return await db.delete(
      table_friend_friendship,
      where: '${friend_friendshipFields.friend_friendship_id} = ?',
      whereArgs: [id],
    );
  }

///////////////////////////////////CRUD OPERATIONS FOR FRIENDSHIP/////////////////////////////////////////

  Future<friendship> createFriendship(friendship table_entry) async {
    final db = await instance.database;

    final id = await db.insert(table_friendship, table_entry.toJson());

    return table_entry.copy(friendship_id: id);
  }

  Future<friendship> readFriendship(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      table_friendship,
      columns: friendshipFields.values,
      where: '${friendshipFields.values}',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return friendship.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<int> updateFriendship(friendship table_entry) async {
    final db = await instance.database;

    return db.update(
      table_friendship,
      table_entry.toJson(),
      where: '${friendshipFields.friendship_id} = ?',
      whereArgs: [table_entry.friendship_id],
    );
  }

  Future<int> deleteFriendship(int id) async {
    final db = await instance.database;

    return await db.delete(
      table_friendship,
      where: '${friendshipFields.friendship_id} = ?',
      whereArgs: [id],
    );
  }

///////////////////////////////////CRUD OPERATIONS FOR USER_HEALTH/////////////////////////////////////////

  Future<user_health> createUser_health(user_health table_entry) async {
    final db = await instance.database;

    final id = await db.insert(table_user_health, table_entry.toJson());

    return table_entry.copy(health_id: id);
  }

  Future<user_health> readUser_health(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      table_user_health,
      columns: user_healthFields.values,
      where: '${user_healthFields.values}',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return user_health.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<int> updateUser_health(user_health table_entry) async {
    final db = await instance.database;

    return db.update(
      table_user_health,
      table_entry.toJson(),
      where: '${user_healthFields.health_id} = ?',
      whereArgs: [table_entry.health_id],
    );
  }

  Future<int> deleteUser_health(int id) async {
    final db = await instance.database;

    return await db.delete(
      table_user_health,
      where: '${user_healthFields.health_id} = ?',
      whereArgs: [id],
    );
  }
}
