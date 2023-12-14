import 'package:appfitness/Data/ClassExercise.dart';
import 'package:flutter/material.dart';
import 'package:appfitness/components/card_exercicios.dart';
import 'package:appfitness/components/card_exercicios_diario.dart';
import 'package:appfitness/adm.dart';
import 'package:appfitness/Data/DataExercicios.dart';
import 'package:appfitness/Data/DataTask.dart';
import 'package:appfitness/Data/DataExeCorpoTodo.dart';
import 'package:appfitness/components/imc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<ExerciseData> corpotodo = filtrarExercicios(exercicelistcorpotodo, [1,2,3,4,5], [1,2,3,4]);
    List<ExerciseData> exeriniciante = filtrarExercicios(exercicelist, [1,2,3,4,5], [1]);

    return Scaffold(
      backgroundColor: Color(0xFF3F0072),
      body:SafeArea(
        child: SingleChildScrollView(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(
                  'TrainTact',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                centerTitle: true,
                automaticallyImplyLeading: false,
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
                  itemCount: corpotodo.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ExerciseCard(
                        exerciseName: corpotodo[index].name,
                        imageUrl: corpotodo[index].imageUrl,
                        caloriesBurned: corpotodo[index].calories,
                        duration: corpotodo[index].duration,
                        description: corpotodo[index].description,
                        nivel: corpotodo[index].nivel,
                        tipo: corpotodo[index].tipo,
                        tasks: corpotodo[index].tasks,
                        listTasks: listasks,
                      ),
                    );
                  },
                ),
              ),  
            ),
            SizedBox(height: 20),
            BMIComponent(),
            SizedBox(height: 20),
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
                      'Treinos',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
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
                              listTasks: listasks,
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
      ),
    );
  }
}
       