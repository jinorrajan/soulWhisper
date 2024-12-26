import 'package:flutter/material.dart';

import '../widgets/authFillFormWidgets/headingFormTextWidget.dart';
import '../widgets/authFillFormWidgets/secondaryFillFormtextWidget.dart';

class Profilefillformscreen extends StatelessWidget {
  const Profilefillformscreen({super.key});

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return Column(
      children: [
         SizedBox(
          height: size.height * 0.06,
        ),

        // Using HeadingFormTextWidget
        HeadingFillFormText(heading: 'Whats Your Gender',),

        //  Using SecondaryFormTextWidget
         SecondaryFillFormTextWidget(secondaryText:  'Tells about your gender',),
        SizedBox(
          height: size.height * 0.08,
        ),

      ],
    );
  }
}