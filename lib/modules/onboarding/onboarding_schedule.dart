import 'package:flutter/material.dart';

class OnboardingSchedule extends StatefulWidget {
  @override
  _OnboardingSchedulePageState createState() => _OnboardingSchedulePageState();
}

class _OnboardingSchedulePageState extends State<OnboardingSchedule> {
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
              children: [
                Expanded(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return OnboardingSchedule();
                              }));
                            },
                            child: const Text("Next")
                        )
                    )
                )
              ],
            )
        )
    );
  }
}