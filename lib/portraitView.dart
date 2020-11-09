import 'package:bmi_calculator/gender.dart';
import 'package:bmi_calculator/result.dart';
import 'package:flutter/material.dart';
import 'height.dart';
import 'weight.dart';
import 'age.dart';

class PortraitView extends StatefulWidget {
  final units;
  PortraitView({Key key, @required this.units}) : super(key: key);

  @override
  _PortraitViewState createState() => _PortraitViewState();
}

class _PortraitViewState extends State<PortraitView> {
  double bmi = 0;
  double height = 168;
  double weight = 50;
  double age = 25;
  var gender = "";

  // var data = json.decode(snapshot.data["bmi"].toString());

  void redraw(Map<String, double> change) {
    setState(() {
      if (change.containsKey("gender")) {
        gender = change["gender"] as String;
      } else if (change.containsKey("age")) {
        age = change["age"];
      } else if (change.containsKey("height")) {
        height = change["height"];
      } else if (change.containsKey("weight")) {
        weight = change["weight"];
      }

      // if (age <=19) {
      //   // var data = json.decode(snapshot.data["bmi"].toString());
      // } else if (

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
    });
  }

  @override
  Widget build(BuildContext context) {
    redraw({});
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Column(children: [
        Result(bmi: bmi.round()),
        SizedBox(
          height: 45,
        ),
        GenderSelection(
          callback: redraw,
        ),
        SizedBox(
          height: 25,
        ),
        AgeSelection(
          callback: redraw,
        ),
        SizedBox(
          height: 25,
        ),
        HeightSelection(units: widget.units, callback: redraw),
        SizedBox(
          height: 25,
        ),
        WeightSelection(units: widget.units, callback: redraw),
        SizedBox(
          height: 25,
        ),
      ]),
    );
  }
}
