import 'package:flutter/material.dart';

class PasswordRequirement extends StatefulWidget {

  final String title;

  final String subtitle;

  final bool isFulfilled;

  const PasswordRequirement({
    required Key key,
    required this.title,
    required this.subtitle,
    required this.isFulfilled
  }) : super(key: key);

  @override
  _PasswordRequirementState createState() => _PasswordRequirementState();
}

class _PasswordRequirementState extends State<PasswordRequirement> {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (!widget.isFulfilled)
            Text(
              widget.title,
              style: TextStyle(
                  fontSize: 28,
                  color: Colors.white
              ),
            )
          else
            Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.lightGreen,
                ),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                )
            )
          ,
          Container(
            margin: EdgeInsets.only(top: 12),
            child: Text(
                widget.subtitle,
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