import 'package:flutter/material.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/helper.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/drawer_icon_button.dart';
import '../../controller/main_cubit/main_cubit.dart';
import 'widgets/appbar_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    print("STUDENT");
    print(Constants.getCurrentStudent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          toolbarHeight: Helper.getMaxHeight() * 0.13,
          leading: const DrawerIconButton(),
          title: const DashboardAppbarWidget(),
        ),
        SliverFillRemaining(
          child: Column(
            children: [
              CustomButton(
                fun: () {
                  MainCubit.get(context).signOut(context: context);
                },
                text: "Sign Out",
                height: 100,
                fontSize: 50,
              )
            ],
          ),
        )
      ],
    ));
  }
}
