import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RatingWidget extends StatefulWidget {
  final String foodName;

  const RatingWidget({super.key, required this.foodName});

  @override
  State<RatingWidget> createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  double averageRating = 0.0;

  @override
  void initState() {
    super.initState();
    _fetchAverageRating();
  }

  Future<void> _fetchAverageRating() async {
    try {
      double rating = await getAverageRating(widget.foodName);
      setState(() {
        averageRating = rating;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching average rating: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Average Rating: ',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            '$averageRating/5',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Future<double> getAverageRating(String foodName) async {
    double totalRating = 0;
    int numberOfRatings = 0;

    try {
      final DocumentSnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance
              .collection('feedback')
              .doc(foodName)
              .get();

      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      //print('Data Map: $data');

      if (kDebugMode) {
        print("DEBUG RATING WIDGET 1");
      }

      data.forEach((String userId, dynamic userFeedback) {
        if (kDebugMode) {
          print("DEBUG RATING WIDGET 2");
        }
        if (userFeedback.containsKey("rating")) {
          if (kDebugMode) {
            print("DEBUG RATING WIDGET 3");
          }
          int userRating = userFeedback["rating"];
          totalRating += userRating;
          numberOfRatings++;
        }
      });

      if (numberOfRatings > 0) {
        return totalRating / numberOfRatings;
      } else {
        return 0.0;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error getting average rating: $e');
      }
      return 0.0;
    }
  }
}