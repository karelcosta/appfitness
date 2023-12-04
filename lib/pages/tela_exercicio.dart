import 'package:flutter/material.dart';
import 'package:appfitness/components/card_dadosexercicios.dart';

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
      backgroundColor: Color(0xFF3b006b),//0xFF4D008C
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppBar(
              title: Text(
                '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true, // Centraliza o texto
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                    stops: [0.5, 1.0],
                  ),
                ),
              ),
              // automaticallyImplyLeading: false,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                height: 178,
                width: 280,
              ),
            ),

            SizedBox(height: 20), 
            
            DetalhesExercicio(
              duration: duration, // Substitua 'duration' e 'caloriesBurned' pelos seus valores
              caloriesBurned: caloriesBurned,
            ),

            SizedBox(height: 20), 

            Container(
              child: Text(
                exerciseName,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            SizedBox(height: 20), 

            Container(
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 20,
                  // fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

          ]
        ),
      ),
    );
  }
}