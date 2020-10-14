import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  final bmi;

  Result({this.bmi});

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  String _condition = "Select Data";

  int _bmi = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Your BMI:  ",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  "$_bmi ",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "$_condition ",
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "<18 Underweight  18.5-25 Healthy \n 25-30 Overweight >30 Obesity",
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: FlatButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ),
                      label: Text(
                        "Re-Calculate",
                        style: Theme.of(context).textTheme.button,
                      ),
                      color: Colors.pink,
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    ))),
          )
        ],
      ),
    );
  }
}
