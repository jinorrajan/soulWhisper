part of 'auth_fill_form_bloc.dart';

@immutable
abstract class AuthFillFormState {}

final class AuthFillFormInitial extends AuthFillFormState {}

class AuthFillFormProgressUpdated extends AuthFillFormState {
  final double progress; // Progress (0 to 1)
  final Color progressColor; // Progress color based on step

  AuthFillFormProgressUpdated({
    required this.progress,
    required this.progressColor,
  });
}
