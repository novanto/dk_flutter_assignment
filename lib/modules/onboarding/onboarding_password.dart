import 'package:dk_flutter_assignment/modules/onboarding/components/onboarding_button.dart';
import 'package:dk_flutter_assignment/modules/onboarding/components/onboarding_step.dart';
import 'package:dk_flutter_assignment/modules/onboarding/onboarding_personal_information.dart';
import 'package:flutter/material.dart';

import 'components/onboarding_hint.dart';
import 'components/password_requirement.dart';

class OnboardingPassword extends StatefulWidget {
  @override
  _OnboardingPasswordPageState createState() => _OnboardingPasswordPageState();
}

class _OnboardingPasswordPageState extends State<OnboardingPassword> {

  final _passwordFormKey = GlobalKey<FormState>();

  bool _isPasswordHidden = true;

  bool _isFirstCriteriaFulfilled = false;

  bool _isSecondCriteriaFulfilled = false;

  bool _isThirdCriteriaFulfilled = false;

  bool _isFourthCriteriaFulfilled = false;

  String passwordStrength = "";

  Color strengthColor = Colors.amber;

  void _togglePasswordVisiblity() {
      setState(() {
        _isPasswordHidden = !_isPasswordHidden;
      });
  }

  void _verifyPassword(String value) {
    int currentStrength = 0;

    setState(() {
      if (value.length >= 9) {
        currentStrength++;
        _isFourthCriteriaFulfilled = true;
      } else {
        _isFourthCriteriaFulfilled = false;
      }

      if (RegExp(r"(?=.*[A-Z])\w+").hasMatch(value)) {
        currentStrength++;
        _isSecondCriteriaFulfilled = true;
      } else {
        _isSecondCriteriaFulfilled = false;
      }

      if (RegExp(r"(?=.*[a-z])\w+").hasMatch(value)) {
        currentStrength++;
        _isFirstCriteriaFulfilled = true;
      } else {
        _isFirstCriteriaFulfilled = false;
      }

      if (RegExp(r"(?=.*[0-9])\w+").hasMatch(value)) {
        currentStrength++;
        _isThirdCriteriaFulfilled = true;
      } else {
        _isThirdCriteriaFulfilled = false;
      }

      if (currentStrength == 1) {
        strengthColor = Colors.red;
        passwordStrength = "Very Weak";
      } else if (currentStrength == 2) {
        strengthColor = Colors.orange;
        passwordStrength = "Weak";
      } else if (currentStrength == 3) {
        strengthColor = Colors.amber;
        passwordStrength = "Moderate";
      } else if (currentStrength == 4) {
        strengthColor = Colors.lightGreen;
        passwordStrength = "Strong";
      }
    });

  }

  @override
  void initState() {
      _isPasswordHidden = true;
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
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            OnboardingStep(key: Key("passwordStep"), currentStep: 1),
            OnboardingHint(
                key: Key('onboardingPasswordHint'),
                title: 'Create Password',
                subtitle: 'Password will be used to login to account'
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0)
              ),
              child: Form(
                  key: _passwordFormKey,
                  child: TextFormField(
                      style: TextStyle(color: Colors.black87,),
                      onChanged: (String value) {
                        _verifyPassword(value);
                      },
                      decoration: InputDecoration(
                        hintText: 'Create Password',
                        contentPadding: EdgeInsets.all(12),
                        suffixIcon: IconButton(
                            icon: Icon(
                                _isPasswordHidden ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                color: Color(0xFF4E80E8),
                                size: 24
                            ),
                            onPressed: _togglePasswordVisiblity
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      obscureText: _isPasswordHidden,
                      validator: (String? value) {
                        return isValidPassword(value);
                      }
                  )
              )
            ),
            Container(
              margin: EdgeInsets.only(top: 32.0, bottom: 32.0),
              child: RichText(
                  text: TextSpan(
                      text: 'Complexity:  ',
                      style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
                      children: [
                        TextSpan(
                          text: passwordStrength,
                          style: TextStyle(
                            color: this.strengthColor,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat'
                          )
                        )
                      ]
                  )
              )
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                PasswordRequirement(
                  key: Key('lowercaseRequirement'),
                  title: 'a',
                  subtitle: 'Lowercase',
                    isFulfilled: _isFirstCriteriaFulfilled
                ),
                PasswordRequirement(
                    key: Key('uppercaseRequirement'),
                    title: 'A',
                    subtitle: 'Uppercase',
                    isFulfilled: _isSecondCriteriaFulfilled
                ),
                PasswordRequirement(
                    key: Key('numberRequirement'),
                    title: '123',
                    subtitle: 'Number',
                    isFulfilled: _isThirdCriteriaFulfilled
                ),
                PasswordRequirement(
                    key: Key('mincharRequirement'),
                    title: '9+',
                    subtitle: 'Characters',
                    isFulfilled: _isFourthCriteriaFulfilled
                ),
              ],
            ),
            OnboardingButton(
                key: Key('onboardingPasswordButton'),
                text: 'Next',
                onPressedListener: () {
                  if (_passwordFormKey.currentState!.validate()) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return OnboardingPersonalInfo();
                    }));
                  }
                }
            )
          ],
        ),
      ),
    );
  }

  String? isValidPassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password cannot be empty';
    } else if (password.length > 0 && password.length < 9) {
      return 'Password must be at least 9 characters';
    } else if (!RegExp(r"(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])\w+").hasMatch(password)) {
      return 'Password must be at least contain lowercase letter, uppercase letter and number';
    }
    return null;
  }
}