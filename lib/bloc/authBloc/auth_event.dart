part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  LoginRequested(this.email, this.password);
}

class SignUpRequested extends AuthEvent {
  final String email;
  final String password;
  final String confirmPassword;

  SignUpRequested(this.email, this.password, this.confirmPassword);
}

class LogoutRequested extends AuthEvent {}

class AppStarted extends AuthEvent {}
