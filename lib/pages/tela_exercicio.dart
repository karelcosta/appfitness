import 'package:flutter/material.dart';

class ExerciseScreen extends StatelessWidget {
  final String exerciseName;
  final String imageUrl;
  final int caloriesBurned;
  final String duration;
  final String description;

  ExerciseScreen({
    required this.exerciseName,
    required this.imageUrl,
    required this.caloriesBurned,
    required this.duration,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4D008C),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                height: 178,
                width: 280,
              ),
            ),
            Text(
              description,
            ),
          ]
        ),
      ),
    );
  }
}
