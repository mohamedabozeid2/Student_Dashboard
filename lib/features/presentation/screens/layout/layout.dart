import 'package:flutter/material.dart';

import '../../controller/main_cubit/main_cubit.dart';
import '../drawer/home_screen.dart';

class Layout extends StatefulWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  void initState() {
    MainCubit.get(context).getAllData(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}
