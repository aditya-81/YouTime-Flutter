import 'dart:math';

import 'package:flutter/material.dart';

class Calculator {
  Calculator(this.weight, this.height);
  late final int weight;
  late final int height;
  late double _bmi;
  late String result;
  late String interpred;

  String bmical() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String res() {
    if (_bmi >= 24.9) {
      return "Overweight";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String inter() {
    if (_bmi >= 24.9) {
      return "You need to control your diet. And focus on exercise!!";
    } else if (_bmi > 18.5) {
      return "You are fit. Good Job and stay Healthy!!";
    } else {
      return "You need to Increase your diet. And focus on exercise!!";
    }
  }
}
