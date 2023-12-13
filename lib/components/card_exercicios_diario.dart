import 'package:flutter/material.dart';
import 'package:appfitness/pages/tela_exercicio.dart';

class DailyExerciseCard extends StatelessWidget {
  final String exerciseName;
  final String imageUrl;
  final int caloriesBurned;
  final String duration;
  final String description;
  final int tipo;
  final int nivel;
  final List<int> tasks;

  DailyExerciseCard({
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
      child:Card(
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
                  imageUrl,
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
                      '',
                      style: TextStyle(fontSize: 14),
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