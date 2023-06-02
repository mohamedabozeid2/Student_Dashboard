import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'core/hive/hive_helper.dart';
import 'core/hive/hive_keys.dart';
import 'core/keys/data_types.dart';
import 'core/services/services_locator.dart';
import 'features/presentation/controller/BlocObserver/BlocObserver.dart';
import 'features/presentation/screens/dashboard_screen/dashboard_screen.dart';
import 'features/presentation/screens/login_screen/login_screen.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'app.dart';
import 'core/utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Directory directory = await getApplicationDocumentsDirectory();
  ServicesLocator().init();

  Constants.setDirectory(directory);
  await HiveHelper.init(path: directory.path);

  bool loggedIn = HiveHelper.getBoxData(
      box: HiveHelper.loggedIn,
      key: HiveKeys.loggedIn.toString(),
      dataType: DataType.bool);
  Constants.setLoggedIn(loggedIn);
  late Widget startWidget;

  if (loggedIn) {
    Constants.setCurrentStudent(await HiveHelper.getStudent());
    startWidget = const DashboardScreen();
  } else {
    startWidget = LoginScreen();
  }

  Bloc.observer = MyBlocObserver();
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => StudentApp(
        startWidget: startWidget,
      ),
    ),
  );
}
