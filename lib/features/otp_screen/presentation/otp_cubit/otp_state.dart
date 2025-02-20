part of 'otp_cubit.dart';

abstract class OtpState {}

class OtpInitial extends OtpState {}

class OTPSent extends OtpState {}

class OTPVerified extends OtpState {}

class OTPFailed extends OtpState {
  final String error;
  OTPFailed(this.error);
}
