import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/components.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/strings.dart';
import '../../../../../core/widgets/adaptive_indicator.dart';
import '../../../controller/main_cubit/main_cubit.dart';
import '../../../controller/main_cubit/main_states.dart';

class DashboardAppbarWidget extends StatelessWidget {
  const DashboardAppbarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
      buildWhen: (previous, current) =>
          current is MainLoadUserLoadingData ||
          current is MainLoadUserErrorData ||
          current is MainLoadUserSuccessData,
      listener: (context, state) {
        if (state is MainLoadUserErrorData) {
          MainCubit.get(context).signOut(context: context);
        }
      },
      builder: (context, state) {
        return state is MainLoadUserLoadingData
            ? Center(
                child: AdaptiveIndicator(
                  os: Components.getOS(),
                  color: AppColors.mainColor,
                ),
              )
            : Row(
                children: [
                  Text(
                      '${AppStrings.welcome} ${Constants.getCurrentStudent()!.name.capitalizeFirst}')
                ],
              );
      },
    );
  }
}
