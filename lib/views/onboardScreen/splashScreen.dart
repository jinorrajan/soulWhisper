import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:soulwhisper/constant/colors.dart';
import 'package:soulwhisper/views/onboardScreen/onboardingScreen.dart';
import 'package:soulwhisper/views/homeScreen/homeScreen.dart';
import 'package:soulwhisper/bloc/authBloc/auth_bloc.dart';

import '../authFillForm/authFillFormScreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          Get.offAll(() =>  AuthFillFormScreen());
        } else if (state is Unauthenticated) {
          Get.offAll(() => const OnboardingScreen());
        } else if (state is AuthError) {
          Get.offAll(() => const OnboardingScreen());
        }
      },
      child: Scaffold(
        backgroundColor: AppColor.backgrounColor,
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return Center(child: Image.asset('assets/images/logoSW.jpg'));
          },
        ),
      ),
    );
  }
}

