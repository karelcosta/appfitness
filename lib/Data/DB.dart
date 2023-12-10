import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:appfitness/Data/ClassTask.dart';
import 'package:appfitness/Data/ClassExercise.dart';
import 'package:appfitness/Data/ClassUser.dart';


class DatabaseHelper {
  late Database _database;

  Future<void> initializeDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'appfitnes.db');
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await _createUserTable(db);
        await _createExerciciosRecomandadosTable(db);
        await _createExerciciosDestaqueTable(db);
        await _createExerciciosTable(db);
        await _createExerciciosRapidosTable(db);
        await _createAquecimentosRapidosTable(db);
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
  Future<void> _createExerciciosRecomandadosTable(Database db) async {
    await db.execute('''
      CREATE TABLE exerciciosrecomandados(
        id INTEGER PRIMARY KEY,
        name TEXT,
        imageUrl TEXT,
        calories INTEGER,
        duration TEXT,
        description TEXT,
        task TEXT
      )
    ''');
  }
  Future<void> _createExerciciosDestaqueTable(Database db) async {
    await db.execute('''
      CREATE TABLE exerciciosdestaque(
        id INTEGER PRIMARY KEY,
        name TEXT,
        imageUrl TEXT,
        calories INTEGER,
        duration TEXT,
        description TEXT,
        task TEXT
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
        task TEXT
        nivel INTEGER,
      )
    ''');
  }
  Future<void> _createExerciciosRapidosTable(Database db) async {
    await db.execute('''
      CREATE TABLE exercicios_rapidos(
        id INTEGER PRIMARY KEY,
        name TEXT,
        imageUrl TEXT,
        calories INTEGER,
        duration TEXT,
        description TEXT,
        task TEXT
      )
    ''');
  }
  Future<void> _createAquecimentosRapidosTable(Database db) async {
    await db.execute('''
      CREATE TABLE aquecimentos_rapidos(
        id INTEGER PRIMARY KEY,
        name TEXT,
        imageUrl TEXT,
        calories INTEGER,
        duration TEXT,
        description TEXT,
        task TEXT
      )
    ''');
  }

  //metodo para chamar o banco de dados
  //perguntar ao chat onde chamar esse metodo
  Future<Database> get database async {
    if (_database == null) {
      await initializeDatabase();
    }
    if (!_database.isOpen) {
      await initializeDatabase();
    }
    return _database;
  }



  Future<void> insertExercises(List<ExerciseData> exercises) async {
    final db = await database;
    final batch = db.batch();

    exercises.forEach((exercise) {
      batch.insert('exercises', {
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


  Future<List<ExerciseData>> getExercises() async {
    final db = await database;
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
}
