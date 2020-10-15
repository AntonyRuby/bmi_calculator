import 'dart:ui';

import 'package:flutter/material.dart';


class AgeSelection extends StatefulWidget {
  @override
  _AgeSelectionState createState() => _AgeSelectionState();
}

class _AgeSelectionState extends State<AgeSelection> {
  double age = 25;

  @override
  Widget build(BuildContext context) {
      return Column(
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Age: ",
            style: TextStyle(fontSize: 20, color: Colors.black54),
          ),
          Text(age.round().toString(),
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
        Padding(
            padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
            child: Slider(
              value: age,
              min: 2,
              max: 70,
              onChanged: (value) {
                setState(() {
                  age = value.truncateToDouble();
                });
              },
              divisions: 70,
              label: age.toString(),
              activeColor: Colors.red[400],
              inactiveColor: Colors.grey,
            )),
          ]);
  }
}
