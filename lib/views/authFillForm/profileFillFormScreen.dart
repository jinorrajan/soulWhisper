import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soulwhisper/constant/colors.dart';

import '../../bloc/authFillFormBloc/auth_fill_form_bloc.dart';
import '../widgets/authFillFormWidgets/headingFormTextWidget.dart';
import '../widgets/authFillFormWidgets/secondaryFillFormtextWidget.dart';
import '../widgets/authFillFormWidgets/textFormField.dart';

class Profilefillformscreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  Profilefillformscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.04,
          ),

          // Using HeadingFormTextWidget
          HeadingFillFormText(
            heading: 'Upload Profile photo',
          ),

          //  Using SecondaryFormTextWidget
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SecondaryFillFormTextWidget(
              secondaryText:
                  "We'd love to see you. Upload a profile photo for your dating journey.",
            ),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),

          // profile image upload container
          BlocBuilder<AuthFillFormBloc, AuthFillFormState>(
            builder: (context, state) {
              File? image;
              if (state is ImagePickedState) {
                image = state.image;
              }
              return InkWell(
                onTap: () {
                      context.read<AuthFillFormBloc>().add(PickImageEvent());
                    },
                child: Container(
                  width: size.height * 0.3,
                  height: size.width * 0.3,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColor.primaryColor, // Set the border color
                      width: 3, // Set the border width
                    ),
                  ),
                  child:  CircleAvatar(
                    radius: 60,
                    backgroundColor: const Color.fromARGB(255, 253, 238, 255),
                     backgroundImage: image != null ? FileImage(image) : null,
                    child: image == null
                            ?const Icon(
                      Icons.camera_alt,
                      size: 40,
                      color: AppColor.primaryColor,
                    ): null,
                  ),
                ),
              );
            },
          ),

          SizedBox(
            height: size.height * 0.04,
          ),

          //  Name Text Field
          Textformfield(
            text: 'Enter your name',
            controller: nameController,
          ),

          SizedBox(
            height: size.height * 0.03,
          ),
          //  Number  Field
          Textformfield(
              text: 'Enter your number', controller: numberController),
          SizedBox(
            height: size.height * 0.03,
          ),

          //  Date of birth  Field
          Textformfield(text: 'Enter your DOB', controller: dobController),
          SizedBox(
            height: size.height * 0.03,
          ),
        ],
      ),
    );
  }
}
