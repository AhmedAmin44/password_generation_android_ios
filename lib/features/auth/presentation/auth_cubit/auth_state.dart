class AuthState {}

final class AuthInitial extends AuthState {}

final class SignUpLoadingState extends AuthState {}

final class SignUpSuccessState extends AuthState {}

final class SignUpFailureState extends AuthState {
  final String errmsg;
  SignUpFailureState({required this.errmsg});
}
final class PhoneVerificationSuccessState extends AuthState {}
final class OTPCodeSentState extends AuthState {}
final class PhoneVerificationFailureState extends AuthState {
    final String errmsg;

  PhoneVerificationFailureState({required this.errmsg});

}


final class SignInLoadingState extends AuthState {}

final class SignInSuccessState extends AuthState {
 final String role;
  SignInSuccessState({required this.role});
}
final class SignInFailureState extends AuthState{
  final String errMsg;
  SignInFailureState({required this.errMsg});
}final class ResetPasswordLoadingState extends AuthState {}

final class ResetPasswordSuccessState extends AuthState {}
final class ResetPasswordFailureState extends AuthState{
  final String errMsg;
  ResetPasswordFailureState({required this.errMsg});
}

final class TermsAndConditionsChekBoxState extends AuthState {}

final class ObscurePasswordTextUpdateState extends AuthState {}
