import 'package:flutter/material.dart';
import 'package:appfitness/pages/tela_exercicio.dart';

class ExerciseCard extends StatelessWidget {
  final String exerciseName;
  final String imageUrl;
  final int caloriesBurned;
  final String duration;
  final String description;
  final int tipo;
  final int nivel;
  final List<int> tasks;

  ExerciseCard({
    required this.exerciseName,
    required this.imageUrl,
    required this.caloriesBurned,
    required this.duration,
    required this.description,
    required this.tipo,
    required this.nivel,
    required this.tasks,

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ExerciseScreen(
              exerciseName: exerciseName,
              imageUrl: imageUrl,
              caloriesBurned: caloriesBurned,
              duration: duration,
              description: description,
              tipo: tipo,
              nivel: nivel,
              tasks: tasks,
            ), // Substitua ExerciseScreen() pela sua tela de exercício
          ),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: SizedBox(
          height: 178,
          width: 280,
          child: Stack(
            children: [
              // Background image
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                  height: 178,
                  width: 280,
                ),
              ),
              // Exercise name
              Positioned(
                top: 8,
                left: 8,
                child: Text(
                  exerciseName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Exercise details
              Positioned(
                bottom: 8,
                left: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Calories and duration
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Calories: $caloriesBurned',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Duration: $duration',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 8),
                        // Play button
                        Icon(
                          Icons.play_circle_filled,
                          color: Colors.white,
                          size: 40,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
