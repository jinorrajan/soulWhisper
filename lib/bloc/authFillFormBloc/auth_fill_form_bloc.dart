import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

import 'package:soulwhisper/constant/colors.dart';
import '../../data/repo/formFillReop.dart';

part 'auth_fill_form_event.dart';
part 'auth_fill_form_state.dart';

class AuthFillFormBloc extends Bloc<AuthFillFormEvent, AuthFillFormState> {
  final Formfillreop formFillRepo; // Repository for saving data
  int currentStep = 0;

  AuthFillFormBloc({required this.formFillRepo}) : super(AuthFillFormInitial(formData: {})) {
    // Event listeners
    on<UpdateFormDataEvent>(_onUpdateFormData);
    on<SubmitFormDataEvent>(_onSubmitFormData);
    on<NextPageEvent>(_onNextPage);
    on<GenderSelectionEvent>(_onGenderSelection);
    on<PickImageEvent>(_onPickImage);
  }

  /// Handles updating form data
  void _onUpdateFormData(
      UpdateFormDataEvent event, Emitter<AuthFillFormState> emit) {
    if (state is AuthFillFormInitial) {
      final currentFormData =
          Map<String, dynamic>.from((state as AuthFillFormInitial).formData);
      currentFormData[event.key] = event.value;

      emit((state as AuthFillFormInitial).copyWith(formData: currentFormData));
    }
  }

  /// Handles form submission
  Future<void> _onSubmitFormData(
      SubmitFormDataEvent event, Emitter<AuthFillFormState> emit) async {
    try {
      emit(AuthFillFormLoadingState());
      if (state is AuthFillFormInitial) {
        final formData = (state as AuthFillFormInitial).formData;

        // Replace with dynamic user ID logic
        final userId = "user-id";

        // Save form data using the repository
        await formFillRepo.saveFormData(userId, formData);

        // Emit success state
        emit(AuthFillFormSubmissionSuccess());
      }
    } catch (e) {
      // Emit failure state with error message
      emit(AuthFillFormSubmissionFailure(errorMessage: e.toString()));
    }
  }

  /// Handles next page navigation
  void _onNextPage(NextPageEvent event, Emitter<AuthFillFormState> emit) {
    currentStep++;
    double progress = currentStep / 7; // Assuming 7 steps/pages
    Color progressColor = AppColor.primaryColor;

    emit(AuthFillFormProgressUpdated(
      progress: progress,
      progressColor: progressColor,
    ));
  }

  /// Handles gender selection
  void _onGenderSelection(
      GenderSelectionEvent event, Emitter<AuthFillFormState> emit) {
    emit(GenderSelectionState(event.gender));
  }

   /// Handles image picking event
  /// Handles image picking event
  Future<void> _onPickImage(PickImageEvent event, Emitter<AuthFillFormState> emit) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final File imageFile = File(pickedFile.path);
        final File? compressedImage = (await _compressImage(imageFile)) as File?;

        if (compressedImage != null) {
          print('Image picked and compressed: ${compressedImage.path}');
          emit(ImagePickedState(compressedImage));
        } else {
          print('Failed to compress image');
          emit(AuthFillFormInitial(formData: {})); // Emit initial state if compression fails
        }
      } else {
        print('No image picked');
        emit(AuthFillFormInitial(formData: {})); // Emit initial state if no image is picked
      }
    } catch (e) {
      print('Error picking image: $e');
      emit(AuthFillFormInitial(formData: {})); // Emit initial state on error
    }
  }

  /// Compresses the image to ensure it is 300x300 pixels
  Future<XFile?> _compressImage(File file) async {
    final result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      file.absolute.path + '_compressed.jpg',
      quality: 85,
      minWidth: 300,
      minHeight: 300,
    );

    if (result != null) {
      return result;
    } else {
      return null;
    }
  }

}
