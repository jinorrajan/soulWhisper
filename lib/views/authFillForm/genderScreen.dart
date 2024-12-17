import 'package:flutter/material.dart';

import '../../constant/colors.dart';

class Genderscreen extends StatelessWidget {
  const Genderscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

     return Column(
      children: [
        SizedBox(
          height: size.height * 0.06,
        ),
        const Text(
          'Whats Your Gender',
          style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
        ),
        const Text(
          'Tells about your gender',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
        ),
        SizedBox(
          height: size.height * 0.08,
        ),
        Wrap(
        spacing: 50,
        runSpacing: 40,

          children: [
            _buildGenderContainer(size,"🙋‍♂️  Male"),
            
            _buildGenderContainer(size,"🙋‍♀️  Female"),

            _buildGenderContainer(size,"⚧️  Trans"),

            _buildGenderContainer(size,"🌈  Others"),



            ],
        )
      ],
    );
  }


// Gender Container widget
  Widget _buildGenderContainer(Size size , String text) {
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.36,
      decoration: BoxDecoration(
          color: AppColor.secondaryColor,
          borderRadius: BorderRadius.circular(15)),
      child:  Center(
          child: Text(text,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500))),
    );
  }
}