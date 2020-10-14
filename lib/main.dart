import 'dart:ui';

import 'package:bmi_calculator/result.dart';
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
  // List _gendertypes = ["Male", "Female"];
  // String select;
  // String _gendertype = "Male";
  List _heighttypes = ["cm", "Feet"];
  String _heighttype = "cm";
  List _agetypes = ["Years", "Month"];
  String _agetype = "Years";
  List _weighttypes = ["Kg", "lb"];
  String _weighttype = "Kg";
  double _height = 100.0;
  double _heightFeet = 5;
  double _heightInch = 0;
  double _weight = 50.0;
  double _age = 2;
  double _ageMonth = 1;
  double _ageYear = 2;

  int _bmi = 0;
  String _condition = "Select Data";
  // bool _switchvalue1 = true;
  bool _switchvalue2 = true;
  bool _switchvalue3 = true;
  bool _switchvalue4 = true;
  int select;

  @override
  void initState() {
    super.initState();
    select = 0;
  }

  setselect(int val) {
    setState(
      () {
        select = val;
        // if (val) {
        //   _gendertype = _gendertypes[1];
        // } else {
        //   _gendertype = _gendertypes[0];
        // }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "BMI Calculator",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        elevation: 0,
      ),
      body: calculation(),
    );
  }

  Widget calculation() {
    Orientation orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.portrait) {
      return Column(
        children: <Widget>[
          _selection(),
          _calculate(),
        ],
      );
    } else {
      return Row(
        children: <Widget>[
          _selectionlandscape(),
          _landscapeDetailsSection(),
        ],
      );
    }
  }

  Widget _selection() {
    Size size = MediaQuery.of(context).size;
    return Column(children: <Widget>[
      SizedBox(
        height: size.height * 0.01,
      ),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          "Male",
          style: TextStyle(fontSize: 20, color: Colors.black54),
        ),
        Radio(
            activeColor: Colors.blue,
            value: 1,
            groupValue: select,
            onChanged: (value) {
              // if (value) {
              // _gendertype = _gendertypes[1];
              setselect(value);
              // setState(() {
              //   _switchvalue1 = value;
              // });
            }
            // },
            ),
        Text(
          "Female",
          style: TextStyle(fontSize: 20, color: Colors.black54),
        ),
        Radio(
            activeColor: Colors.pink,
            value: 2,
            groupValue: select,
            onChanged: (value) {
              // if (value) {
              //   _gendertype = _gendertypes[1];
              setselect(value);
              // setState(() {
              //   _switchvalue1 = value;
              // });
              //               },
            }
            // },
            )
      ]),
      SizedBox(
        height: size.height * 0.03,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Age:  ",
            style: TextStyle(fontSize: 20, color: Colors.black54),
          ),
          Text(
            (_agetype == _agetype[0])
                ? _age.round().toString() + " $_agetype"
                : _ageYear.round().toString() +
                    "Years" +
                    _ageMonth.round().toString() +
                    "Month",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          // Text(
          //   _agetype,
          //   style: TextStyle(fontWeight: FontWeight.bold),
          // ),
          Column(
            children: [
              Text(
                _agetype,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Switch(
                value: _switchvalue4,
                onChanged: (bool value) {
                  if (value) {
                    _agetype = _agetypes[1];
                  } else {
                    _agetype = _agetypes[0];
                  }
                  setState(() {
                    _switchvalue4 = value;
                  });
                },
                activeTrackColor: Colors.red,
                activeColor: Colors.grey,
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.redAccent[100],
              ),
            ],
          )
        ],
      ),
      if (_agetype == _agetypes[0])
        Padding(
            padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
            child: Slider(
              value: _ageYear,
              min: 2,
              max: 70,
              onChanged: (val) {
                setState(() {
                  _ageYear = val.truncateToDouble();
                });
              },
              divisions: 70,
              label: "$_ageYear",
              activeColor: Colors.red[400],
              inactiveColor: Colors.grey,
            )),
      if (_agetype == _agetypes[1])
        Padding(
            padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
            child: Column(children: [
              Slider(
                value: _ageYear,
                min: 2,
                max: 70,
                onChanged: (val) {
                  setState(() {
                    _ageYear = val.truncateToDouble();
                  });
                },
                divisions: 70,
                label: "$_ageYear",
                activeColor: Colors.red[400],
                inactiveColor: Colors.grey,
              ),
              Slider(
                value: _ageMonth,
                min: 0,
                max: 12,
                onChanged: (val) {
                  setState(() {
                    _ageMonth = val;
                  });
                },
                divisions: 12,
                label: "$_ageMonth",
                activeColor: Colors.red[400],
                inactiveColor: Colors.grey,
              )
            ]))
    ]);
  }

  Widget _calculate() {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Height: ",
              style: TextStyle(fontSize: 20, color: Colors.black54),
            ),
            Flexible(
                flex: 4,
                child: Text(
                  (_heighttype == _heighttypes[0])
                      ? _height.round().toString() + " $_heighttype"
                      : _heightFeet.round().toString() +
                          "' " +
                          _heightInch.round().toString() +
                          "\"",
                  style: Theme.of(context).textTheme.bodyText1,
                )),
            Flexible(
                flex: 6,
                child: Column(
                  children: [
                    Text(
                      _heighttype,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Switch(
                      value: _switchvalue2,
                      onChanged: (bool value) {
                        if (value) {
                          _heighttype = _heighttypes[1];
                        } else {
                          _heighttype = _heighttypes[0];
                        }
                        setState(() {
                          _switchvalue2 = value;
                        });
                      },
                      activeTrackColor: Colors.red,
                      activeColor: Colors.grey,
                      inactiveThumbColor: Colors.grey,
                      inactiveTrackColor: Colors.redAccent[100],
                    )
                  ],
                )),
          ],
        ),
        if (_heighttype == _heighttypes[0])
          Padding(
              padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
              child: Slider(
                value: _height,
                min: 30,
                max: 272,
                onChanged: (height) {
                  setState(() {
                    _height = height.truncateToDouble();
                    _heightFeet = ((_height / 2.54) / 12).floorToDouble();
                    _heightInch =
                        ((_height / 2.54) - (_heightFeet * 12)).roundToDouble();
                  });
                },
                divisions: 300,
                label: "$_height",
                activeColor: Colors.red[400],
                inactiveColor: Colors.grey,
              )),
        if (_heighttype == _heighttypes[1])
          Padding(
              padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
              child: Column(children: [
                Slider(
                  value: _heightFeet,
                  min: 1,
                  max: 8,
                  onChanged: (val) {
                    setState(() {
                      _heightFeet = val.truncateToDouble();
                      _height = ((val.truncateToDouble() * 12 +
                                  _heightInch.truncateToDouble()) *
                              2.54)
                          .roundToDouble();
                    });
                  },
                  divisions: 8,
                  label: "$_heightFeet",
                  activeColor: Colors.red[400],
                  inactiveColor: Colors.grey,
                ),
                Slider(
                  value: _heightInch,
                  min: 0,
                  max: 11,
                  onChanged: (val) {
                    setState(() {
                      _heightInch = val.truncateToDouble();
                      _height = ((_heightFeet.truncateToDouble() * 12 +
                                  val.truncateToDouble()) *
                              2.54)
                          .roundToDouble();
                    });
                  },
                  divisions: 12,
                  label: "$_heightInch",
                  activeColor: Colors.red[400],
                  inactiveColor: Colors.grey,
                )
              ])),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Weight: ",
            style: TextStyle(fontSize: 20, color: Colors.black54),
          ),
          Flexible(
              flex: 4,
              child: Text(
                "$_weight ",
                style: Theme.of(context).textTheme.bodyText1,
              )),
          Text(
            _weighttype,
          ),
          Flexible(
              flex: 6,
              child: Column(
                children: [
                  Text(
                    _weighttype,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Switch(
                    value: _switchvalue3,
                    onChanged: (bool value) {
                      if (value) {
                        _weighttype = _weighttypes[1];
                      } else {
                        _weighttype = _weighttypes[0];
                      }
                      setState(() {
                        _switchvalue3 = value;
                      });
                    },
                    activeTrackColor: Colors.red,
                    activeColor: Colors.grey,
                    inactiveThumbColor: Colors.grey,
                    inactiveTrackColor: Colors.redAccent[100],
                  )
                ],
              ))
        ]),
        Padding(
          padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
          child: Slider(
            value: _weight,
            min: 50,
            max: 150,
            onChanged: (weight) {
              setState(() {
                _weight = weight;
              });
            },
            divisions: 200,
            label: "$_weight",
            activeColor: Colors.red,
            inactiveColor: Colors.grey,
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        Container(
            width: size.width * 0.6,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: FlatButton.icon(
                  onPressed: () {
                    setState(() {
                      //18.5-25 Healthy 25-30 Overweight >30 Obesity

                      // 703 x weight (lbs) / [height (in)]2
                      double weightInKg = _weight;
                      if (_weighttype == "lb") {
                        weightInKg = _weight * 0.453592;
                      }
                      _bmi = (weightInKg / ((_height / 100) * (_height / 100)))
                          .round()
                          .toInt();
                      // if (_gendertype == "Male") {
                      if (_bmi >= 18.5 && _bmi <= 25) {
                        _condition = "Normal";
                      } else if (_bmi > 25 && _bmi <= 30) {
                        _condition = "Overweight";
                      } else if (_bmi > 30) {
                        _condition = "Obesity";
                      } else {
                        _condition = "Underweight";
                      }
                      // } else {
                      if (_bmi >= 18.5 && _bmi <= 25) {
                        _condition = "Normal";
                      } else if (_bmi > 25 && _bmi <= 30) {
                        _condition = "Overweight";
                      } else if (_bmi > 30) {
                        _condition = "Obesity";
                      } else {
                        _condition = "Underweight";
                      }
                    }
                        // }
                        );
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Result(
                                  bmi: _bmi,
                                )));
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Calculate",
                    style: Theme.of(context).textTheme.button,
                  ),
                  color: Colors.pink,
                  padding: EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                )))
      ],
    );
  }

  Widget _selectionlandscape() {
    return Column(children: <Widget>[
      Container(
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height / 4,
        child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Male",
                style: TextStyle(fontSize: 20, color: Colors.black54),
              ),
              Radio(
                  activeColor: Colors.blue,
                  value: 1,
                  groupValue: select,
                  onChanged: (value) {
                    setselect(value);
                  }),
              Text(
                "Female",
                style: TextStyle(fontSize: 20, color: Colors.black54),
              ),
              Radio(
                  activeColor: Colors.pink,
                  value: 2,
                  groupValue: select,
                  onChanged: (value) {
                    setselect(value);
                  })
            ])),
      ),
      Row(
        children: [
          Text(
            "Age:  ",
            style: TextStyle(fontSize: 20, color: Colors.black54),
          ),
          Text(
            (_agetype == _agetype[0])
                ? _age.round().toString() + " $_agetype"
                : _ageYear.round().toString() +
                    "Years" +
                    _ageMonth.round().toString() +
                    "Month",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          // Text(
          //   _agetype,
          //   style: TextStyle(fontWeight: FontWeight.bold),
          // ),
          Column(
            children: [
              Text(
                _agetype,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Switch(
                value: _switchvalue4,
                onChanged: (bool value) {
                  if (value) {
                    _agetype = _agetypes[1];
                  } else {
                    _agetype = _agetypes[0];
                  }
                  setState(() {
                    _switchvalue4 = value;
                  });
                },
                activeTrackColor: Colors.red,
                activeColor: Colors.grey,
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.redAccent[100],
              ),
            ],
          )
        ],
      ),
      if (_agetype == _agetypes[0])
        Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Slider(
              value: _ageYear,
              min: 2,
              max: 70,
              onChanged: (val) {
                setState(() {
                  _ageYear = val.truncateToDouble();
                });
              },
              divisions: 70,
              label: "$_ageYear",
              activeColor: Colors.red[400],
              inactiveColor: Colors.grey,
            )),
      if (_agetype == _agetypes[1])
        Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Column(children: [
              Slider(
                value: _ageYear,
                min: 2,
                max: 70,
                onChanged: (val) {
                  setState(() {
                    _ageYear = val.truncateToDouble();
                  });
                },
                divisions: 70,
                label: "$_ageYear",
                activeColor: Colors.red[400],
                inactiveColor: Colors.grey,
              ),
              Slider(
                value: _ageMonth,
                min: 0,
                max: 12,
                onChanged: (val) {
                  setState(() {
                    _ageMonth = val;
                  });
                },
                divisions: 12,
                label: "$_ageMonth",
                activeColor: Colors.red[400],
                inactiveColor: Colors.grey,
              )
            ]))
    ]);
  }

  Widget _landscapeDetailsSection() {
    return Column(children: <Widget>[
      Container(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 1.25,
          child: _calculationLandscape())
    ]);
  }

  Widget _calculationLandscape() {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Height:  ",
              style: TextStyle(fontSize: 20, color: Colors.black54),
            ),
            Flexible(
                flex: 4,
                child: Text(
                  (_heighttype == _heighttypes[0])
                      ? _height.round().toString() + " $_heighttype"
                      : _heightFeet.round().toString() +
                          "' " +
                          _heightInch.round().toString() +
                          "\"",
                  style: Theme.of(context).textTheme.bodyText1,
                )),
            Flexible(
                flex: 4,
                child: Column(
                  children: [
                    Text(
                      _heighttype,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Switch(
                      value: _switchvalue2,
                      onChanged: (bool value) {
                        if (value) {
                          _heighttype = _heighttypes[1];
                        } else {
                          _heighttype = _heighttypes[0];
                        }
                        setState(() {
                          _switchvalue2 = value;
                        });
                      },
                      activeTrackColor: Colors.red,
                      activeColor: Colors.grey,
                      inactiveThumbColor: Colors.grey,
                      inactiveTrackColor: Colors.redAccent[100],
                    )
                  ],
                )),
          ],
        ),
        if (_heighttype == _heighttypes[0])
          Padding(
              padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
              child: Slider(
                value: _height,
                min: 30,
                max: 272,
                onChanged: (height) {
                  setState(() {
                    _height = height.truncateToDouble();
                    _heightFeet = ((_height / 2.54) / 12).floorToDouble();
                    _heightInch =
                        ((_height / 2.54) - (_heightFeet * 12)).roundToDouble();
                  });
                },
                divisions: 300,
                label: "$_height",
                activeColor: Colors.red[400],
                inactiveColor: Colors.grey,
              )),
        if (_heighttype == _heighttypes[1])
          Padding(
              padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
              child: Column(children: [
                Slider(
                  value: _heightFeet,
                  min: 1,
                  max: 8,
                  onChanged: (val) {
                    setState(() {
                      _heightFeet = val.truncateToDouble();
                      _height = ((val.truncateToDouble() * 12 +
                                  _heightInch.truncateToDouble()) *
                              2.54)
                          .roundToDouble();
                    });
                  },
                  divisions: 8,
                  label: "$_heightFeet",
                  activeColor: Colors.red[400],
                  inactiveColor: Colors.grey,
                ),
                Slider(
                  value: _heightInch,
                  min: 0,
                  max: 11,
                  onChanged: (val) {
                    setState(() {
                      _heightInch = val.truncateToDouble();
                      _height = ((_heightFeet.truncateToDouble() * 12 +
                                  val.truncateToDouble()) *
                              2.54)
                          .roundToDouble();
                    });
                  },
                  divisions: 12,
                  label: "$_heightInch",
                  activeColor: Colors.red[400],
                  inactiveColor: Colors.grey,
                )
              ])),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Weight: ",
            style: TextStyle(fontSize: 20, color: Colors.black54),
          ),
          Flexible(
              flex: 4,
              child: Text(
                "$_weight ",
                style: Theme.of(context).textTheme.bodyText1,
              )),
          Text(
            _weighttype,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Flexible(
              flex: 6,
              child: Column(
                children: [
                  Text(
                    _weighttype,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Switch(
                    value: _switchvalue3,
                    onChanged: (bool value) {
                      if (value) {
                        _weighttype = _weighttypes[1];
                      } else {
                        _weighttype = _weighttypes[0];
                      }
                      setState(() {
                        _switchvalue3 = value;
                      });
                    },
                    activeTrackColor: Colors.red,
                    activeColor: Colors.grey,
                    inactiveThumbColor: Colors.grey,
                    inactiveTrackColor: Colors.redAccent[100],
                  )
                ],
              ))
        ]),
        Padding(
          padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
          child: Slider(
            value: _weight,
            min: 50,
            max: 150,
            onChanged: (weight) {
              setState(() {
                _weight = weight;
              });
            },
            divisions: 200,
            label: "$_weight",
            activeColor: Colors.red,
            inactiveColor: Colors.grey,
          ),
        ),
        Container(
            width: size.width * 0.4,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: FlatButton.icon(
                  onPressed: () {
                    setState(() {
                      //18.5-25 Healthy 25-30 Overweight >30 Obesity

                      // 703 x weight (lbs) / [height (in)]2
                      double weightInKg = _weight;
                      if (_weighttype == "lb") {
                        weightInKg = _weight * 0.453592;
                      }
                      _bmi = (weightInKg / ((_height / 100) * (_height / 100)))
                          .round()
                          .toInt();
                      // if (_gendertype == "Male") {
                      if (_bmi >= 18.5 && _bmi <= 25) {
                        _condition = "Normal";
                      } else if (_bmi > 25 && _bmi <= 30) {
                        _condition = "Overweight";
                      } else if (_bmi > 30) {
                        _condition = "Obesity";
                      } else {
                        _condition = "Underweight";
                      }
                      // } else {
                      if (_bmi >= 18.5 && _bmi <= 25) {
                        _condition = "Normal";
                      } else if (_bmi > 25 && _bmi <= 30) {
                        _condition = "Overweight";
                      } else if (_bmi > 30) {
                        _condition = "Obesity";
                      } else {
                        _condition = "Underweight";
                      }
                    }
                        // }
                        );
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Result(
                                  bmi: _bmi,
                                )));
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Calculate",
                    style: Theme.of(context).textTheme.button,
                  ),
                  color: Colors.pink,
                  padding: EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                )))
      ],
    );
  }
}
