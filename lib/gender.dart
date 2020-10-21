import 'package:flutter/material.dart';

class GenderSelection extends StatefulWidget {
  @override
  GenderSelectionState createState() => GenderSelectionState();
}

class GenderSelectionState extends State<GenderSelection> {
  String gender = 'Male';
  int id = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Radio(
          value: 1,
          groupValue: id,
          onChanged: (val) {
            setState(() {
              gender = 'Male';
              id = 1;
            });
          },
        ),
        Text(
          'Male',
          style: new TextStyle(fontSize: 20.0),
        ),
        Radio(
          value: 2,
          groupValue: id,
          activeColor: Colors.pink,
          onChanged: (val) {
            setState(() {
              gender = 'Female';
              id = 2;
            });
          },
        ),
        Text(
          'Female',
          style: new TextStyle(
            fontSize: 20.0,
          ),
        ),
      ],
    );
  }
}
