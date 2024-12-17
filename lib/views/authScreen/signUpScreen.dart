// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'package:soulwhisper/constant/colors.dart';
import 'package:soulwhisper/views/authScreen/loginScreen.dart';
import 'package:soulwhisper/views/widgets/customButton1.dart';

import '../../bloc/authBloc/auth_bloc.dart';
import '../authFillForm/authFillFormScreen.dart';
import '../widgets/emailField.dart';
import '../widgets/passwordField.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController conformPasswordController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Form key

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
             if (state is AuthError) {
              print('hello ${state.message}');
              // Show error
              Get.snackbar(
                'Error',
                state.message,
                backgroundColor: Colors.red,
                colorText: Colors.white,
              );
            } else if (state is Authenticated) {
              // Navigate to the home screen
            Get.offAll(() => AuthFillFormScreen());
            }
          },
          builder: (context, state) {
          
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey, // Attach the Form key
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Logo Image
                      Center(child: Image.asset('assets/images/logoSW.jpg')),

                      const SizedBox(height: 20),

                      // Welcome Text
                      const Text(
                        "Welcome ",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: AppColor.textColor1),
                      ),
                      const Text('SignUp to continue'),
                      SizedBox(height: size.height * 0.04),
                      // Email TextFormField
                      EmailField(
                        emailController: emailController,
                        label: "Email",
                        hint: "Enter your email",
                      ),

                      SizedBox(height: size.height * 0.02),

                      // Password TextFormField
                      PasswordField(
                        passwordController: passwordController,
                        label: 'Password',
                        hint: 'Enter your password',
                      ),
                      SizedBox(height: size.height * 0.02),

                      // confirom Password TextFormField
                      PasswordField(
                        passwordController: conformPasswordController,
                        label: 'conform Password',
                        hint: 'Enter your conform password',
                      ),

                      SizedBox(height: size.height * 0.026),

                      // Login Button
                      Center(

                        child: state is AuthLoading
                            ? const CircularProgressIndicator() // Show loading
                            : CustomButton1(
                          text: "SignUp",
                          size: size,
                          onPressed: () {
                           if (_formKey.currentState!.validate()) {
                                    BlocProvider.of<AuthBloc>(context).add(
                                      SignUpRequested(
                                        emailController.text.trim(),
                                        passwordController.text.trim(),
                                        conformPasswordController.text.trim(),
                                      ),
                                    );
                                  }
                          },
                        ),
                      ),

                      SizedBox(height: size.height * 0.018),

                      const Center(
                        child: Text("(or)",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: AppColor.textColor1)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("I have an account? ",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.textColor1)),
                          GestureDetector(
                            onTap: () {
                              Get.off(() => const LoginScreen());
                            },
                            child: const Text("Login",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.primaryColor)),
                          ),
                        ],
                      ),

                      SizedBox(height: size.height * 0.02),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
