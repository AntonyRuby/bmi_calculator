import 'package:flutter/material.dart';

class GenderSelection extends StatefulWidget {
  final callback;

  GenderSelection({Key key, @required this.callback}) : super(key: key);

  @override
  GenderSelectionState createState() => GenderSelectionState();
}

class GenderSelectionState extends State<GenderSelection> {
  int genderId = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Radio(
          value: 1,
          groupValue: genderId,
          onChanged: (val) {
            setState(() {
              genderId = 1;
              widget.callback({"gender": genderId});
            });
          },
        ),
        Text(
          'Male',
          style: new TextStyle(fontSize: 20.0),
        ),
        Radio(
          value: 2,
          groupValue: genderId,
          activeColor: Colors.pink,
          onChanged: (val) {
            setState(() {
              genderId = 2;
              widget.callback({"gender": genderId});
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
