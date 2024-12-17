
import 'package:flutter/material.dart';

import '../../constant/colors.dart';

class EmailField extends StatelessWidget {
  final TextEditingController? emailController;
  final String? label;
  final String? hint;
  const EmailField({super.key, this.emailController, this.label, this.hint});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: const Icon(
          Icons.email,
          color: AppColor.primaryColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: AppColor.primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: AppColor.primaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Email is required";
        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          return "Enter a valid email address";
        }
        return null;
      },
    );
  }
}
