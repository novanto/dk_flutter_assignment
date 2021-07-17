import 'package:flutter/material.dart';

class OnboardingStepItem extends StatelessWidget {

  final int currentStep;

  final int stepNumber;

  const OnboardingStepItem({
    required Key key,
    required this.currentStep,
    required this.stepNumber
  }) : super(key: key);

  Color getBgColor() {
    if (currentStep == stepNumber) {
      return Colors.green;
    } else {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          alignment: Alignment.center,
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: getBgColor(),
              border: Border.all(color: Colors.black, width: 2)
          ),
          child: Text(
            stepNumber.toString(),
            style: TextStyle(
                fontSize: 24,
                color: Colors.black
            ),
          )
      )
    );
  }

}