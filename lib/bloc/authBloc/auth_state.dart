part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class Unauthenticated extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final UserModel user;

  Authenticated(this.user);
}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}
