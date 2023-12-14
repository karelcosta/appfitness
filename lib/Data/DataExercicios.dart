import 'package:appfitness/Data/ClassExercise.dart';

List<ExerciseData> exercicelist = [
  // Braço
  ExerciseData(
    id: 1,
    name: 'Braço',
    imageUrl: 'assets/images/braco01.jpg',
    calories: 150,
    duration: '20-40 minutos',
    description: '',
    tipo: 1,
    tasks: [6, 16, 17, 20, 31, 32, 33, 34, 35], // Alterado para lista de inteiros
    nivel: 1,
  ),
  // Peito
  ExerciseData(
    id: 2,
    name: 'Peito',
    imageUrl: 'assets/images/peito01.jpg',
    calories: 200,
    duration: '30-45 minutos',
    description: '',
    tipo: 2,
    tasks: [ 1, 21, 22, 23, 24, 25], // Alterado para lista de inteiros
    nivel: 1,
  ),
  // Abdomen
  ExerciseData(
    id: 3,
    name: 'Abdômen',
    imageUrl: 'assets/images/abdominal.jpg',
    calories: 100,
    duration: '15-30 minutos',
    description: '',
    tipo: 3,
    tasks: [7, 15, 26, 27, 28, 29, 30], // Alterado para lista de inteiros
    nivel: 1,
  ),
  // Perna
  ExerciseData(
    id: 4,
    name: 'Perna',
    imageUrl: 'assets/images/perna03.jpg',
    calories: 300,
    duration: '30-60 minutos',
    description: '',
    tipo: 4,
    tasks: [2, 3, 8, 10, 11, 12, 18, 19], // Alterado para lista de inteiros
    nivel: 1,
  ),
  // Costas e Ombro
  ExerciseData(
    id: 5,
    name: 'Costas e Ombro',
    imageUrl: 'assets/images/costa02.jpg',
    calories: 200,
    duration: '30-45 minutos',
    description: '',
    tipo: 5,
    tasks: [4, 5, 9, 13, 14], // Alterado para lista de inteiros
    nivel: 1,
  ),
];
