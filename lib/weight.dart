import 'dart:ui';
import 'package:flutter/material.dart';

int kgToLbs(int weight) {
  return (weight / 0.453592).round();
}

int lbToKgs(int weight) {
  return (weight * 0.453592).round();
}

class WeightSelection extends StatefulWidget {
  final String units;
  final callback;

  WeightSelection({Key key, @required this.units, @required this.callback})
      : super(key: key);

  @override
  _WeightSelectionState createState() => _WeightSelectionState();
}

class _WeightSelectionState extends State<WeightSelection> {
  int weight = 12;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Weight: ",
            style: TextStyle(fontSize: 20, color: Colors.black54),
          ),
          Text(
            (widget.units == "metric")
                ? weight.round().toString() + " kgs"
                : kgToLbs(weight).toString() + " lbs",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
      if (widget.units == "metric")
        Padding(
            padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
            child: Slider(
              value: weight.roundToDouble(),
              min: 6,
              max: 150,
              onChanged: (value) {
                setState(() {
                  weight = value.round();
                  widget.callback({"weight": weight});
                });
              },
              divisions: 150,
              label: weight.toString(),
              activeColor: Colors.red[400],
              inactiveColor: Colors.grey,
            )),
      if (widget.units != "metric")
        Padding(
            padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
            child: Column(children: [
              Slider(
                value: kgToLbs(weight).roundToDouble(),
                min: 13,
                max: 331,
                onChanged: (val) {
                  setState(() {
                    weight = lbToKgs(val.round());
                    widget.callback({"weight": weight});
                  });
                },
                divisions: 331,
                label: kgToLbs(weight).toString(),
                activeColor: Colors.red[400],
                inactiveColor: Colors.grey,
              ),
            ]))
    ]);
  }
}
