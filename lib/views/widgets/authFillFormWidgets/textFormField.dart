import 'package:flutter/material.dart';

import '../../../constant/colors.dart';

class Textformfield extends StatelessWidget {
  final String text;
   final TextEditingController controller;
   const Textformfield({super.key, required this.text, required this.controller});

  @override
  Widget build(BuildContext context) {
     bool isNumberField = text.toLowerCase().contains('number');
        bool isDOBField = text.toLowerCase().contains('dob');
    return  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextFormField(
            controller: controller,
             keyboardType: isNumberField ? TextInputType.number : TextInputType.text,
            decoration:  InputDecoration(
              hintText: text,
              
              hintStyle:  const TextStyle(
                color: AppColor.textColor1,
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                  color: AppColor.primaryColor,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(
                  color: AppColor.primaryColor,
                ),
              ),
               suffixIcon: isDOBField
              ? IconButton(
                  icon: const Icon(Icons.calendar_today, color: AppColor.primaryColor),
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null) {
                      controller.text = "${pickedDate.toLocal()}".split(' ')[0];
                    }
                  },
                )
              : null,
            ),
          ),
        );
  }
}