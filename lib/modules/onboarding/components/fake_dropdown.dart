import 'package:flutter/material.dart';

class FakeDropdown extends StatefulWidget {

  final String formLabel;

  final String formHint;

  final VoidCallback onPressedListener;

  const FakeDropdown({
    required Key key,
    required this.formLabel,
    required this.formHint,
    required this.onPressedListener
  }) : super(key: key);

  @override
  _FakeDropdownState createState() => _FakeDropdownState();
}

class _FakeDropdownState extends State<FakeDropdown> {

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0)
        ),
        padding: EdgeInsets.all(12),
        child: InkWell(
            onTap: widget.onPressedListener,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.formLabel,
                      style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF555555)
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top:4)
                    ),
                    Text(
                      widget.formHint,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500
                      ),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: Color(0xFFAAAAAA),
                  ),
                )
              ],
            )
        )
    );
  }

}