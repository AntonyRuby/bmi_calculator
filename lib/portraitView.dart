import 'package:bmi_calculator/gender.dart';
import 'package:flutter/material.dart';
import 'height.dart';
import 'weight.dart';
import 'age.dart';

Widget portraitView(String units) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
    child: Column(children: [
      GenderSelection(),
      AgeSelection(),
      HeightSelection(units: units),
      WeightSelection(units: units)
    ]),
  );
}
