import 'dart:convert';
import 'package:bmi_calculator/gender.dart';
import 'package:bmi_calculator/result.dart';
import 'package:flutter/material.dart';
import 'height.dart';
import 'weight.dart';
import 'age.dart';

class LandscapeView extends StatefulWidget {
  final units;
  final snapshot;

  LandscapeView({Key key, @required this.units, @required this.snapshot})
      : super(key: key);

  @override
  _LandscapeViewState createState() => _LandscapeViewState();
}

class _LandscapeViewState extends State<LandscapeView> {
  double bmi = 0;
  int height = 168;
  int weight = 50;
  int age = 25;
  int gender = 1;
  String condition = "Normal";

  void redraw(Map<String, int> change) {
    setState(() {
      if (change.containsKey("gender")) {
        gender = change["gender"];
      } else if (change.containsKey("age")) {
        age = change["age"];
      } else if (change.containsKey("height")) {
        height = change["height"];
      } else if (change.containsKey("weight")) {
        weight = change["weight"];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    redraw({});
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
        child: Row(children: [
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  Result(
                      height: height,
                      weight: weight,
                      age: age,
                      gender: gender == 1 ? "male" : "female",
                      bmiJson: json
                          .decode(widget.snapshot.data["bmiJson"].toString())),
                  SizedBox(
                    height: 30,
                  ),
                  GenderSelection(
                    callback: redraw,
                  ),
                ],
              )),
          Expanded(
              flex: 1,
              child: Column(children: [
                SizedBox(
                  height: 1,
                ),
                AgeSelection(
                  callback: redraw,
                ),
                SizedBox(
                  height: 1,
                ),
                HeightSelection(units: widget.units, callback: redraw),
                SizedBox(
                  height: 1,
                ),
                WeightSelection(units: widget.units, callback: redraw),
              ])),
        ]));
  }
}
