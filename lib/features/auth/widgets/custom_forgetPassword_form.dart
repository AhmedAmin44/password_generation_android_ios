import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_gen/core/function/custom_troast.dart';
import 'package:password_gen/core/utils/app_colors.dart';
import 'package:password_gen/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:password_gen/features/auth/presentation/auth_cubit/auth_state.dart';
import 'package:password_gen/features/auth/widgets/text_form_field.dart';
import '../../../core/function/navigation.dart';
import '../../../core/utils/app_string.dart';
import '../../../core/widgets/customButton.dart';

class CustomForgotPasswordForm extends StatelessWidget {
  const CustomForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
        // ignore: non_constant_identifier_names
        listener: (Context, state) {
          if(state is ResetPasswordSuccessState){
            ShowToast("Check Your Email to Reset Your Password");
            customNavigateReplacement(context,"/login");
          }else if(state is ResetPasswordFailureState){ShowToast(state.errMsg);}
    }, builder: (Context, state) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
            key: authCubit.forgotPasswordFormKey,
            child: Column(
              children: [
                TextFField(
                  labelText: AppStrings.emailAddress,
                  onChanged: (emailAddress) {
                    authCubit.emailAddress = emailAddress;
                  },
                ),
                SizedBox(
                  height: 129,
                ),
                state is ResetPasswordLoadingState
                    ? CircularProgressIndicator(
                  color: AppColors.primaryColor,
                )
                    : CustomBotton(
                  onPressed: () {
                    if (authCubit.forgotPasswordFormKey.currentState!.validate()) {
                      authCubit.resetPasswordWithLink();
                    }
                  },
                  text: AppStrings.sendResetPasswordLink,
                ),
              ],
            )),
      );
    });
  }
}
