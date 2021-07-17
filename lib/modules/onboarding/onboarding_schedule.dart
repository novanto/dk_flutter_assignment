import 'package:dk_flutter_assignment/modules/onboarding/components/onboarding_button.dart';
import 'package:dk_flutter_assignment/modules/onboarding/components/onboarding_hint.dart';
import 'package:dk_flutter_assignment/modules/onboarding/onboarding_success.dart';
import 'package:flutter/material.dart';

class OnboardingSchedule extends StatefulWidget {
  @override
  _OnboardingSchedulePageState createState() => _OnboardingSchedulePageState();
}

class _OnboardingSchedulePageState extends State<OnboardingSchedule> with TickerProviderStateMixin {

  late AnimationController animationController;

  @override
  void initState() {
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 5000),
    );
    animationController.forward();
    animationController.addListener(() {
      setState(() {
        if (animationController.status == AnimationStatus.completed) {
          animationController.repeat();
        }
      });
    });

    super.initState();
  }

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
                Stack(
                  children: [
                    AnimatedBuilder(
                        animation: animationController,
                        child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white24,
                            )
                        ),
                        builder: (BuildContext context, Widget? _widget) {
                          return new Transform.scale(
                            scale: 1.5,
                            child: _widget,
                          );
                        }
                    ),
                    Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.event,
                          color: Color(0xFF4E80E8),
                        )
                    )
                  ],
                ),
                OnboardingHint(
                    key: Key('onboardingScheduleHint'),
                    title: 'Schedule Video Call',
                    subtitle: 'Choose the date and time that you prefer, we will send a link via email to make a video call on the scheduled date and time.'
                ),
                OnboardingButton(
                    key: Key('onboardingPasswordButton'),
                    text: 'Next',
                    onPressedListener: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return OnboardingSuccess();
                      }));
                    }
                )
              ],
            )
        )
    );
  }
}