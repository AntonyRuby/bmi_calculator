import 'package:bmi_calculator/result.dart';
import 'package:bmi_calculator/weight.dart';
import 'package:flutter/material.dart';
import 'age.dart';
import 'gender.dart';
import 'height.dart';

class LandscapeView extends StatefulWidget {
  final units;
  LandscapeView({Key key, @required this.units}) : super(key: key);

  @override
  _LandscapeViewState createState() => _LandscapeViewState();
}

class _LandscapeViewState extends State<LandscapeView> {
  double bmi = 0;
  double height = 168;
  double weight = 50;
  double age = 25;
  var gender = "";

  // var data = json.decode(snapshot.data["bmi"].toString());

  void redraw(Map<String, double> change) {
    setState(() {
      if (change.containsKey("age")) {
        age = change["age"];
      } else if (change.containsKey("height")) {
        height = change["height"];
      } else if (change.containsKey("weight")) {
        weight = change["weight"];
      } else if (change.containsKey("gender")) {
        gender = change["gender"] as String;

        bmi = weight / ((height / 100) * (height / 100));
        // if (bmi >= 18.5 && bmi <= 25) {
        //   condition = "Normal";
        // } else if (bmi > 25 && bmi <= 30) {
        //   condition = "Overweight";
        // } else if (bmi > 30) {
        //   condition = "Obesity";
        // } else {
        //   condition = "Underweight";
        // }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    redraw({});
    return Row(children: [
      Expanded(flex: 3, child: Column(children: [Result(bmi: bmi.round())])),
      Expanded(
          flex: 1,
          child: Column(children: [
            GenderSelection(
              callback: redraw,
            ),
            SizedBox(
              height: 2,
            ),
            AgeSelection(
              callback: redraw,
            ),
            SizedBox(
              height: 2,
            ),
            HeightSelection(units: widget.units, callback: redraw),
            SizedBox(
              height: 2,
            ),
            WeightSelection(units: widget.units, callback: redraw),
            SizedBox(
              height: 2,
            ),
          ]))
    ]);
  }
}
