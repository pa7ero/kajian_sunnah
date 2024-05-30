part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

class RegisterButtonPressed extends RegisterEvent {
  final String name;
  final String email;
  final String password;
  final String password_confirmation;
  final String address;
  final String phone;
  final String gender;

  RegisterButtonPressed({
    required this.name,
    required this.email,
    required this.password,
    required this.password_confirmation,
    required this.address,
    required this.phone,
    required this.gender,
  });
}
