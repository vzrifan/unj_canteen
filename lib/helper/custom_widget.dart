import 'package:flutter/material.dart';
import 'package:unj_canteen/helper/indicator_status.dart';

Container contentAlert(
  String imagePath,
  String foodName,
) {
  return Container(
    color: const Color(0xFF333333),
    child: Column(
      children: [
        Container(
          color: const Color(0xFF5B5B5B),
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
                '  $foodName\n',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              // TODO make show rating and comment from each user
              // TODO make input 1-5 stars and comment for user
            ],
          ),
        )
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

ElevatedButton buildElevatedButton(String title,
    IndicatorStatus indicatorStatus, BuildContext context, Widget nextPage) {
  Color backgroundColor;
  // Set background color based on indicator status
  switch (indicatorStatus) {
    case IndicatorStatus.normal:
      backgroundColor = Colors.green; // or any other color for normal
      break;
    case IndicatorStatus.less:
      backgroundColor = Colors.greenAccent; // Set your desired color for less
      break;
    case IndicatorStatus.crowded:
      backgroundColor = Colors.red; // Set your desired color for crowded
      break;
    case IndicatorStatus.medium:
      backgroundColor = Colors.yellow;
      break;
  }

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
