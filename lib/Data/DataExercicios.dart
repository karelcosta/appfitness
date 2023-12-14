import 'package:appfitness/Data/ClassExercise.dart';

List<ExerciseData> exercicelist = [
  // Braço
  ExerciseData(
    id: 1,
    name: 'Braço',
    imageUrl: 'assets/images/01.png',
    calories: 0,
    duration: '',
    description: '',
    tipo: 1,
    tasks: [1, 6, 16, 17, 20], // Alterado para lista de inteiros
    nivel: 1,
  ),
  // Peito
  ExerciseData(
    id: 2,
    name: 'Peito',
    imageUrl: 'assets/images/01.png',
    calories: 0,
    duration: '',
    description: '',
    tipo: 2,
    tasks: [1], // Alterado para lista de inteiros
    nivel: 1,
  ),
  // Abdomen
  ExerciseData(
    id: 3,
    name: 'Abdômen',
    imageUrl: 'assets/images/01.png',
    calories: 0,
    duration: '',
    description: '',
    tipo: 3,
    tasks: [7, 15], // Alterado para lista de inteiros
    nivel: 1,
  ),
  // Perna
  ExerciseData(
    id: 4,
    name: 'Perna',
    imageUrl: 'assets/images/01.png',
    calories: 0,
    duration: '',
    description: '',
    tipo: 4,
    tasks: [2, 3, 8, 10, 11, 12, 18, 19], // Alterado para lista de inteiros
    nivel: 1,
  ),
  // Costas e Ombro
  ExerciseData(
    id: 5,
    name: 'Costas e Ombro',
    imageUrl: 'assets/images/01.png',
    calories: 0,
    duration: '',
    description: '',
    tipo: 5,
    tasks: [4, 5, 9, 13, 14], // Alterado para lista de inteiros
    nivel: 1,
  ),
];
