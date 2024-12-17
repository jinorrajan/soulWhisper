
import 'package:flutter/material.dart';

import '../../constant/colors.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController? passwordController;
  final String? label;
  final String? hint;

  PasswordField({
    Key? key,
    this.passwordController,
    this.label,
    this.hint,
  }) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true; // State to manage obscure text

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.passwordController,
      obscureText: _obscureText, // Use the local state
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: AppColor.primaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: AppColor.primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: AppColor.primaryColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.red),
        ),
        labelText: widget.label,
        hintText: widget.hint,
        prefixIcon: const Icon(
          Icons.lock,
          color: AppColor.primaryColor,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: AppColor.primaryColor,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText; // Toggle the local state
            });
          },
        ),
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Password is required";
        } else if (value.length < 6) {
          return "Password must be at least 6 characters long";
        }
        return null;
      },
    );
  }
}
