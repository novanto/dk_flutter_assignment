import 'package:dk_flutter_assignment/modules/onboarding/components/gin_dropdown.dart';
import 'package:dk_flutter_assignment/modules/onboarding/components/onboarding_button.dart';
import 'package:dk_flutter_assignment/modules/onboarding/components/onboarding_hint.dart';
import 'package:dk_flutter_assignment/modules/onboarding/components/onboarding_step.dart';
import 'package:dk_flutter_assignment/modules/onboarding/onboarding_schedule.dart';
import 'package:flutter/material.dart';

class OnboardingPersonalInfo extends StatefulWidget {
  @override
  _OnboardingPersonalInfoPageState createState() => _OnboardingPersonalInfoPageState();
}

class _OnboardingPersonalInfoPageState extends State<OnboardingPersonalInfo> {

  final String defaultOption = '- Choose Option -';

  List<String> _activationItems =  [
    '- Choose Option -',
    'Investment',
    'Asset Diversification',
    'Others'
  ];

  List<String> _incomeItems = [
    '- Choose Option -',
    '< IDR 5.000.000',
    'IDR 5.000.000 - IDR 10.000.000',
    'IDR 10.000.000 - IDR 20.000.000',
    '> IDR 20.000.000'
  ];

  List<String> _expenseItems = [
    '- Choose Option -',
    '< IDR 5.000.000',
    'IDR 5.000.000 - IDR 10.000.000',
    'IDR 10.000.000 - IDR 20.000.000',
    '> IDR 20.000.000'
  ];

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
              OnboardingStep(key: Key("personalInfoStep"), currentStep: 2),
              OnboardingHint(
                key: Key('onboardingPersonalInfoHint'),
                title: 'Personal Information',
                subtitle: 'Please fill in the information below and your goal for digital saving.'
              ),
              Container(
                margin: EdgeInsets.only(top:20, bottom: 20)
              ),
              GinDropdown(
                key: Key('goalDropdown'),
                defaultOption: defaultOption,
                itemList: _activationItems,
                formLabel: 'Goal for Activation'
              ),
              GinDropdown(
                key: Key('incomeDropdown'),
                defaultOption: defaultOption,
                itemList: _incomeItems,
                formLabel: 'Monthly Income'
              ),
              GinDropdown(
                key: Key('expenseDropdown'),
                defaultOption: defaultOption,
                itemList: _expenseItems,
                formLabel: 'Monthly Expense'
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