import 'package:password_gen/features/user_setting/data/local/password_generate.dart';
import 'package:password_gen/features/user_setting/domain/entities/password_settings.dart';
import 'package:password_gen/features/user_setting/domain/reposotories/password_repo.dart';

 class PasswordRepoImp implements PasswordRepo {
  PasswordGenerate passwordGenerate;
  PasswordRepoImp(this.passwordGenerate);
  @override
  String generatePassword(PasswordSettings passwordsettings){
    return passwordGenerate.generatePassword(passwordsettings);
  }
}