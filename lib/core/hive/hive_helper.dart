import 'package:hive_flutter/adapters.dart';

import '../../features/domain/entities/student.dart';
import '../keys/data_types.dart';
import 'hive_keys.dart';

class HiveHelper {
  static late Box<bool> loggedIn;
  static late Box<Student> studentData;
  static late Box<String> studentId;

  static Future<void> init({
    required String path,
  }) async {
    await Hive.initFlutter(path);

    //// Register Adapter

    Hive.registerAdapter(StudentAdapter());

    //// Open Boxes
    loggedIn = await Hive.openBox<bool>(HiveKeys.loggedIn.toString());
    studentData = await Hive.openBox<Student>(HiveKeys.student.toString());
    studentId = await Hive.openBox<String>(HiveKeys.studentId.toString());
  }

  static Future<void> putInStudent({
    required Student student,
  }) async {
    await studentData.put(HiveKeys.student.toString(), student);
  }

  static Student? getStudent() {
    return studentData.get(HiveKeys.student.toString());
  }

  static Future<void> removeStudent() async {
    studentData.clear();
  }

  static Future<void> putInBox({
    required Box box,
    required String key,
    required dynamic data,
  }) async {
    return await box.put(key, data);
  }

  static dynamic getBoxData({
    required Box box,
    required String key,
    required DataType dataType,
  }) {
    dynamic defaultValue;
    if (dataType == DataType.bool) {
      defaultValue = false;
    } else if (dataType == DataType.string) {
      defaultValue = "";
    } else if (dataType == DataType.int) {
      defaultValue = 0;
    } else {
      defaultValue = 0.0;
    }

    return box.get(key, defaultValue: defaultValue);
  }

  static void removeData({
    required Box box,
    required String key,
  }) {
    box.put(key, '');
  }
}
