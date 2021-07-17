import 'package:dk_flutter_assignment/modules/onboarding/components/onboarding_button.dart';
import 'package:dk_flutter_assignment/modules/onboarding/components/onboarding_hint.dart';
import 'package:dk_flutter_assignment/modules/onboarding/onboarding_schedule.dart';
import 'package:flutter/material.dart';

class OnboardingPersonalInfo extends StatefulWidget {
  @override
  _OnboardingPersonalInfoPageState createState() => _OnboardingPersonalInfoPageState();
}

class _OnboardingPersonalInfoPageState extends State<OnboardingPersonalInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF4E80E8),
        appBar: AppBar(
          title: Text("Create Account"),
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OnboardingHint(
                  key: Key('onboardingPersonalInfoHint'),
                  title: 'Personal Information',
                  subtitle: 'Please fill in the information below and your goal for digital saving.'
              ),
              Container(

              ),
              OnboardingButton(
                  key: Key('onboardingPasswordButton'),
                  text: 'Next',
                  onPressedListener: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return OnboardingSchedule();
                    }));
                  }
              )
            ],
          )
        )
    );
  }
}