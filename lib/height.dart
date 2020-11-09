import 'dart:ui';
import 'package:flutter/material.dart';

double cmToFeet(double height) {
  return (height / 2.54 / 12).floorToDouble();
}

double cmToInch(double height) {
  return ((height / 2.54) - (height / 2.54 / 12).floorToDouble() * 12)
      .roundToDouble();
}

double feetToCm(double feet, inch) {
  return ((feet.truncateToDouble() * 12 + inch.truncateToDouble()) * 2.54)
      .roundToDouble();
}

double kgToLbs(double weight) {
  return (weight * 0.453592).roundToDouble();
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
  double height = 168;
  double heightFeet = 5;
  double heightInch = 6;

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
                ? height.round().toString() + " cms"
                : cmToFeet(height).round().toString() +
                    "' " +
                    cmToInch(height).round().toString() +
                    "\"",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
      if (widget.units == "metric")
        Padding(
            padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
            child: Slider(
              value: height,
              min: 31,
              max: 241,
              onChanged: (value) {
                setState(() {
                  height = value.truncateToDouble();
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
                value: heightFeet,
                min: 1,
                max: 7,
                onChanged: (val) {
                  setState(() {
                    height = feetToCm(val, heightInch);
                    heightFeet = val;
                    widget.callback({"height": height});
                  });
                },
                divisions: 7,
                label: heightFeet.toString(),
                activeColor: Colors.red[400],
                inactiveColor: Colors.grey,
              ),
              Slider(
                value: heightInch,
                min: 0,
                max: 11,
                onChanged: (val) {
                  setState(() {
                    height = feetToCm(heightFeet, val);
                    heightInch = val;
                    widget.callback({"height": height});
                  });
                },
                divisions: 11,
                label: heightInch.toString(),
                activeColor: Colors.red[400],
                inactiveColor: Colors.grey,
              )
            ]))
    ]);
  }
}
