part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

// class AppStarted extends LoginEvent {}

class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;

  LoginButtonPressed({required this.email, required this.password});
}

class GetUser extends LoginEvent {
  final String email;
  final String password;

  GetUser({required this.email, required this.password});
}
