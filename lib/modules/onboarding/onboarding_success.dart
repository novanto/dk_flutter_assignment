import 'package:dk_flutter_assignment/modules/onboarding/components/onboarding_step.dart';
import 'package:flutter/material.dart';

class OnboardingSuccess extends StatefulWidget {
  @override
  _OnboardingSuccessPageState createState() => _OnboardingSuccessPageState();
}

class _OnboardingSuccessPageState extends State<OnboardingSuccess> with SingleTickerProviderStateMixin {

  late final AnimationController _controller;

  late final Animation<double> _animation;

  @override
  void initState() {
    _controller = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 2000),
    )..repeat();

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF4E80E8),
        body: Center(
          child: Column(
            children: [
              Container(margin: EdgeInsets.only(top:40)),
              OnboardingStep(key: Key("successStep"), currentStep: 4),
              Stack(
                alignment: Alignment.center,
                children: [
                  ScaleTransition(
                      scale: _animation,
                      child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white24,
                          )
                      )
                  ),
                  Container(
                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.check_circle,
                        size: 120,
                        color: Color(0xFF4E80E8),
                      )
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  'Schedule successfully created!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w500
                  ),
                ),
              )
            ],
          )
        )
    );
  }
}