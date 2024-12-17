import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:soulwhisper/bloc/authBloc/auth_bloc.dart';
import 'package:soulwhisper/views/authScreen/loginScreen.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Trigger the logout event using BLoC
              BlocProvider.of<AuthBloc>(context).add(LogoutRequested());
            },
          ),
        ],
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          // Check if the user is logged out
          if (state is Unauthenticated) {
            // Redirect to the login screen after logging out
            Get.offAll(() => const LoginScreen());
          }
        },
        child: const Center(
          child: Text('Welcome to the Home Screen'),
        ),
      ),
    );
  }
}
