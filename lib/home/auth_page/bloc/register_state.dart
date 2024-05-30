part of 'register_bloc.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final dynamic userData;

  RegisterSuccess(this.userData);
}

class RegisterFailure extends RegisterState {
  final String error;

  RegisterFailure(this.error);
}
