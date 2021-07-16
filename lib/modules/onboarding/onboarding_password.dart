import 'package:dk_flutter_assignment/modules/onboarding/onboarding_personal_information.dart';
import 'package:flutter/material.dart';

class OnboardingPassword extends StatefulWidget {
  @override
  _OnboardingPasswordPageState createState() => _OnboardingPasswordPageState();
}

class _OnboardingPasswordPageState extends State<OnboardingPassword> {

  final GlobalKey<FormState> _passwordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
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
            Text(
              'Create Password',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              'Password will be used to login to account',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Form(
              key: _passwordFormKey,
              child: Column(
                children: [
                  TextFormField(
                      style: TextStyle(
                          color: Colors.black45,
                          backgroundColor: Colors.white
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Create Password',
                        contentPadding: EdgeInsets.all(12),
                        suffixIcon: Icon(
                          Icons.visibility_outlined,
                          color: Colors.lightBlue,
                          size: 24,
                        ),
                      ),
                      validator: (String? value) {
                        return isValidPassword(value);
                      }
                  )
                ],
              ),
            ),
            RichText(
                text: TextSpan(
                  text: 'Complexity'
                )
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text('a', style: TextStyle(
                        fontSize: 20
                    )),
                    Text('Lowercase')
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text('A', style: TextStyle(
                        fontSize: 20
                    )),
                    Text('Uppercase')
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text('123', style: TextStyle(
                        fontSize: 20
                    )),
                    Text('Number')
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                        '9+', style: TextStyle(
                        fontSize: 20
                      ),
                    ),
                    Text('Characters')
                  ],
                )
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