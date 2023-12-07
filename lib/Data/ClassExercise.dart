// import 'package:appfitness/Data/ClassTask.dart';

class ExerciseData {
  final int id;
  final String name;
  final String imageUrl;
  final int calories;
  final String duration;
  final String description;
  final int tipo;
  final List<String> tasks; 
  final int nivel;

  ExerciseData({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.calories,
    required this.duration,
    required this.description,
    required this.tipo,
    required this.tasks,
    required this.nivel,

  });
}