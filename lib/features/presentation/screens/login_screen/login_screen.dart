import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/app_values.dart';
import '../../../../core/utils/components.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/helper.dart';
import '../../../../core/utils/strings.dart';
import '../../../../core/widgets/adaptive_indicator.dart';
import '../../../../core/widgets/app_logo.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../controller/login_cubit/login_cubit.dart';
import '../../controller/login_cubit/login_states.dart';
import '../layout/layout.dart';
import '../register_screen/register_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Constants.mainPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppLogo(),
              SizedBox(
                height: AppSize.s20,
              ),
              CustomTextField(
                context: context,
                controller: emailController,
                type: TextInputType.emailAddress,
                borderColor: Colors.black,
                label: AppStrings.email,
                fillColor: Colors.white,
                borderRadius: AppSize.s12,
                contentStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.black),
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.grey),
              ),
              SizedBox(
                height: AppSize.s10,
              ),
              BlocConsumer<LoginCubit, LoginStates>(
                buildWhen: (previous, current) =>
                    current is LoginChangeVisibilityState,
                listener: (context, state) {},
                builder: (context, state) {
                  return CustomTextField(
                    context: context,
                    controller: passwordController,
                    type: TextInputType.visiblePassword,
                    borderColor: Colors.black,
                    label: AppStrings.password,
                    fillColor: Colors.white,
                    borderRadius: AppSize.s12,
                    contentStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.black),
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.grey),
                    isPassword: LoginCubit.get(context).isVisible,
                    sufIconFun: () =>
                        LoginCubit.get(context).changeVisibility(),
                    suffixIcon: LoginCubit.get(context).icon,
                  );
                },
              ),
              SizedBox(
                height: AppSize.s10,
              ),
              BlocConsumer<LoginCubit, LoginStates>(
                buildWhen: (previous, current) =>
                    current is LoginLoadingState ||
                    current is LoginSuccessState ||
                    current is LoginErrorState ||
                    current is LoginValidationErrorState,
                listener: (context, state) {
                  if (state is LoginErrorState) {
                    Components.showSnackBar(
                      title: AppStrings.appName,
                      message: state.error.toString(),

                    );
                  } else if (state is LoginSuccessState) {
                    Components.navigateAndFinish(
                        context: context, widget: const Layout());
                  }
                },
                builder: (context, state) {
                  return state is LoginLoadingState
                      ? Center(
                          child: AdaptiveIndicator(
                            os: Components.getOS(),
                            color: AppColors.mainColor,
                          ),
                        )
                      : CustomButton(
                          fun: () {
                            LoginCubit.get(context).studentLogin(
                              email: emailController.text,
                              password: passwordController.text,
                              context: context,
                            );
                          },
                          padding: AppSize.s10,
                          text: AppStrings.login,
                          height: Helper.getMaxHeight() * 0.06,
                          textColor: Colors.white,
                          fontSize: AppFontSize.s20,
                          borderRadius: AppSize.s12,
                          backgroundColor: AppColors.mainColor,
                        );
                },
              ),
              SizedBox(
                height: AppSize.s10,
              ),
              Row(
                children: [
                  Text(
                    AppStrings.noEmail,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  GestureDetector(
                    onTap: () {
                      Components.navigateAndFinish(
                          context: context, widget: RegisterScreen());
                    },
                    child: Text(
                      AppStrings.signUp,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: AppColors.mainColor,
                          ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
