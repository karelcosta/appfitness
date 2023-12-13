import 'package:appfitness/Data/ClassExercise.dart';
import 'package:flutter/material.dart';
import 'package:appfitness/components/card_exercicios.dart';
import 'package:appfitness/components/card_exercicios_diario.dart';
import 'package:appfitness/adm.dart'; 
import 'package:appfitness/components/card_meta_semanal.dart';
// import 'package:appfitness/Data/DB.dart';
// import 'package:appfitness/Data/DataExercicios.dart';
import 'package:appfitness/Data/DataExeCasa.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> exerciseList = ExerciseData2.getExerciseList();
    List<ExerciseData> exeriniciante = filtrarExercicios(exerciceCasaList, [1,2,3,4,5], [1]);
    List<ExerciseData> exerintermediario = filtrarExercicios(exerciceCasaList, [1,2,3,4,5], [2]);
    List<ExerciseData> exeravancado = filtrarExercicios(exerciceCasaList, [1,2,3,4,5], [3]);

    return Scaffold(
      backgroundColor: Color(0xFF4D008C),
      body: SingleChildScrollView(
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
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: WeeklyGoalCard(
                goalsAchieved: [true, true, false, false, false, false, false],
              ),
            ),
            SizedBox(height: 30), 
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
                        nivel: exerciseList[index]['calories'],
                        tipo: exerciseList[index]['calories'],
                        tasks: [1,2,3,4,5],
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
                      'Treino em Casa',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Iniciante',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height - 80,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: exeriniciante.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: DailyExerciseCard(
                              exerciseName: exeriniciante[index].name,
                              imageUrl: exeriniciante[index].imageUrl,
                              description: exeriniciante[index].description,
                              caloriesBurned: exeriniciante[index].calories,
                              duration: exeriniciante[index].duration,
                              nivel: exeriniciante[index].nivel,
                              tipo: exeriniciante[index].tipo,
                              tasks: exeriniciante[index].tasks,
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 30), 
                    Text(
                      'intermediario',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height - 80,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: exerintermediario.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: DailyExerciseCard(
                              exerciseName: exerintermediario[index].name,
                              imageUrl: exerintermediario[index].imageUrl,
                              description: exerintermediario[index].description,
                              caloriesBurned: exerintermediario[index].calories,
                              duration: exerintermediario[index].duration,
                              nivel: exerintermediario[index].nivel,
                              tipo: exerintermediario[index].tipo,
                              tasks: exerintermediario[index].tasks,
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 30), 
                    Text(
                      'Avançado',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height - 50,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: exeravancado.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: DailyExerciseCard(
                              exerciseName: exeravancado[index].name,
                              imageUrl: exeravancado[index].imageUrl,
                              description: exeravancado[index].description,
                              caloriesBurned: exeravancado[index].calories,
                              duration: exeravancado[index].duration,
                              nivel: exeravancado[index].nivel,
                              tipo: exeravancado[index].tipo,
                              tasks: exeravancado[index].tasks,
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 30),      
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