// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soulwhisper/bloc/authFillFormBloc/auth_fill_form_bloc.dart';
import 'package:soulwhisper/constant/colors.dart';

import 'genderScreen.dart';

class AuthFillFormScreen extends StatefulWidget {
  const AuthFillFormScreen({super.key});

  @override
  _AuthFillFormScreenState createState() => _AuthFillFormScreenState();
}

class _AuthFillFormScreenState extends State<AuthFillFormScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => AuthFillFormBloc(),
          child: BlocBuilder<AuthFillFormBloc, AuthFillFormState>(
            builder: (context, state) {
              double progress = 0.0;
              Color progressColor = AppColor.primaryColor;

              // If the state is FormProgressUpdated, get the progress and color
              if (state is AuthFillFormProgressUpdated) {
                progress = state.progress;
                progressColor = state.progressColor;
              }

              return Column(
                children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  // Progress Bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: LinearProgressIndicator(
                      minHeight: size.height * 0.01,
                      value: progress,
                      backgroundColor: AppColor.secondaryColor,
                      valueColor: AlwaysStoppedAnimation(progressColor),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),

                  // PageView with form pages
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (page) {
                        setState(() {
                          currentPage = page;
                        });
                      },
                      children: [
                       const  Genderscreen(),
                        _buildHabitsPage(),
                        _buildPage('Page 3'),
                        _buildPage('Page 4'),
                        _buildPage('Page 5'),
                        _buildPage('Page 6'),
                        _buildPage('Page 7'),
                      ],
                    ),
                  ),

                  // Continue Button
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      width: size.width*0.8,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primaryColor
                        ),
                        onPressed: () {
                          if (currentPage < 6) {
                            // Move to the next page
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                            context.read<AuthFillFormBloc>().add(NextPageEvent());
                          } else {
                            // Form is completed
                            print('Form Submitted');
                          }
                        },
                        child: Text(currentPage < 6 ? 'Continue' : 'Submit',style: const TextStyle(color: AppColor.backgrounColor),),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

 
  Widget _buildHabitsPage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Select Habits'),
          CheckboxListTile(
            title: Text('Smoking'),
            value: false,
            onChanged: (value) {},
          ),
          CheckboxListTile(
            title: Text('Drinking'),
            value: false,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }

  Widget _buildPage(String title) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title),
        ],
      ),
    );
  }
}
