import 'package:dk_flutter_assignment/modules/onboarding/components/onboarding_step_item.dart';
import 'package:flutter/material.dart';

class OnboardingStep extends StatelessWidget {

  final int currentStep;

  const OnboardingStep({
    required Key key,
    required this.currentStep
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 4, bottom: 20),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 4,
              color: Colors.black
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                OnboardingStepItem(key: Key("step1"), currentStep: currentStep, stepNumber: 1),
                OnboardingStepItem(key: Key("step2"), currentStep: currentStep, stepNumber: 2),
                OnboardingStepItem(key: Key("step3"), currentStep: currentStep, stepNumber: 3),
                OnboardingStepItem(key: Key("step4"), currentStep: currentStep, stepNumber: 4)
              ],
            )
          ],
        )
    );
  }
}