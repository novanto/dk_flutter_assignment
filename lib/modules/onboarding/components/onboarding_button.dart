import 'package:flutter/material.dart';

class OnboardingButton extends StatelessWidget {

  final String text;

  final VoidCallback onPressedListener;

  const OnboardingButton({required Key key, required this.text,
    required this.onPressedListener}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)
                    ))
                ),
                onPressed: () {
                  onPressedListener();
                },
                child: Text(text)
            )
        )
    );
  }
}