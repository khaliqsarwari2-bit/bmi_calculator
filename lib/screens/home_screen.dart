import 'package:flutter/material.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/component/bottom_button.dart';
import 'package:bmi_calculator/component/icon_content.dart';
import 'package:bmi_calculator/component/reusable_card.dart';
import 'package:bmi_calculator/constent.dart';
import 'package:bmi_calculator/component/round_icon_button.dart';
import 'package:bmi_calculator/screens/result_screen.dart';

enum Gender { male, female }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Gender? _selectedGender;
  int height = 180;
  int weight = 60;
  int age = 26;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('bim calculator'.toUpperCase())),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        _selectedGender = Gender.male;
                      });
                    },
                    color: _selectedGender == Gender.male
                        ? kInactiveCardColor
                        : kActiveCardColor,

                    childCard: IconContent(icon: Icons.male, iconText: 'MALE'),
                  ),
                ),

                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        _selectedGender = Gender.female;
                      });
                    },
                    color: _selectedGender == Gender.female
                        ? kInactiveCardColor
                        : kActiveCardColor,

                    childCard: IconContent(
                      icon: Icons.female,
                      iconText: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              onPress: () {},
              color: kActiveCardColor,
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('height', style: kLableTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kLargeNumberText),
                      Text('CM', style: kLableTextStyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTickMarkColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 140,
                      max: 220,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {},
                    color: kActiveCardColor,
                    childCard: Column(
                      children: [
                        Text('WEIGHT', style: kLableTextStyle),
                        Text(weight.toString(), style: kLargeNumberText),
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onTap: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              icon: Icons.minimize_outlined,
                            ),
                            SizedBox(width: 8),
                            RoundIconButton(
                              onTap: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              icon: Icons.add,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {},
                    color: kActiveCardColor,
                    childCard: Column(
                      children: [
                        Text('AGE', style: kLableTextStyle),
                        Text(age.toString(), style: kLargeNumberText),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onTap: () {
                                setState(() {
                                  age--;
                                });
                              },
                              icon: Icons.minimize_outlined,
                            ),
                            SizedBox(width: 8),
                            RoundIconButton(
                              onTap: () {
                                setState(() {
                                  age++;
                                });
                              },
                              icon: Icons.add,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            bottomTitle: 'Calculate Your BMI',
            onPress: () {
              CalculatorBrain cal = CalculatorBrain(
                weight: weight,
                height: height,
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => ResultScreen(
                    type: cal.calculateBMI(),
                    recommendation: cal.getInterpretation(),
                    resultImage: cal.getImageResult(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
