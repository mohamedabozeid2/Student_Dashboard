import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_values.dart';
import '../../../../core/utils/components.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/helper.dart';
import '../../../../core/widgets/adaptive_indicator.dart';
import '../../../../core/widgets/drawer_icon_button.dart';
import '../../controller/main_cubit/main_cubit.dart';
import '../../controller/main_cubit/main_states.dart';
import '../../../../core/widgets/announcements_widget.dart';
import 'widgets/appbar_widget.dart';
import 'widgets/exams_tips.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal:Constants.mainPadding),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            toolbarHeight: Helper.getMaxHeight() * 0.13,
            leading: const DrawerIconButton(),
            title: const DashboardAppbarWidget(),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const ExamsTips(),
                SizedBox(
                  height: AppSize.s20,
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            child: BlocConsumer<MainCubit, MainStates>(
              buildWhen: (previous, current) =>
                  current is MainGetAllDataLoadingState ||
                  current is MainGetAllDataSuccessState ||
                  current is MainGetAllDataErrorState,
              listener: (context, state) {},
              builder: (context, state) {
                return state is MainGetAllDataLoadingState
                    ? Center(
                        child: AdaptiveIndicator(
                          os: Components.getOS(),
                          color: AppColors.mainColor,
                        ),
                      )
                    : const AnnouncementsWidget();
              },
            ),
          )
        ],
      ),
    ));
  }
}
