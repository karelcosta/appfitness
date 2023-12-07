import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

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
      CREATE TABLE exercicios_recomandados(
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
      CREATE TABLE exercicios_recomandados(
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


  //possivelmente remover essa tabela 
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
}
