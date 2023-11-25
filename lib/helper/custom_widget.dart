import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../components/my_feedback_list.dart';
import '../components/my_rating_input.dart';
import '../components/my_rating_widget.dart';
import 'utils.dart';

Container contentAlert(
  String imagePath,
  String foodName,
) {
  return Container(
    height: 800,
    color: const Color(0xFF333333),
    child: Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: const Color(0xFF5B5B5B),
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage("assets/images/$imagePath"),
                        width: 206,
                        height: 116,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '$foodName\n',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      RatingWidget(foodName: foodName),
                      const SizedBox(height: 10),
                      FeedbackList(foodName: foodName),
                      const SizedBox(height: 150),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: FeedbackForm(foodName: foodName),
        ),
      ],
    ),
  );
}

Text buildTextTitle(String title) {
  return Text(
    '  $title',
    style: const TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w800,
      height: 0,
    ),
  );
}

AlertDialog buildAlertDialog(String imagePath, String foodName) {
  return AlertDialog(
    backgroundColor: const Color(0xFF333333),
    content: contentAlert(imagePath, foodName),
  );
}

ElevatedButton buildElevatedButton(String title, Color backgroundColor,
    BuildContext context, Widget nextPage) {
  // Color backgroundColor;
  // // Set background color based on indicator status
  // switch (indicatorStatus) {
  //   case IndicatorStatus.normal:
  //     backgroundColor = Colors.green; // or any other color for normal
  //     break;
  //   case IndicatorStatus.less:
  //     backgroundColor = Colors.greenAccent; // Set your desired color for less
  //     break;
  //   case IndicatorStatus.crowded:
  //     backgroundColor = Colors.red; // Set your desired color for crowded
  //     break;
  //   case IndicatorStatus.medium:
  //     backgroundColor = Colors.yellow;
  //     break;
  // }

  return ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WillPopScope(
            onWillPop: () async {
              Navigator.popUntil(
                  context, ModalRoute.withName(Navigator.defaultRouteName));
              return false; // Return false to prevent default back button behavior
            },
            child: nextPage,
          ),
        ),
      );
    },
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color?>(backgroundColor),
    ),
    child: Text(
      title,
      style: const TextStyle(
        color: Color(0xFF1C1C1C),
        fontSize: 14,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w800,
      ),
    ),
  );
}

Card buildCard(String imagePath, String foodName, BuildContext context) {
  return Card(
    margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
    color: const Color(0xFF333333),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 206,
          height: 168,
          color: const Color(0xFF5B5B5B),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return buildAlertDialog(imagePath, foodName);
                      });
                },
                child: Image(
                  image: AssetImage("assets/images/$imagePath"),
                  width: 206,
                  height: 116,
                  fit: BoxFit.fill,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '  $foodName\n',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return buildAlertDialog(imagePath, foodName);
                            });
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFF15C8CF),
                          foregroundColor: Colors.white,
                          side: const BorderSide(
                              color: Color(0xFF5B5B5B), width: 2.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                      child: const Text(
                        'Lihat',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w800,
                          height: 0,
                        ),
                      ))
                ],
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Row buildBlokMIndicator(List<Progress> prog) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      CircularPercentIndicator(
        radius: prog[0].radius,
        lineWidth: prog[0].lineWidth,
        percent: prog[0].percent,
        animation: prog[0].animation,
        animationDuration: prog[0].animationDuration,
        progressColor: prog[0].progressColor,
        backgroundColor: prog[0].backgroundColor,
        circularStrokeCap: prog[0].circularStrokeCap,
        center: Center(
          child: Text(
            "Lantai 1",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: prog[0].progressColor,
            ),
          ),
        ),
      ),
      const SizedBox(height: 20),
      CircularPercentIndicator(
        radius: prog[1].radius,
        lineWidth: prog[1].lineWidth,
        percent: prog[1].percent,
        animation: prog[1].animation,
        animationDuration: prog[1].animationDuration,
        progressColor: prog[1].progressColor,
        backgroundColor: prog[1].backgroundColor,
        circularStrokeCap: prog[1].circularStrokeCap,
        center: Center(
          child: Text(
            "Lantai 2",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: prog[1].progressColor,
            ),
          ),
        ),
      ),
      const SizedBox(height: 20),
      CircularPercentIndicator(
        radius: prog[2].radius,
        lineWidth: prog[2].lineWidth,
        percent: prog[2].percent,
        animation: prog[2].animation,
        animationDuration: prog[2].animationDuration,
        progressColor: prog[2].progressColor,
        backgroundColor: prog[2].backgroundColor,
        circularStrokeCap: prog[2].circularStrokeCap,
        center: Center(
          child: Text(
            "Lantai 3",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: prog[2].progressColor,
            ),
          ),
        ),
      ),
      const SizedBox(height: 20),
      CircularPercentIndicator(
        radius: prog[3].radius,
        lineWidth: prog[3].lineWidth,
        percent: prog[3].percent,
        animation: prog[3].animation,
        animationDuration: prog[3].animationDuration,
        progressColor: prog[3].progressColor,
        backgroundColor: prog[3].backgroundColor,
        circularStrokeCap: prog[3].circularStrokeCap,
        center: Center(
          child: Text(
            "Lantai 4",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: prog[3].progressColor,
            ),
          ),
        ),
      ),
      const SizedBox(height: 20),
    ],
  );
}

Row buildDaksinIndicator(List<Progress> prog) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const SizedBox(
        width: 80,
      ),
      CircularPercentIndicator(
        radius: prog[0].radius,
        lineWidth: prog[0].lineWidth,
        percent: prog[0].percent,
        animation: prog[0].animation,
        animationDuration: prog[0].animationDuration,
        progressColor: prog[0].progressColor,
        backgroundColor: prog[0].backgroundColor,
        circularStrokeCap: prog[0].circularStrokeCap,
        center: Center(
          child: Text(
            "Daksin Barat",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: prog[0].progressColor,
            ),
          ),
        ),
      ),
      const SizedBox(
        width: 68,
      ),
      CircularPercentIndicator(
        radius: prog[1].radius,
        lineWidth: prog[1].lineWidth,
        percent: prog[1].percent,
        animation: prog[1].animation,
        animationDuration: prog[1].animationDuration,
        progressColor: prog[1].progressColor,
        backgroundColor: prog[1].backgroundColor,
        circularStrokeCap: prog[1].circularStrokeCap,
        center: Center(
          child: Text(
            "Lapangan",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: prog[1].progressColor,
            ),
          ),
        ),
      ),
      const SizedBox(height: 20),
    ],
  );
}
