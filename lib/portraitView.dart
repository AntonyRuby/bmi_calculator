import 'package:flutter/material.dart';
import 'height.dart';
import 'weight.dart';
import 'age.dart';

Widget portraitView(String units) {
  return Column(children: [
    AgeSelection(),
    HeightSelection(units: units),
    WeightSelection(units: units)
  ]);
}
