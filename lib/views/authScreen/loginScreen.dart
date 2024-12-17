// ignore_for_file: file_names


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:soulwhisper/constant/colors.dart';
import 'package:soulwhisper/views/authScreen/signUpScreen.dart';
import 'package:soulwhisper/views/homeScreen/homeScreen.dart';
import 'package:soulwhisper/views/widgets/customButton1.dart';
import '../../bloc/authBloc/auth_bloc.dart';
import '../widgets/emailField.dart';
import '../widgets/passwordField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthError) {
              // Show error
              Get.snackbar(
                'Error',
                state.message,
                backgroundColor: Colors.red,
                colorText: Colors.white,
              );
            } else if (state is Authenticated) {
              // Navigate to the home screen
            Get.offAll(() => const Homescreen());
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: Image.asset('assets/images/logoSW.jpg')),
                      const SizedBox(height: 20),
                      const Text(
                        "Welcome Back",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: AppColor.textColor1),
                      ),
                      const Text('Login to continue'),
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
                      SizedBox(height: size.height * 0.026),
                      Center(
                        child: state is AuthLoading
                            ? const CircularProgressIndicator() // Show loading
                            : CustomButton1(
                                text: "Login",
                                size: size,
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    BlocProvider.of<AuthBloc>(context).add(
                                      LoginRequested(
                                        emailController.text.trim(),
                                        passwordController.text.trim(),
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
                      const Center(
                        child: Text("Create an account",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: AppColor.textColor1)),
                      ),
                      SizedBox(height: size.height * 0.02),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Get.off(() => const Signupscreen());
                          },
                          child: Container(
                            height: size.height * 0.06,
                            width: size.width * 0.8,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColor.primaryColor),
                              borderRadius: BorderRadius.circular(28),
                            ),
                            child: const Center(
                              child: Text(
                                "SignUp",
                                style: TextStyle(
                                    color: AppColor.primaryColor, fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ),
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
