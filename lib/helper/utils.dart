import 'package:flutter/material.dart';
import 'dart:math';
import 'package:percent_indicator/percent_indicator.dart';

class Progress {
  final double radius;
  final double lineWidth;
  final double percent;
  final bool animation;
  final int animationDuration;
  final Color progressColor;
  final Color backgroundColor;
  final CircularStrokeCap circularStrokeCap;
  final Text center;

  Progress({
    required this.radius,
    required this.lineWidth,
    required this.percent,
    required this.animation,
    required this.animationDuration,
    required this.progressColor,
    required this.backgroundColor,
    required this.circularStrokeCap,
    required this.center,
  });

  static List<Progress> getProg() {
    List<Progress> prog = [];

    double randomPercent1 = Random().nextDouble();
    double randomPercent2 = Random().nextDouble();
    double randomPercent3 = Random().nextDouble();
    double randomPercent4 = Random().nextDouble();

    Color progressColor1;
    if (randomPercent1 <= 0.35) {
      progressColor1 = Colors.green;
    } else if (randomPercent1 <= 0.75) {
      progressColor1 = Colors.yellow;
    } else {
      progressColor1 = Colors.red;
    }

    Color progressColor2;
    if (randomPercent2 <= 0.35) {
      progressColor2 = Colors.green;
    } else if (randomPercent2 <= 0.75) {
      progressColor2 = Colors.yellow;
    } else {
      progressColor2 = Colors.red;
    }

    Color progressColor3;
    if (randomPercent3 <= 0.35) {
      progressColor3 = Colors.green;
    } else if (randomPercent3 <= 0.75) {
      progressColor3 = Colors.yellow;
    } else {
      progressColor3 = Colors.red;
    }

    Color progressColor4;
    if (randomPercent4 <= 0.35) {
      progressColor4 = Colors.green;
    } else if (randomPercent4 <= 0.75) {
      progressColor4 = Colors.yellow;
    } else {
      progressColor4 = Colors.red;
    }

    prog.add(
      Progress(
        radius: 50,
        lineWidth: 10,
        percent: randomPercent1,
        animation: true,
        animationDuration: 1000,
        progressColor: progressColor1,
        backgroundColor: Colors.lightBlue.shade100,
        circularStrokeCap: CircularStrokeCap.round,
        center: Text(
          "Lantai 1",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.yellow[300],
          ),
        ),
      ),
    );

    prog.add(
      Progress(
        radius: 50,
        lineWidth: 10,
        percent: randomPercent2,
        animation: true,
        animationDuration: 1000,
        progressColor: progressColor2,
        backgroundColor: Colors.lightBlue.shade100,
        circularStrokeCap: CircularStrokeCap.round,
        center: Text(
          "Lantai 2",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.yellow[300],
          ),
        ),
      ),
    );

    prog.add(
      Progress(
        radius: 50,
        lineWidth: 10,
        percent: randomPercent3,
        animation: true,
        animationDuration: 1000,
        progressColor: progressColor3,
        backgroundColor: Colors.lightBlue.shade100,
        circularStrokeCap: CircularStrokeCap.round,
        center: Text(
          "Lantai 3",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.yellow[300],
          ),
        ),
      ),
    );

    prog.add(
      Progress(
        radius: 50,
        lineWidth: 10,
        percent: randomPercent4,
        animation: true,
        animationDuration: 1000,
        progressColor: progressColor4,
        backgroundColor: Colors.lightBlue.shade100,
        circularStrokeCap: CircularStrokeCap.round,
        center: Text(
          "Lantai 4",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.yellow[300],
          ),
        ),
      ),
    );  
    return prog;
  }
}
