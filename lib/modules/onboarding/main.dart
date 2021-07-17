import 'package:dk_flutter_assignment/modules/onboarding/components/onboarding_button.dart';
import 'package:dk_flutter_assignment/modules/onboarding/components/onboarding_step.dart';
import 'package:dk_flutter_assignment/modules/onboarding/onboarding_password.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xFF4E80E8),
        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          headline2: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
          headline5: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            height: 1.5,
            color: Colors.black,
          ),
          headline6: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18
          ),
          subtitle1: TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.white
          )
        ),
        inputDecorationTheme: InputDecorationTheme(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              primary: Color(0xFF739FE8),
              minimumSize: Size(double.infinity, 56),
              textStyle: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 16
              )
          ),
        )
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final GlobalKey<FormState> _emailFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(margin: EdgeInsets.only(top:40)),
            OnboardingStep(key: Key("mainStep"), currentStep: 0),
            RichText(
              text: TextSpan(
                text: 'Welcome to \nGIN ',
                style: Theme.of(context).textTheme.headline2,
                children: const <TextSpan> [
                  TextSpan(
                      text: 'Finans',
                      style: TextStyle(
                        inherit: true,
                        color: Colors.blue
                      )
                  )
                ]
              )
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Text(
                'Welcome to The Bank of the Future.\nManage and track your accounts on the go.',
                style: Theme.of(context).textTheme.headline5,
              )
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0)
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFFF9F9F9),
                    borderRadius: BorderRadius.circular(12.0)
                ),
                margin: EdgeInsets.all(12),
                child: Form(
                  key: _emailFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                          style: TextStyle(
                              color: Colors.black87,
                              backgroundColor: Colors.white
                          ),
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            fillColor: Colors.black26,
                            prefixIcon: Padding(
                                padding: EdgeInsets.only(bottom:6),
                                child: Icon(
                                    Icons.email_outlined,
                                    size: 24,
                                    color: Colors.black26
                                )
                            ),
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Email cannot be empty';
                            } else if (!isValidEmail(value)) {
                              return 'Email format is invalid';
                            }
                            return null;
                          }
                      )
                    ],
                  ),
                )
              )
            ),
            OnboardingButton(
                key: Key('onboardingPasswordButton'),
                text: 'Next',
                onPressedListener: () {
                  if (_emailFormKey.currentState!.validate()) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return OnboardingPassword();
                    }));
                  }
                }
            )
          ],
        ),
      ),
    );
  }

  bool isValidEmail(String email) {
    if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) {
      return true;
    }
    return false;
  }
}

class CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.blueAccent
      ..strokeWidth = 1;

    var path = Path();

    path.moveTo(0, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.7,
        size.width * 0.5, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9,
        size.width * 1.0, size.height * 0.8);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
