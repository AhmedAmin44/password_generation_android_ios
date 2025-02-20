import 'package:password_gen/core/use_case/use_case.dart';
import 'package:password_gen/features/user_setting/domain/entities/password_settings.dart';
import 'package:password_gen/features/user_setting/domain/reposotories/password_repo.dart';

class PasswordUseCase implements UseCase<String,PasswordSettings>{
  final PasswordRepo passwordRepo;
  PasswordUseCase(this.passwordRepo);
  @override
  String call(PasswordSettings params) {
    return passwordRepo.generatePassword(params);
  }
} 