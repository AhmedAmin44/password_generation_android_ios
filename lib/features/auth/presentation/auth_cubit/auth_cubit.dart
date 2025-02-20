import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_gen/core/function/custom_troast.dart';
import 'package:password_gen/features/otp_screen/presentation/otp_cubit/otp_cubit.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  String? firstName;
  String? lastName;
  String? emailAddress;
  String? password;
  String? phone;
  String verificationId = '';
  String? otpCode;
  String? verifyPassword;

  bool obscureVerifyPasswordTextValue = true;
  bool? termsAndConditionsChekBox = false;
  bool? obscurePasswordTextValue = true;
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  GlobalKey<FormState> signInFormKey = GlobalKey();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  OtpCubit otpCubit = OtpCubit();

  Future<void> signUpWithEmailAndPassword() async {
    try {
      emit(SignUpLoadingState());

      final UserCredential credential =
          await _auth.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );

      String uid = credential.user!.uid;

      // Retrieve user Email from Firestore
      await addUserProfile(uid);
      emailAddress = await getUserEmail(uid);

      await otpCubit.sendOTP();
      await sendVerificationEmail();
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      _handleSignUpException(e);
    } catch (e) {
      emit(SignUpFailureState(errmsg: e.toString()));
    }
  }

  void _handleSignUpException(FirebaseAuthException e) {
    if (e.code == 'weak-password') {
      emit(SignUpFailureState(errmsg: 'The password provided is too weak.'));
    } else if (e.code == 'email-already-in-use') {
      emit(SignUpFailureState(
          errmsg: 'The account already exists for that email.'));
    } else if (e.code == 'invalid-email') {
      emit(SignUpFailureState(errmsg: 'The Email is Invalid.'));
    } else {
      emit(SignUpFailureState(errmsg: e.code));
    }
  }

  void obscureVerifyPasswordText() {
    obscureVerifyPasswordTextValue = !obscureVerifyPasswordTextValue;
    emit(AuthInitial());
  }

  Future<String?> getUserEmail(String uid) async {
    DocumentSnapshot userDoc =
        await _firestore.collection("users").doc(uid).get();
    if (userDoc.exists && userDoc.data() != null) {
      return userDoc['email'];
    }
    return null;
  }

  Future<void> sendVerificationEmail() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null && !user.emailVerified) {
      try {
        // 🔹 Prevent spam by checking last send time
        DateTime? lastEmailSent = user.metadata.lastSignInTime;
        if (lastEmailSent != null &&
            DateTime.now().difference(lastEmailSent).inMinutes < 5) {
          ShowToast(
              "Please wait before requesting another verification email.");
          return;
        }

        await user.sendEmailVerification();
        ShowToast("Verification email sent! Check your inbox.");
      } on FirebaseAuthException catch (e) {
        if (e.code == "too-many-requests") {
          ShowToast("Too many requests. Try again later.");
        } else {
          ShowToast("Error: ${e.message}");
        }
      }
    }
  }

  Future<void> signInWithEmailAndPassword() async {
    try {
      emit(SignInLoadingState());

      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailAddress ?? '',
        password: password ?? '',
      );

      if (userCredential.user == null) {
        emit(SignInFailureState(errMsg: "Authentication failed."));
        return;
      }

      User? user = _auth.currentUser;
      if (user == null) {
        emit(SignInFailureState(errMsg: "User not found."));
        return;
      }

      // 🔹 Fetch user role from Firestore
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (!userDoc.exists) {
        emit(SignInFailureState(errMsg: "User data not found."));
        return;
      }

      String role = userDoc['role'] ?? 'user';
      emailAddress = user.email;

      // 🔹 Send OTP before proceeding
      await otpCubit.sendOTP();

      // 🔹 Emit OTPSentState instead of navigating here
      emit(OTPSentState(role: role));
    } on FirebaseAuthException catch (e) {
      emit(SignInFailureState(
          errMsg: e.message ?? "Check your email and password."));
    } catch (e) {
      emit(SignInFailureState(errMsg: e.toString()));
    }
  }

  Future<void> addUserProfile(String uid) async {
    await _firestore.collection("users").doc(uid).set({
      "first_name": firstName,
      "last_name": lastName,
      "email": emailAddress,
      "phone": phone,
      "role": "user",
    });
  }

  String formatPhoneNumber(String phone) {
    String cleaned = phone.replaceAll(RegExp(r'[^\d+]'), '');
    if (!cleaned.startsWith('+')) {
      cleaned = '+20$cleaned';
    }
    return cleaned;
  }

  Future<void> resetPasswordWithLink() async {
    try {
      emit(ResetPasswordLoadingState());
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailAddress ?? '');
      emit(ResetPasswordSuccessState());
    } catch (e) {
      emit(ResetPasswordFailureState(errMsg: e.toString()));
    }
  }

  void updateTermsAndConditionsChekBox({newValue}) {
    termsAndConditionsChekBox = newValue;
    emit(TermsAndConditionsChekBoxState());
  }

  void obscurePasswordText() {
    if (obscurePasswordTextValue == true) {
      obscurePasswordTextValue = false;
    } else {
      obscurePasswordTextValue = true;
    }
    emit(ObscurePasswordTextUpdateState());
  }
}

class OTPSentState extends AuthState {
  final String role;
  OTPSentState({required this.role});
}
