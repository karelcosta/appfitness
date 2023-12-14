import 'package:appfitness/Data/ClassExercise.dart';

List<ExerciseData> exercicelistcorpotodo = [
  // Braço
  ExerciseData(
    id: 1,
    name: 'Membros Superiores',
    imageUrl: 'assets/images/01.png',
    calories: 400,
    duration: '60 a 75 minuto',
    description: 'Treino de menbros superiores braço, peito, costas, ombro',
    tipo: 1,
    tasks: [24,22,4,9,6,17,5,13], // Alterado para lista de inteiros
    nivel: 1,
  ),
  // Peito
  ExerciseData(
    id: 2,
    name: 'Membros Inferiores',
    imageUrl: 'assets/images/01.png',
    calories: 325,
    duration: '60 a 75 minutos',
    description: 'Treino dos membros inferiores pernas, panturrilhas, nadegas, ',
    tipo: 2,
    tasks: [ 2, 3, 8, 10, 11, 12, 18, 19], // Alterado para lista de inteiros
    nivel: 1,
  ),
];
