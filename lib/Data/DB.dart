import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:appfitness/Data/ClassTask.dart';
import 'package:appfitness/Data/ClassExercise.dart';
import 'package:appfitness/Data/ClassUser.dart';


class DatabaseHelper {
  Database? _database;

  Future<void> initializeDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'appfitnes.db');
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await _createUserTable(db);
        await _createTaskTable(db);
        await _createExerciciosTable(db);
      },
    );
  }

  Future<void> _createUserTable(Database db) async {
    await db.execute('''
      CREATE TABLE user(
        name TEXT,
        peso double,
        altura double,
        calorias INTEGER,
        exerciseCount INTEGER,
        trainingTime INTEGER
      )
    ''');
  }
  Future<void> _createTaskTable(Database db) async {
    await db.execute('''
      CREATE TABLE task(
        id INTEGER PRIMARY KEY,
        name TEXT,
        carga TEXT
      )
    ''');
  }


  Future<void> _createExerciciosTable(Database db) async {
    await db.execute('''
      CREATE TABLE exercicios(
        id INTEGER PRIMARY KEY,
        name TEXT,
        imageUrl TEXT,
        calories INTEGER,
        duration TEXT,
        description TEXT,
        tipo INTEGER,
        tasks TEXT,
        nivel INTEGER
      )
    ''');
  }



  //metodo para chamar o banco de dados
  //perguntar ao chat onde chamar esse metodo
  Future<Database> get database async {
    if (_database == null || !(_database!.isOpen)) {
      await initializeDatabase();
    }
    return _database!;
  }



  Future<void> insertExercises(List<ExerciseData> exercises) async {
    final db = await database;
    final batch = db.batch();

    exercises.forEach((exercise) {
      batch.insert('exercicios', {
        'id': exercise.id,
        'name': exercise.name,
        'imageUrl': exercise.imageUrl,
        'calories': exercise.calories,
        'duration': exercise.duration,
        'description': exercise.description,
        'tipo': exercise.tipo,
        'tasks': exercise.tasks.join(','),
        'nivel': exercise.nivel,
      });
    });

    await batch.commit(noResult: true);
  }


  // Future<List<ExerciseData>> getExercises() async {
  //   final db = await database;
  //   final exercisesData = await db.query('exercises');
  //   return exercisesData.map((data) {
  //     final tasks = (data['tasks'] as String).split(',');
  //     return ExerciseData(
  //       id: data['id'] as int,
  //       name: data['name'] as String,
  //       imageUrl: data['imageUrl'] as String,
  //       calories: data['calories'] as int,
  //       duration: data['duration'] as String,
  //       description: data['description'] as String,
  //       tipo: data['tipo'] as int,
  //       tasks: tasks,
  //       nivel: data['nivel'] as int,
  //     );
  //   }).toList();
  // }

  // Future<List<ExerciseData>> getExercisesByType(int tipo) async {
  //   final db = await database;
  //   final exercisesData = await db.query('exercicios', where: 'tipo = ?', whereArgs: [tipo]);
  //   return exercisesData.map((data) {
  //     final tasks = (data['tasks'] as String).split(',');
  //     return ExerciseData(
  //       id: data['id'] as int,
  //       name: data['name'] as String,
  //       imageUrl: data['imageUrl'] as String,
  //       calories: data['calories'] as int,
  //       duration: data['duration'] as String,
  //       description: data['description'] as String,
  //       tipo: data['tipo'] as int,
  //       tasks: tasks,
  //       nivel: data['nivel'] as int,
  //     );
  //   }).toList();
  // }

  // Future<List<ExerciseData>> getExercisesByLevel(int nivel) async {
  //   final db = await database;
  //   final exercisesData = await db.query('exercicios', where: 'nivel = ?', whereArgs: [nivel]);
  //   return exercisesData.map((data) {
  //     final tasks = (data['tasks'] as String).split(',');
  //     return ExerciseData(
  //       id: data['id'] as int,
  //       name: data['name'] as String,
  //       imageUrl: data['imageUrl'] as String,
  //       calories: data['calories'] as int,
  //       duration: data['duration'] as String,
  //       description: data['description'] as String,
  //       tipo: data['tipo'] as int,
  //       tasks: tasks,
  //       nivel: data['nivel'] as int,
  //     );
  //   }).toList();
  // }
  

}
