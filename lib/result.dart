import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  final int height;
  final int weight;
  final int age;
  final String gender;
  final bmiJson;

  Result(
      {Key key,
      @required this.height,
      @required this.weight,
      @required this.age,
      @required this.gender,
      @required this.bmiJson})
      : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  double bmi;
  String condition = "Normal";

  @override
  Widget build(BuildContext context) {
    bmi = widget.weight / ((widget.height / 100) * (widget.height / 100));
    List<dynamic> bmiRange =
        widget.bmiJson[widget.gender][(widget.age.round() * 12).toString()];

    if (widget.age <= 19) {
      if ((bmi > bmiRange[2]) && (bmi < bmiRange[4])) {
        condition = "Normal";
      } else if ((bmi > bmiRange[1]) && (bmi <= bmiRange[2])) {
        condition = "Underweight";
      } else if ((bmi <= bmiRange[1])) {
        condition = "Thinness";
      } else if ((bmi >= bmiRange[4]) && (bmi < bmiRange[5])) {
        condition = "Overweight";
      } else {
        condition = "Obesity";
      }
    } else {
      if (bmi >= 18.5 && bmi <= 25) {
        condition = "Normal";
      } else if (bmi > 25 && bmi <= 30) {
        condition = "Overweight";
      } else if (bmi > 30) {
        condition = "Obesity";
      } else {
        condition = "Underweight";
      }
    }
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
              bmi.round().toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          condition,
          style: Theme.of(context).textTheme.headline3,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          (widget.age > 19)
              ? "Healthy weight Range: 18.5 to 25"
              : "Healthy weight Range: " +
                  bmiRange[2].toString() +
                  " to " +
                  bmiRange[4].toString(),
          style: Theme.of(context).textTheme.bodyText1,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
