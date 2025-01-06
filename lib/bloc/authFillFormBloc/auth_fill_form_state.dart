part of 'auth_fill_form_bloc.dart';

@immutable
abstract class AuthFillFormState  extends Equatable {
  const AuthFillFormState();

  @override
  List<Object?> get props => [];
}

/// Initial state holding the form data
class AuthFillFormInitial extends AuthFillFormState {
  final Map<String, dynamic> formData;

  AuthFillFormInitial({required this.formData});

  AuthFillFormInitial copyWith({Map<String, dynamic>? formData}) {
    return AuthFillFormInitial(
      formData: formData ?? this.formData,
    );
  }

  @override
  List<Object?> get props => [formData];
}


/// State for indicating submission success
class AuthFillFormSubmissionSuccess extends AuthFillFormState {}

/// State for indicating submission failure
class AuthFillFormSubmissionFailure extends AuthFillFormState {
  final String errorMessage;

  AuthFillFormSubmissionFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class AuthFillFormProgressUpdated extends AuthFillFormState {
  final double progress; // Progress (0 to 1)
  final Color progressColor; // Progress color based on step

  const AuthFillFormProgressUpdated({
    required this.progress,
    required this.progressColor,
  });
}

class GenderSelectionState extends AuthFillFormState{
  final String selectedGender;
  const GenderSelectionState(this.selectedGender);
}

// State for indicating image picked
class ImagePickedState extends AuthFillFormState {
  final File image;

  const ImagePickedState(this.image);

  @override
  List<Object> get props => [image];
}

/// State for loading
class AuthFillFormLoadingState extends AuthFillFormState {}
