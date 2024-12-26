// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class SecondaryFillFormTextWidget extends StatelessWidget {
  String secondaryText;
  SecondaryFillFormTextWidget({
    super.key,
    required this.secondaryText,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
    secondaryText,
     style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            );
  }
}