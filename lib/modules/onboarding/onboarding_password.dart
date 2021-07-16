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
            IntrinsicWidth(
              child: Form(
                  key: _passwordFormKey,
                  child: Container(
                      color: Colors.white,
                      child: TextFormField(
                          style: TextStyle(
                          color: Colors.black87,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Create Password',
                          contentPadding: EdgeInsets.all(12),
                          suffixIcon: Icon(
                            Icons.visibility_outlined,
                            color: Color(0xFF4E80E8),
                            size: 24,
                          ),
                        ),
                        validator: (String? value) {
                          return isValidPassword(value);
                        }
                      )
                  )
              )
            ),
            Container(
              child: RichText(
                  text: TextSpan(
                      text: 'Complexity: '
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
            Expanded(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_passwordFormKey.currentState!.validate()) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return OnboardingPersonalInfo();
                            }));
                          }
                        },
                        child: const Text("Next")
                    )
                )
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