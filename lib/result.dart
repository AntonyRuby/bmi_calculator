import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  final int bmi;
  Result({Key key, @required this.bmi}) : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  String condition = "Select Data";

  // String condition =  if (bmi >= 18.5 && bmi <= 25) {
  //           condition = "Normal";
  //         } else if (bmi > 25 && bmi <= 30) {
  //           condition = "Overweight";
  //         } else if (bmi > 30) {
  //           condition = "Obesity";
  //         } else {
  //           condition = "Underweight";
  //         }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your BMI:  ",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              widget.bmi.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "$condition ",
          //   if (bmi >= 18.5 && bmi <= 25) {
          //   condition = "Normal";
          // } else if (bmi > 25 && bmi <= 30) {
          //   condition = "Overweight";
          // } else if (bmi > 30) {
          //   condition = "Obesity";
          // } else {
          //   condition = "Underweight";
          // }

          style: Theme.of(context).textTheme.headline4,
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          "<18 Underweight  18.5-25 Healthy \n\n 25-30 Overweight >30 Obesity",
          style: Theme.of(context).textTheme.bodyText1,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
