import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({super.key, required this.onTap, required this.icon});

  final IconData icon;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
      onPressed: onTap,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      child: Icon(icon),
    );
  }
}
