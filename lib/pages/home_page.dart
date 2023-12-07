import 'package:flutter/material.dart';
import 'package:appfitness/components/card_exercicios.dart';
import 'package:appfitness/components/card_exercicios_diario.dart';
import 'package:appfitness/adm.dart'; 
import 'package:appfitness/components/card_meta_semanal.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> exerciseList = ExerciseData.getExerciseList();
    List<Map<String, dynamic>> dailyExerciseList = ExerciseData.getDailyExerciseList();

    return Scaffold(
      backgroundColor: Color(0xFF4D008C),
      body: SingleChildScrollView( // Envolver toda a estrutura em um SingleChildScrollView
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              automaticallyImplyLeading: false, 
            ),
            Container(
              height: 90,
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                          ),
                        ),
                        Text(
                          'name',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: WeeklyGoalCard(
                goalsAchieved: [true, true, false, false, false, false, false],
              ),
            ),
            SizedBox(height: 15), 
            Container(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                'Escolhas para você',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 5),
            Container(
              height: 178,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
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
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
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
                    // SizedBox(height: 10),
                    Container(
                      height: MediaQuery.of(context).size.height - 380, // Definindo a altura da lista para ocupar o restante da tela
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: dailyExerciseList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: DailyExerciseCard(
                              exerciseName: dailyExerciseList[index]['name'],
                              imageUrl: dailyExerciseList[index]['imageUrl'],
                              description: dailyExerciseList[index]['description'],
                              caloriesBurned: dailyExerciseList[index]['calories'],
                              duration: dailyExerciseList[index]['duration'],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Exercícios Diários',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // SizedBox(height: 10),
                    Container(
                      height: MediaQuery.of(context).size.height - 380, // Definindo a altura da lista para ocupar o restante da tela
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: dailyExerciseList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: DailyExerciseCard(
                              exerciseName: dailyExerciseList[index]['name'],
                              imageUrl: dailyExerciseList[index]['imageUrl'],
                              description: dailyExerciseList[index]['description'],
                              caloriesBurned: dailyExerciseList[index]['calories'],
                              duration: dailyExerciseList[index]['duration'],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Exercícios Diários',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // SizedBox(height: 10),
                    Container(
                      height: MediaQuery.of(context).size.height - 380, // Definindo a altura da lista para ocupar o restante da tela
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: dailyExerciseList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: DailyExerciseCard(
                              exerciseName: dailyExerciseList[index]['name'],
                              imageUrl: dailyExerciseList[index]['imageUrl'],
                              description: dailyExerciseList[index]['description'],
                              caloriesBurned: dailyExerciseList[index]['calories'],
                              duration: dailyExerciseList[index]['duration'],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
