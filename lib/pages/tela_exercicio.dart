import 'package:appfitness/main.dart';
import 'package:flutter/material.dart';
import 'package:appfitness/components/card_dadosexercicios.dart';
import 'package:appfitness/adm.dart';
import 'package:appfitness/components/task.dart';
import 'package:appfitness/Data/ClassTask.dart';
// import 'package:appfitness/pages/play.dart';

class ExerciseScreen extends StatelessWidget {
  final String exerciseName;
  final String imageUrl;
  final int caloriesBurned;
  final String duration;
  final String description;
  final int nivel;
  final int tipo;
  final List<int> tasks;
  final List<TaskData> listTasks;

  ExerciseScreen({
    required this.exerciseName,
    required this.imageUrl,
    required this.caloriesBurned,
    required this.duration,
    required this.description,
    required this.nivel,
    required this.tipo,
    required this.tasks,
    required this.listTasks,

  });

  @override
  Widget build(BuildContext context) {

    List<TaskData> taskList = filterTasksByListIds(listTasks, tasks);

    return Scaffold(
      backgroundColor: Color(0xFF3b006b),//0xFF4D008C
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true, // Centraliza o texto
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                    stops: [0.5, 1.0],
                  ),
                ),
              ),
              // automaticallyImplyLeading: false,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                height: 178,
                width: 280,
              ),
            ),
            SizedBox(height: 20), 
            DetalhesExercicio(
              duration: duration, 
              caloriesBurned: caloriesBurned,
            ),
            SizedBox(height: 20), 
            Container(
              child: Text(
                exerciseName,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20), 
            Container(
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20), 
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: taskList.length, 
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0), // Aumentando o espaço vertical
                  child: Task(
                    name: taskList[index].name,
                    carga: taskList[index].carga,
                    id: taskList[index].id,
                    tipo: taskList[index].tipo,
                  ),
                );
              },
            ),
          ]
        ),
      ),
    );
  }
}