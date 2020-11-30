import 'dart:ui';
import 'package:flutter/material.dart';

int cmToFeet(int height) {
  return (height / 2.54 / 12).floor();
}

int cmToInch(int height) {
  return ((height / 2.54) - (height / 2.54 / 12).floor() * 12).round();
}

int feetToCm(int feet, inch) {
  return ((feet * 12 + inch) * 2.54).round();
}

class HeightSelection extends StatefulWidget {
  final String units;
  final callback;

  HeightSelection({Key key, @required this.units, @required this.callback})
      : super(key: key);

  @override
  _HeightSelectionState createState() => _HeightSelectionState();
}

class _HeightSelectionState extends State<HeightSelection> {
  int height = 168;
  int heightFeet = 5;
  int heightInch = 6;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Height: ",
            style: TextStyle(fontSize: 20, color: Colors.black54),
          ),
          Text(
            (widget.units == "metric")
                ? height.toString() + " cms"
                : cmToFeet(height).toString() +
                    "' " +
                    cmToInch(height).toString() +
                    "\"",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
      if (widget.units == "metric")
        Padding(
            padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
            child: Slider(
              value: height.roundToDouble(),
              min: 61,
              max: 241,
              onChanged: (value) {
                setState(() {
                  height = value.round();
                  heightFeet = cmToFeet(height);
                  heightInch = cmToInch(height);
                  widget.callback({"height": height});
                });
              },
              divisions: 241,
              label: height.toString(),
              activeColor: Colors.red[400],
              inactiveColor: Colors.grey,
            )),
      if (widget.units != "metric")
        Padding(
            padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
            child: Column(children: [
              Slider(
                value: heightFeet.roundToDouble(),
                min: 2,
                max: 7,
                onChanged: (val) {
                  setState(() {
                    height = feetToCm(val.round(), heightInch);
                    heightFeet = val.round();
                    widget.callback({"height": height});
                  });
                },
                divisions: 7,
                label: heightFeet.toString(),
                activeColor: Colors.red[400],
                inactiveColor: Colors.grey,
              ),
              Slider(
                value: heightInch.roundToDouble(),
                min: 0,
                max: 11,
                onChanged: (val) {
                  setState(() {
                    height = feetToCm(heightFeet, val.round());
                    heightInch = val.round();
                    widget.callback({"height": height});
                  });
                },
                divisions: 12,
                label: heightInch.toString(),
                activeColor: Colors.red[400],
                inactiveColor: Colors.grey,
              )
            ]))
    ]);
  }
}
