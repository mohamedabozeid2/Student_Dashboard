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
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../controller/register_cubit/register_cubit.dart';
import '../../controller/register_cubit/register_states.dart';
import '../layout/layout.dart';
import '../login_screen/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController reTypePasswordController =
      TextEditingController();

  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Constants.mainPadding, vertical: AppSize.s70),
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  context: context,
                  controller: userNameController,
                  type: TextInputType.name,
                  borderColor: Colors.black,
                  label: AppStrings.userName,
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
                BlocConsumer<RegisterCubit, RegisterStates>(
                  buildWhen: (previous, current) =>
                      current is RegisterPasswordChangeVisibility,
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
                      isPassword: RegisterCubit.get(context).passwordIsVisible,
                      sufIconFun: () =>
                          RegisterCubit.get(context).changePasswordVisibility(),
                      suffixIcon: RegisterCubit.get(context).reTypePasswordIcon,
                    );
                  },
                ),
                SizedBox(
                  height: AppSize.s10,
                ),
                BlocConsumer<RegisterCubit, RegisterStates>(
                  buildWhen: (previous, current) =>
                      current is RegisterReTypePasswordChangeVisibility,
                  listener: (context, state) {},
                  builder: (context, state) {
                    return CustomTextField(
                      context: context,
                      controller: reTypePasswordController,
                      type: TextInputType.visiblePassword,
                      borderColor: Colors.black,
                      label: AppStrings.reTypePassword,
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
                      isPassword:
                          RegisterCubit.get(context).reTypePasswordIsVisible,
                      sufIconFun: () => RegisterCubit.get(context)
                          .changePasswordVisibility(retype: true),
                      suffixIcon: RegisterCubit.get(context).reTypePasswordIcon,
                    );
                  },
                ),
                SizedBox(
                  height: AppSize.s10,
                ),
                BlocConsumer<RegisterCubit, RegisterStates>(
                  buildWhen: (previous, current) =>
                      current is RegisterLoadingState ||
                      current is RegisterSuccessState ||
                      current is RegisterErrorState ||
                      current is RegisterValidationErrorState,
                  listener: (context, state) {
                    if (state is RegisterErrorState) {
                      Components.showSnackBar(
                        title: AppStrings.appName,
                        message: state.error,
                      );
                    } else if (state is RegisterSuccessState) {
                      Components.navigateAndFinish(
                          context: context, widget: const Layout());
                    }
                  },
                  builder: (context, state) {
                    return state is RegisterLoadingState
                        ? Center(
                            child: AdaptiveIndicator(
                              os: Components.getOS(),
                              color: AppColors.mainColor,
                            ),
                          )
                        : CustomButton(
                            fun: () {
                              RegisterCubit.get(context).studentRegister(
                                name: userNameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                reTypePassword: reTypePasswordController.text,
                              );
                            },
                            padding: AppSize.s10,
                            text: AppStrings.signUp,
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
                      AppStrings.hasAccount,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    GestureDetector(
                      onTap: () {
                        Components.navigateAndFinish(
                            context: context, widget: LoginScreen());
                      },
                      child: Text(
                        AppStrings.login,
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
      ),
    );
  }
}
