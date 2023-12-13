import 'package:appfitness/Data/ClassExercise.dart';
import 'package:appfitness/Data/ClassTask.dart';

class ExerciseData2 {
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

class UserData {
  static double userWeight = 75.0; // Peso do usuário em kg
  static double userHeight = 1.75; // Altura do usuário em metros
  static int calories = 1500; // Dados do relatório
  static int exerciseCount = 5; // Dados do relatório
  static int trainingTime = 120; // Dados do relatório
}

List<ExerciseData> filtrarExercicios(List<ExerciseData> exercicios, List<int> tipos, List<int> niveis) {
  return exercicios.where((exercicio) => tipos.contains(exercicio.tipo) && niveis.contains(exercicio.nivel)).toList();
}

List<TaskData> filterTasksById(List<TaskData> tasks, int id) {
  return tasks.where((task) => task.id == id).toList();
}

List<TaskData> filterTasksByListIds(List<TaskData> tasks, List<int> ids) {
  return tasks.where((task) => ids.contains(task.id)).toList();
}