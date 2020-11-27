import 'dart:ui';
import 'package:bmi_calculator/portraitView.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/landscapeview.dart';

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
  bool metric = true;

  Future<Map<String, String>> loadAssets() async {
    final bmiJson = await DefaultAssetBundle.of(context)
        .loadString('assets/bmi_chart.json');

    return {'bmiJson': bmiJson};
  }

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "BMI Calculator",
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.left,
          ),
          actions: [
            Row(
              children: [
                Text(
                  metric ? "metric" : "imperial",
                  style: TextStyle(fontSize: 16),
                ),
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
        body: FutureBuilder(
            future: loadAssets(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Center(
                  child: Text(
                    "Loading",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                );
              }

              Widget body = (orientation == Orientation.portrait)
                  ? PortraitView(
                      units: metric ? "metric" : "imperial", snapshot: snapshot)
                  : LandscapeView(
                      units: metric ? "metric" : "imperial",
                      snapshot: snapshot);

              return body;
            }));
  }
}
