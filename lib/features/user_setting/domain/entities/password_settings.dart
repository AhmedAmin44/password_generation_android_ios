class PasswordSettings {
  final int passwordLength;
  final bool isLowerCase;
  final bool isUpperCase;
  final bool isNumbers;
  final bool symbols;
  final bool isExcludeDuplicate;
  final bool isIncludeSpaces;

  PasswordSettings({required this.passwordLength, required this.isLowerCase, required this.isUpperCase, required this.isNumbers, required this.symbols, required this.isExcludeDuplicate, required this.isIncludeSpaces});
}