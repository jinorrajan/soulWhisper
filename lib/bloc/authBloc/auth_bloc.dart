import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:soulwhisper/models/userModeel.dart';

import '../../data/repo/authRepo.dart';


part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(Unauthenticated()) {
    on<LoginRequested>(_onLoginRequested);
    on<SignUpRequested>(_onSignUpRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<AppStarted>(_onAppStarted);
  }

  // Handle Login
  void _onLoginRequested(LoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await authRepository.loginWithEmailAndPassword(
        event.email,
        event.password,
      );
      if (user != null) {
        emit(Authenticated(user));
      } else {
        emit(AuthError("Login failed. User not found."));
      }
    } catch (e) {
      print('${AuthError("Login error: ${e.toString()}")}');
      emit(AuthError("Login error: ${e.toString()}"));
    }
  }

  // Handle Sign-Up
  void _onSignUpRequested(SignUpRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      if (event.password.length < 6) {
        throw Exception("Password must be at least 6 characters long.");
      }
      if (event.password != event.confirmPassword) {
        throw Exception("Passwords do not match.");
      }

      final user = await authRepository.signUpWithEmailAndPassword(
        event.email,
        event.password,
      );
      if (user != null) {
        emit(Authenticated(user));
      } else {
        emit(AuthError("Sign-up failed. Please try again."));
      }
    } catch (e) {
      emit(AuthError("Sign-up error: ${e.toString()}"));
    }
  }

  // Handle Logout
  void _onLogoutRequested(LogoutRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await authRepository.logout();
      emit(Unauthenticated());
    } catch (e) {
      emit(AuthError("Logout error: ${e.toString()}"));
    }
  }

  // Handle App Started
  void _onAppStarted(AppStarted event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await authRepository.getCurrentUser();
      if (user != null) {
        emit(Authenticated(user));
      } else {
        emit(Unauthenticated());
      }
    } catch (e) {
      emit(AuthError("Error: ${e.toString()}"));
    }
  }
}
