import 'package:flutter/material.dart';

import 'package:bmi_calculator/constent.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    required this.bottomTitle,
    required this.onPress,
  });
  final String bottomTitle;
  final void Function() onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Center(child: Text(bottomTitle, style: kLargeButtonTextStyle)),
        decoration: BoxDecoration(
          color: kBottomContainerColour,
          borderRadius: BorderRadius.circular(70),
        ),
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 13.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
