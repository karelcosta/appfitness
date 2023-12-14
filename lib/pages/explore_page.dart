import 'package:flutter/material.dart';
import 'package:appfitness/adm.dart';
import 'package:appfitness/components/card_exercicios_resumido.dart';
import 'package:appfitness/components/card_exercicios.dart';
import 'package:appfitness/Data/DataTaskCasa.dart';
import 'package:appfitness/Data/DataTask.dart';
import 'package:appfitness/Data/DataExeCorpoTodo.dart';
import 'package:appfitness/Data/DataExeCorpoTodo.dart';
import 'package:appfitness/Data/ClassExercise.dart';
import 'package:appfitness/Data/DataExeCasa.dart';

class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<ExerciseData> casalist = filtrarExercicios(exercicecasalist, [1,2,3,4,5], [1,2,3,4]);

    return Scaffold(
      backgroundColor: Color(0xFF3F0072),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                title: Text(
                  'DESCOBRIR',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                automaticallyImplyLeading: false,
              ),
              Center(
                child: ExerciseCard(
                  exerciseName: 'Corpo Todo',
                  imageUrl: 'assets/images/corpotodo.jpg',
                  caloriesBurned: 400,
                  duration: '45 minutos a 1 hora',
                  description: 'Este treino abrange todos os principais grupos musculares, fortalecendo pernas, braços, costas, peito, ombros e abdômen. Cada exercício foi selecionado para garantir um treino completo, ajudando a alcançar um corpo mais equilibrado e forte. Prepare-se para desafiar-se e alcançar um condicionamento físico abrangente!',
                  tipo: 5,
                  nivel: 5,
                  tasks: [2,1,3,4,6,7],
                  listTasks: listasks,
                ),
              ),
              SizedBox(height: 50),
              Center(
                child: ExerciseCard(
                  exerciseName: 'Corpo Todo Em Casa',
                  imageUrl: 'assets/images/perna05.jpg',
                  caloriesBurned: 300,
                  duration: '30 a 45 minutos',
                  description: 'Este treino abrangente é projetado para trabalhar todo o corpo de maneira eficaz. Inclui exercícios focados em diferentes áreas, como peito, pernas, costas, ombros, braços e abdominais. Ao realizar esta rotina, você estará fortalecendo e tonificando diversos grupos musculares, promovendo resistência, estabilidade e definição muscular em todo o corpo. Prepare-se para um treino completo que visa aprimorar sua força e condicionamento físico global.',
                  tipo: 5,
                  nivel: 5,
                  tasks: [1,6,11,16,21],
                  listTasks: listaskscasa,
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Treinos em casa',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 178,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: casalist.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ExerciseCardRezumid(
                          exerciseName: casalist[index].name,
                          imageUrl: casalist[index].imageUrl,
                          description: casalist[index].description,
                          caloriesBurned: casalist[index].calories,
                          duration: casalist[index].duration,
                          nivel: casalist[index].calories,
                          tipo: casalist[index].calories,
                          tasks: casalist[index].tasks,
                          listTasks: listaskscasa,
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
