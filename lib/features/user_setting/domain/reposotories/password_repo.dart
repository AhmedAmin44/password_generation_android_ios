import 'package:password_gen/features/user_setting/domain/entities/password_settings.dart';

abstract class PasswordRepo {
  String generatePassword(PasswordSettings passwordsettings);
}