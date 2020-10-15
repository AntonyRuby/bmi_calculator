import 'dart:ui';
import 'package:bmi_calculator/portraitView.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "BMI Calculator",
    theme: ThemeData(
      primaryColor: Colors.red,
      appBarTheme: AppBarTheme(color: Colors.red[500]),
      textTheme: TextTheme(
        headline6: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        headline5: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        headline4: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.normal,
        ),
        bodyText1: TextStyle(
            color: Colors.black, fontWeight: FontWeight.normal, fontSize: 20),
        button: TextStyle(color: Colors.white, fontSize: 20),
      ),
    ),
    home: Homepage(),
  ));
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  double height = 150;
  double weight = 50;
  double age = 25;
  int bmi = 0;

  String result = "Select Data";
  bool metric = true;

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    Widget body = portraitView(metric ? "metric" : "imperial");
    if (orientation == Orientation.landscape) {
      body = Text("");
      //landscapeView();
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "BMI Calculator",
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: [
          Row(
            children: [
              Text(metric ? "metric" : "imperial"),
              Switch(
                value: metric,
                onChanged: (value) {
                  setState(() {
                    metric = value;
                  });
                },
                activeColor: Colors.white,
              ),
            ],
          )
        ],
        elevation: 0,
      ),
      body: body,
    );
  }
}
