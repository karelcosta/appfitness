import 'package:appfitness/Data/ClassExercise.dart';

List<ExerciseData> exercicecasalist = [
  // Braço
  ExerciseData(
    id: 1,
    name: 'Braço',
    imageUrl: 'assets/images/braco02.jpg',
    calories: 120, // Ajuste da quantidade de calorias para Braço (Tipo 1)
    duration: '25-35 minutos', // Ajuste da duração para Braço (Tipo 1)
    description: '',
    tipo: 1,
    tasks: [16, 17, 18, 19, 20], // IDs dos exercícios para Braço (Tipo 1)
    nivel: 1,
  ),
  // Peito
  ExerciseData(
    id: 2,
    name: 'Peito',
    imageUrl: 'assets/images/peito05.jpg',
    calories: 180, // Ajuste da quantidade de calorias para Peito (Tipo 2)
    duration: '30-40 minutos', // Ajuste da duração para Peito (Tipo 2)
    description: '',
    tipo: 2,
    tasks: [1, 2, 3, 4, 5], // IDs dos exercícios para Peito (Tipo 2)
    nivel: 1,
  ),
  // Abdômen
  ExerciseData(
    id: 3,
    name: 'Abdômen',
    imageUrl: 'assets/images/abdominal.jpg',
    calories: 90, // Ajuste da quantidade de calorias para Abdômen (Tipo 3)
    duration: '15-25 minutos', // Ajuste da duração para Abdômen (Tipo 3)
    description: '',
    tipo: 3,
    tasks: [21, 22, 23, 24, 25], // IDs dos exercícios para Abdômen (Tipo 3)
    nivel: 1,
  ),
  // Perna
  ExerciseData(
    id: 4,
    name: 'Perna',
    imageUrl: 'assets/images/perna04.jpg',
    calories: 280, // Ajuste da quantidade de calorias para Perna (Tipo 4)
    duration: '35-55 minutos', // Ajuste da duração para Perna (Tipo 4)
    description: '',
    tipo: 4,
    tasks: [6, 7, 8, 9, 10], // IDs dos exercícios para Perna (Tipo 4)
    nivel: 1,
  ),
  // Costas e Ombro
  ExerciseData(
    id: 5,
    name: 'Costas e Ombro',
    imageUrl: 'assets/images/costa05.jpg',
    calories: 190, // Ajuste da quantidade de calorias para Costas e Ombro (Tipo 5)
    duration: '30-40 minutos', // Ajuste da duração para Costas e Ombro (Tipo 5)
    description: '',
    tipo: 5,
    tasks: [11, 12, 13, 14, 15], // IDs dos exercícios para Costas e Ombro (Tipo 5)
    nivel: 1,
  ),
];
