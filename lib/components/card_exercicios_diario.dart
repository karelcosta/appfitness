import 'package:flutter/material.dart';

class DailyExerciseCard extends StatelessWidget {
  final String exerciseName;
  final String exerciseImage;
  final String description;

  DailyExerciseCard({
    required this.exerciseName,
    required this.exerciseImage,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: SizedBox(
        height: 120,
        width: 280,
        child: Row(
          children: [
            // Exercise image
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
              ),
              child: Image.asset(
                exerciseImage,
                fit: BoxFit.cover,
                height: 120,
                width: 120,
              ),
            ),
            SizedBox(width: 8),
            // Exercise details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    exerciseName,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}