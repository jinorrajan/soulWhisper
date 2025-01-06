part of 'auth_fill_form_bloc.dart';

@immutable
abstract class AuthFillFormEvent extends Equatable {
  const AuthFillFormEvent();

  @override
  List<Object?> get props => [];
}

/// Event to update a specific field in the form
class UpdateFormDataEvent extends AuthFillFormEvent {
  final String key;
  final dynamic value;

   const UpdateFormDataEvent({required this.key, required this.value});

  @override
  List<Object?> get props => [key, value];
}

/// Event to submit the form data
class SubmitFormDataEvent extends AuthFillFormEvent {}

// Event to navigate to the next page
class NextPageEvent extends AuthFillFormEvent {}

// Event to select gender
class GenderSelectionEvent extends AuthFillFormEvent{
  final String gender;
  const GenderSelectionEvent(this.gender);
}

// Event to pick an image
class PickImageEvent extends AuthFillFormEvent {}