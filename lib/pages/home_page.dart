import 'package:flutter/material.dart';
import 'package:appfitness/components/card_exercicios.dart';
import 'package:appfitness/components/card_exercicios_diario.dart';
import 'package:appfitness/adm.dart'; 
import 'package:appfitness/components/card_meta_semanal.dart'; // Importe o componente do card de meta semanal

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    List<Map<String, dynamic>> exerciseList = ExerciseData.getExerciseList();
    List<Map<String, dynamic>> dailyExerciseList = ExerciseData.getDailyExerciseList();

    return Scaffold(
      backgroundColor: Color(0xFF4D008C),
      // backgroundColor: Colors.grey.shade200, // Definindo a cor de fundo
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 90,
            width: 1000,
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Coluna da Esquerda
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bom dia',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          // Adicione outros estilos aqui, se desejar
                        ),
                      ),
                      Text(
                        'name', // Nome do usuário
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          // Adicione outros estilos aqui, se desejar
                        ),
                      ),
                    ],
                  ),
                ),
                // Coluna da Direita (vazia por enquanto)
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
              ],
            ),
          ),
          // SizedBox(height: 5), // Espaço entre o nome e o card de meta semanal
          // ...
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: WeeklyGoalCard(
              goalsAchieved: [true, true, false, false, false, false, false], // Exemplo de metas alcançadas
            ),
          ),
          // ...

          SizedBox(height: 15), 
          Container(
            padding: EdgeInsets.only(left: 16.0), // Espaçamento à esquerda
            child: Text(
              'Escolhas para você',
              style: TextStyle(
                fontSize: 17,
                color: Colors.white,
                // Adicione outros estilos aqui, se desejar
              ),
            ),
          ),
          SizedBox(height: 5), // Espaço entre o card de meta semanal e a lista de exercícios
          Container(
            height: 178,
            width: 1000,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0), // Espaçamento à esquerda
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: exerciseList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ExerciseCard(
                      exerciseName: exerciseList[index]['name'],
                      imageUrl: exerciseList[index]['imageUrl'],
                      caloriesBurned: exerciseList[index]['calories'],
                      duration: exerciseList[index]['duration'],
                      description: exerciseList[index]['description'],
                    ),
                  );
                },
              ),
            ),  
          ),
          SizedBox(height: 30), // Espaço entre a lista de exercícios e os exercícios diários
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white, // Cor de fundo branca
                borderRadius: BorderRadius.circular(20), // Bordas curvadas em 20
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Exercícios Diários',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: dailyExerciseList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: DailyExerciseCard(
                              exerciseName: dailyExerciseList[index]['name'],
                              imageUrl: dailyExerciseList[index]['imageUrl'],
                              description: dailyExerciseList[index]['description'],
                              caloriesBurned: 0,
                              duration: '',
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
