import 'package:flutter/material.dart';

class PasswordRequirement extends StatelessWidget {

  final String title;

  final String subtitle;

  const PasswordRequirement({required Key key, required this.title, required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 28,
                color: Colors.white
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 12),
            child: Text(
                subtitle,
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white
                ))
          )

        ],
      )
    );
  }
}