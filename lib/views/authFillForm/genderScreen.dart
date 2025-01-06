// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soulwhisper/bloc/authFillFormBloc/auth_fill_form_bloc.dart';
import '../../constant/colors.dart';
import '../../data/repo/formFillReop.dart';
import '../widgets/authFillFormWidgets/headingFormTextWidget.dart';
import '../widgets/authFillFormWidgets/secondaryFillFormtextWidget.dart';

class Genderscreen extends StatelessWidget {
  const Genderscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
     final formFillRepo = Formfillreop();

    return BlocProvider(
      create: (context) => AuthFillFormBloc(formFillRepo: formFillRepo),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.06,
          ),

          // Using HeadingFormTextWidget
          HeadingFillFormText(
            heading: 'Whats Your Gender',
          ),

          //  Using SecondaryFormTextWidget
          SecondaryFillFormTextWidget(
            secondaryText: 'Tells about your gender',
          ),
          SizedBox(
            height: size.height * 0.08,
          ),

          Wrap(
            spacing: 50,
            runSpacing: 40,
            children: [
              // GenderContainer widget
              _buildGenderContainer(size, "🙋‍♂️  Male"),

              _buildGenderContainer(size, "🙋‍♀️  Female"),

              _buildGenderContainer(size, "⚧️  Trans"),

              _buildGenderContainer(size, "🌈  Others"),
            ],
          )
        ],
      ),
    );
  }

// Gender Container widget
  Widget _buildGenderContainer(Size size, String text) {
    return BlocBuilder<AuthFillFormBloc, AuthFillFormState>(
      builder: (context, state) {
         bool isSelected = false;
        if (state is GenderSelectionState) {
          isSelected = state.selectedGender == text;
        }
        return GestureDetector(
           onTap: () {
            context.read<AuthFillFormBloc>().add(GenderSelectionEvent(text));
          },
          child: Container(
            height: size.height * 0.08,
            width: size.width * 0.36,
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.primaryColor, width: 0.8),
                color: isSelected ? AppColor.primaryColor : AppColor.backgrounColor,
                borderRadius: BorderRadius.circular(14)),
            child: Center(
                child: Text(text,
                    style:  TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500,color: isSelected ? AppColor.backgrounColor : AppColor.primaryColor))),
          ),
        );
      },
    );
  }
}
