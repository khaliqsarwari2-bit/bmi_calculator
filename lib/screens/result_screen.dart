import 'package:flutter/material.dart';

import 'package:bmi_calculator/constent.dart';
import 'package:bmi_calculator/component/reusable_card.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.type,
    required this.recommendation,
    required this.resultImage,
  });

  final String recommendation;
  final String type;
  final String resultImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('bmi calculator'.toUpperCase())),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text('Your Result', style: kTitleTextStyle),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(type.toUpperCase(), style: kBMITextStyle),
                  Image.asset(resultImage, width: 270, height: 400),
                  Text(
                    recommendation,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
              onPress: () {},
            ),
          ),
        ],
      ),
    );
  }
}
