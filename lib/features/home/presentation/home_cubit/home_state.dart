part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}
 final class UploadProfilePic extends HomeState {}
  final class UploadProfilePicError extends HomeState {
      final String errorMsg;

  UploadProfilePicError({required this.errorMsg});

  }

class ProfileLoggedOut extends HomeState {} 
class HomeLogOutError extends HomeState {

  final String errorMsg;

  HomeLogOutError({required this.errorMsg});
}
class UserLoadingState extends HomeState {} 

class UserLoadedState extends HomeState {
   final String firstName;
  UserLoadedState(this.firstName);
} 
class UserErrorState extends HomeState {
  final String errorMsg;

  UserErrorState({required this.errorMsg});
} 
class PasswordHiddenState extends HomeState {}

class PasswordFetchedState extends HomeState {
  final String password;
  PasswordFetchedState({required this.password});
}
class PasswordVisibleState extends HomeState {}
class LastPasswordLoading extends HomeState {}

class LastPasswordVisible extends HomeState {
  final String password;
  LastPasswordVisible(this.password);
}

class LastPasswordError extends HomeState {
  final String message;
  LastPasswordError(this.message);
}