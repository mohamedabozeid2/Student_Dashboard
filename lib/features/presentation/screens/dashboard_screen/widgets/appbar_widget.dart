import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/components.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/strings.dart';
import '../../../../../core/widgets/adaptive_indicator.dart';
import '../../../controller/login_cubit/login_cubit.dart';
import '../../../controller/login_cubit/login_states.dart';

class DashboardAppbarWidget extends StatelessWidget {
  const DashboardAppbarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      buildWhen: (previous, current) =>
          current is LoginLoadingState ||
          current is LoginSuccessState ||
          current is LoginErrorState,
      listener: (context, state) {},
      builder: (context, state) {
        return state is LoginLoadingState
            ? Center(
                child: AdaptiveIndicator(
                  os: Components.getOS(),
                  color: AppColors.mainColor,
                ),
              )
            : Text(
                '${AppStrings.welcome} ${Constants.getCurrentStudent()!.name.capitalizeFirst}',
                style: Theme.of(context).textTheme.bodyLarge,
                overflow: TextOverflow.ellipsis,
              );
      },
    );
  }
}
