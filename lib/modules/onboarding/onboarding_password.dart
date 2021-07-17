import 'package:dk_flutter_assignment/modules/onboarding/components/onboarding_button.dart';
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

  void _togglePasswordVisiblity() {
      setState(() {
        _isPasswordHidden = !_isPasswordHidden;
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
            OnboardingHint(
                key: Key('onboardingPasswordHint'),
                title: 'Create Password',
                subtitle: 'Password will be used to login to account'
            ),
            Container(
              margin: EdgeInsets.only(top: 44),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0)
              ),
              child: Form(
                  key: _passwordFormKey,
                  child: TextFormField(
                      style: TextStyle(color: Colors.black87,),
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
              margin: EdgeInsets.only(top: 32.0, bottom: 44.0),
              child: RichText(
                  text: TextSpan(
                      text: 'Complexity: ',
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(

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
                  subtitle: 'Lowercase'
                ),
                PasswordRequirement(
                    key: Key('uppercaseRequirement'),
                    title: 'A',
                    subtitle: 'Uppercase'
                ),
                PasswordRequirement(
                    key: Key('numberRequirement'),
                    title: '123',
                    subtitle: 'Number'
                ),
                PasswordRequirement(
                    key: Key('mincharRequirement'),
                    title: '9+',
                    subtitle: 'Characters'
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
    } else if (RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(password)) {
      return 'Password must be at least contain lowercase letter, uppercase letter and number';
    }
    return null;
  }
}