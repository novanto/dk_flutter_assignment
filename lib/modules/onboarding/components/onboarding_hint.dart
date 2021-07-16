import 'package:flutter/material.dart';

class OnboardingHint extends StatelessWidget {

  final String title;

  final String subtitle;

  const OnboardingHint({required Key key, required this.title, required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Container(
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 12.0),
            child: Text(
              subtitle,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          )
        ],
    );
  }
}