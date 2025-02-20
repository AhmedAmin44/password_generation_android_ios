part of 'setting_cubit.dart';

class PasswordGenerateState {
  final int passwordLength;
  final int maxPasswordLength;
  final bool isLowerCase;
  final bool isUpperCase;
  final bool isNumbers;
  final bool isSymbols;
  final bool isExcludeDuplicate;
  final bool isIncludeSpaces;
  final TextEditingController passwordController;
  final int remainingTime;

  PasswordGenerateState(
      {required this.passwordLength,
      required this.maxPasswordLength,
      required this.isLowerCase,
      required this.isUpperCase,
      required this.isNumbers,
      required this.isSymbols,
      required this.isExcludeDuplicate,
      required this.isIncludeSpaces,
      required this.passwordController,
      required this.remainingTime});
  factory PasswordGenerateState.initial() => PasswordGenerateState(
      passwordLength: 10,
      maxPasswordLength: 18,
      isLowerCase: false,
      isUpperCase: false,
      isNumbers: false,
      isSymbols: false,
      isExcludeDuplicate: false,
      isIncludeSpaces: false,
      passwordController: TextEditingController(text: ""),
      remainingTime: 0);
  PasswordGenerateState copyWith({
    int? passwordLength,
    int? maxPasswordLength,
    bool? isLowerCase,
    bool? isUpperCase,
    bool? isNumbers,
    bool? isSymbols,
    bool? isExcludeDuplicate,
    bool? isIncludeSpaces,
    String? password,
    int? remainingTime,
  }) =>
      PasswordGenerateState(
          passwordLength: passwordLength ?? this.passwordLength,
          maxPasswordLength: maxPasswordLength ?? this.maxPasswordLength,
          isLowerCase: isLowerCase ?? this.isLowerCase,
          isUpperCase: isUpperCase ?? this.isUpperCase,
          isNumbers: isNumbers ?? this.isNumbers,
          isSymbols: isSymbols ?? this.isSymbols,
          isExcludeDuplicate: isExcludeDuplicate ?? this.isExcludeDuplicate,
          isIncludeSpaces: isIncludeSpaces ?? this.isIncludeSpaces,
          passwordController: password != null
              ? TextEditingController(
                  text: password,
                )
              : passwordController,
          remainingTime: remainingTime ?? this.remainingTime);
}
