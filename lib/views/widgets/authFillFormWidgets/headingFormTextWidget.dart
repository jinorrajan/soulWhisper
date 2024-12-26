// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class HeadingFillFormText extends StatelessWidget {
  String heading;
   HeadingFillFormText({
    super.key,
    required this.heading,
  });

  @override
  Widget build(BuildContext context) {
    return  Text(
      heading,
      style: const TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
    );
  }
}