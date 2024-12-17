import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:soulwhisper/constant/colors.dart';

part 'auth_fill_form_event.dart';
part 'auth_fill_form_state.dart';

class AuthFillFormBloc extends Bloc<AuthFillFormEvent, AuthFillFormState> {
  int currentStep = 0;

  AuthFillFormBloc() : super(AuthFillFormInitial()) {
    on<NextPageEvent>((event, emit) {
      // Update current step when the user goes to the next page
      currentStep++;
      double progress = currentStep / 7; // Assuming 7 pages (steps)
      Color progressColor = AppColor.primaryColor;

   

      emit(AuthFillFormProgressUpdated(
        progress: progress,
        progressColor: progressColor,
      ));
    });
  }
}
