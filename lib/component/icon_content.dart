import 'package:flutter/material.dart';

import 'package:bmi_calculator/constent.dart';

class IconContent extends StatelessWidget {
  const IconContent({super.key, required this.icon, required this.iconText});

  final IconData icon;
  final String iconText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, size: 80),
        SizedBox(height: 15),
        Text(iconText, style: kLableTextStyle),
      ],
    );
  }
}
