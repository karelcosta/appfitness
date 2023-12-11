import 'dart:io';
import 'package:flutter/services.dart';
import 'package:appfitness/Data/ClassExercise.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

Future<Database> initDatabase() async {
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String path = join(documentsDirectory.path, "appfitness.db");

  bool exists = await databaseExists(path);

  if (!exists) {
    // Se o banco de dados não existir no armazenamento local, copie-o dos assets
    ByteData data = await rootBundle.load("assets/db/appfitness.db");
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(path).writeAsBytes(bytes, flush: true);
  }

  return openDatabase(path, version: 1); //return openDatabase(path);
}

Future<List<ExerciseData>> getExercises() async {
  final db = await initDatabase();
  final exercisesData = await db.query('exercises');
  return exercisesData.map((data) {
    final tasks = (data['tasks'] as String).split(',');
    return ExerciseData(
      id: data['id'] as int,
      name: data['name'] as String,
      imageUrl: data['imageUrl'] as String,
      calories: data['calories'] as int,
      duration: data['duration'] as String,
      description: data['description'] as String,
      tipo: data['tipo'] as int,
      tasks: tasks,
      nivel: data['nivel'] as int,
    );
  }).toList();
}

Future<List<ExerciseData>> getExercisesByType(int tipo) async {
  final db = await initDatabase();
  final exercisesData = await db.query('exercicios', where: 'tipo = ?', whereArgs: [tipo]);
  return exercisesData.map((data) {
    final tasks = (data['tasks'] as String).split(',');
    return ExerciseData(
      id: data['id'] as int,
      name: data['name'] as String,
      imageUrl: data['imageUrl'] as String,
      calories: data['calories'] as int,
      duration: data['duration'] as String,
      description: data['description'] as String,
      tipo: data['tipo'] as int,
      tasks: tasks,
      nivel: data['nivel'] as int,
    );
  }).toList();
}

Future<List<ExerciseData>> getExercisesByLevel(int nivel) async {
  final db = await initDatabase();
  final exercisesData = await db.query('exercicios', where: 'nivel = ?', whereArgs: [nivel]);
  return exercisesData.map((data) {
    final tasks = (data['tasks'] as String).split(',');
    return ExerciseData(
      id: data['id'] as int,
      name: data['name'] as String,
      imageUrl: data['imageUrl'] as String,
      calories: data['calories'] as int,
      duration: data['duration'] as String,
      description: data['description'] as String,
      tipo: data['tipo'] as int,
      tasks: tasks,
      nivel: data['nivel'] as int,
    );
  }).toList();
}


