import 'dart:ui';
import 'package:flutter/material.dart';

class AgeSelection extends StatefulWidget {
  final callback;

  AgeSelection({Key key, @required this.callback}) : super(key: key);

  @override
  _AgeSelectionState createState() => _AgeSelectionState();
}

class _AgeSelectionState extends State<AgeSelection> {
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Age: ",
            style: TextStyle(fontSize: 20, color: Colors.black54),
          ),
          Text(
            age.round().toString(),
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
      Padding(
          padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
          child: Slider(
            value: age.roundToDouble(),
            min: 2,
            max: 80,
            onChanged: (value) {
              setState(() {
                age = value.round();
                widget.callback({"age": age});
              });
            },
            divisions: 78,
            label: age.toString(),
            activeColor: Colors.red[400],
            inactiveColor: Colors.grey,
          )),
    ]);
  }
}
