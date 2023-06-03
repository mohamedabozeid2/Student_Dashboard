import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'config/themes/light_theme.dart';
import 'core/services/services_locator.dart';
import 'core/utils/helper.dart';
import 'features/presentation/controller/login_cubit/login_cubit.dart';
import 'features/presentation/controller/main_cubit/main_cubit.dart';
import 'features/presentation/controller/register_cubit/register_cubit.dart';
import 'features/presentation/screens/splash_screen/splash_screen.dart';

class StudentApp extends StatelessWidget {
  final Widget startWidget;

  const StudentApp({
    Key? key,
    required this.startWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(392.72727272727275, 788.7272727272727),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              Helper.setMaxHeight(constraints.maxHeight);
              Helper.setMaxWidth(constraints.maxWidth);
              return MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (BuildContext context) => LoginCubit(
                      sl(),
                      sl(),
                    ),
                  ),
                  BlocProvider(
                    create: (BuildContext context) => MainCubit(
                      sl(),
                      sl(),
                      sl(),
                      sl(),
                      sl(),
                      sl(),

                    ),
                  ),
                  BlocProvider(
                      create: (BuildContext context) =>
                          RegisterCubit(sl(), sl())),
                ],
                child: GetMaterialApp(
                  useInheritedMediaQuery: true,
                  locale: DevicePreview.locale(context),
                  builder: DevicePreview.appBuilder,
                  debugShowCheckedModeBanner: false,
                  theme: lightTheme,
                  themeMode: ThemeMode.light,
                  home: child,
                ),
              );
            },
          );
        },
        child: SplashScreen(
          startWidget: startWidget,
        ));
  }
}
