import 'package:flutter/material.dart';

class GinDropdown extends StatefulWidget {

  final String defaultOption;

  final List<String> itemList;

  const GinDropdown({required Key key, required this.defaultOption, required this.itemList}) : super(key: key);

  @override
  _GinDropdownState createState() => _GinDropdownState();
}

class _GinDropdownState extends State<GinDropdown> {

  late String _chosenValue;

  @override
  void initState() {
    _chosenValue = widget.itemList.first;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant GinDropdown oldWidget) {
    if (this._chosenValue != widget.itemList.first) {
      setState(() {
        this._chosenValue = widget.itemList.first;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0)
      ),
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(top: 20),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
            isExpanded: true,
            value: _chosenValue,
            hint: Text(widget.defaultOption),
            icon: const Icon(Icons.keyboard_arrow_down),
            iconSize: 24,
            onChanged: (String? newValue) {
              setState(() {
                _chosenValue = newValue!;
              });
            },
            items: widget.itemList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                      value,
                      style:TextStyle(color:Colors.black)
                  )
              );
            }).toList()
        )
      )
    );
  }

}