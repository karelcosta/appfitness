import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ExerciseDatabase {
  static Future<Database> openDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'exercise_database.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE exercicios_em_destaque(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            imageUrl TEXT,
            calories INTEGER,
            duration TEXT,
            description TEXT
          )
        ''');

        await createAdditionalTables(db);
      },
    );
  }

  static Future<void> createAdditionalTables(Database db) async {
    await db.execute('''
      CREATE TABLE exercicios_diarios(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        imageUrl TEXT,
        calories INTEGER,
        duration TEXT,
        description TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE exercicios_rapidos(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        imageUrl TEXT,
        calories INTEGER,
        duration TEXT,
        description TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE exercicios_recomendados(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        imageUrl TEXT,
        calories INTEGER,
        duration TEXT,
        description TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE aquecimento_rapido(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        imageUrl TEXT,
        calories INTEGER,
        duration TEXT,
        description TEXT
      )
    ''');
  }

  static Future<void> insertExercises(String tableName) async {
    final Database db = await openDB();
    final exercises = getExerciseList();

    for (var exercise in exercises) {
      await db.insert(
        tableName,
        exercise,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  static Future<List<Map<String, dynamic>>> getExercisesFromDB(String tableName) async {
    final Database db = await openDB();
    return db.query(tableName);
  }

  static Future<List<Map<String, dynamic>>> getExerciciosEmDestaqueFromDB() async {
    return getExercisesFromDB('exercicios_em_destaque');
  }

  static Future<void> insertExerciciosEmDestaque() async {
    return insertExercises('exercicios_em_destaque');
  }

  static List<Map<String, dynamic>> getExerciseList() {
    return [
      {
        'name': 'Exercício 1',
        'imageUrl': 'assets/images/01.png',
        'calories': 100,
        'duration': '30 minutos',
        'description': 'Descrição do exercício diário 1',
      },
      {
        'name': 'Exercício 2',
        'imageUrl': 'assets/images/02.png',
        'calories': 100,
        'duration': '30 minutos',
        'description': 'Descrição do exercício diário 1',
      },
      {
        'name': 'Exercício 3',
        'imageUrl': 'assets/images/03.png',
        'calories': 100,
        'duration': '30 minutos',
        'description': 'Descrição do exercício diário 1',
      },
      // Adicione mais exercícios conforme necessário
    ];
  }
  static List<Map<String, dynamic>> getDailyExerciseList() {
    return [
      {
        'name': 'Exercício Diário 1',
        'imageUrl': 'assets/images/04.png',
        'calories': 120,
        'duration': '25 minutos',
        'description': 'Descrição do exercício diário 1',
      },
      {
        'name': 'Exercício Diário 2',
        'imageUrl': 'assets/images/05.png',
        'calories': 120,
        'duration': '25 minutos',
        'description': 'Descrição do exercício diário 1',
      },
      {
        'name': 'Exercício Diário 3',
        'imageUrl': 'assets/images/06.png',
        'calories': 120,
        'duration': '25 minutos',
        'description': 'Descrição do exercício diário 1',
      },
      
      // Adicione mais exercícios diários conforme necessário
    ];
  }

  static List<Map<String, dynamic>> getRecommendedExercises1() {
    return [
      {
        'name': 'Exercício Recomendado 1',
        'imageUrl': 'assets/images/12.png',
        'calories': 120,
        'duration': '25 minutos',
        'description': 'Descrição do Exercício Recomendado 1',
      },
      {
        'name': 'Exercício Recomendado 2',
        'imageUrl': 'assets/images/11.png',
        'calories': 110,
        'duration': '20 minutos',
        'description': 'Descrição do Exercício Recomendado 2',
      },
      {
        'name': 'Exercício Recomendado 3',
        'imageUrl': 'assets/images/10.png',
        'calories': 130,
        'duration': '30 minutos',
        'description': 'Descrição do Exercício Recomendado 3',
      },

    ];
  }
  static List<Map<String, dynamic>> getQuickWorkouts() {
    return [
      {
        'name': 'Treino Rápido 1',
        'imageUrl': 'assets/images/11.png',
        'calories': 90,
        'duration': '18 minutos',
        'description': 'Descrição do Treino Rápido 1',
      },
      {
        'name': 'Treino Rápido 2',
        'imageUrl': 'assets/images/12.png',
        'calories': 85,
        'duration': '15 minutos',
        'description': 'Descrição do Treino Rápido 2',
      },
      {
        'name': 'Treino Rápido 3',
        'imageUrl': 'assets/images/13.png',
        'calories': 95,
        'duration': '20 minutos',
        'description': 'Descrição do Treino Rápido 3',
      },
      {
        'name': 'Treino Rápido 4',
        'imageUrl': 'assets/images/14.png',
        'calories': 105,
        'duration': '22 minutos',
        'description': 'Descrição do Treino Rápido 4',
      },
    ];
  }
  static List<Map<String, dynamic>> getQuickaquecimento() {
    return [
      {
        'name': 'aquecimento Rápido 1',
        'imageUrl': 'assets/images/15.png',
        'calories': 90,
        'duration': '18 minutos',
        'description': 'Descrição do aquecimento Rápido 1',
      },
      {
        'name': 'aquecimento Rápido 2',
        'imageUrl': 'assets/images/16.png',
        'calories': 85,
        'duration': '15 minutos',
        'description': 'Descrição do aquecimento Rápido 2',
      },
    ];
  }
  static List<Map<String, dynamic>> gettaskList() {
    return [
      {
        'name': 'Exercício 1',
        'imageUrl': 'assets/images/01.png',
        'calories': 100,
        'duration': '30 minutos',
        'description': 'Descrição do exercício diário 1',
      },
      {
        'name': 'Exercício 2',
        'imageUrl': 'assets/images/02.png',
        'calories': 100,
        'duration': '30 minutos',
        'description': 'Descrição do exercício diário 1',
      },
      {
        'name': 'Exercício 3',
        'imageUrl': 'assets/images/03.png',
        'calories': 100,
        'duration': '30 minutos',
        'description': 'Descrição do exercício diário 1',
      },
      // Adicione mais exercícios conforme necessário
    ];
  }
}
