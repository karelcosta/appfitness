import 'package:flutter/material.dart';
import 'package:appfitness/adm.dart';
import 'package:appfitness/components/card_exercicios_resumido.dart';
import 'package:appfitness/components/card_exercicios.dart';
import 'package:appfitness/Data/DataTaskCasa.dart';
import 'package:appfitness/Data/DataTask.dart';

class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> exerecomendado = ExerciseData2.getRecommendedExercises1();
    List<Map<String, dynamic>> exerapido = ExerciseData2.getQuickWorkouts();

    return Scaffold(
      backgroundColor: Color(0xFF4D008C),
      // backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Alinha os widgets filhos à esquerda
          children: [
            AppBar(
              title: Text(
                  'DESCOBRIR',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24, // Cor do texto
                  ),
                ),
                backgroundColor: Colors.transparent, // Fundo transparente
                elevation: 0, // Remove a sombra
                automaticallyImplyLeading: false, // Para remover o botão de voltar padrão // Para remover o botão de voltar padrão
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
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0), // Ajusta o espaçamento
              child: Text(
                'Recomendados para você',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  // Adicione outros estilos aqui, se desejar
                ),
              ),
            ),
            Container(
              height: 178,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0), // Espaçamento à esquerda
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: exerecomendado.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ExerciseCardRezumid(
                        exerciseName: exerecomendado[index]['name'],
                        imageUrl: exerecomendado[index]['imageUrl'],
                        description: exerecomendado[index]['description'],
                        caloriesBurned: exerecomendado[index]['calories'],
                        duration: exerecomendado[index]['duration'],
                        nivel: exerecomendado[index]['calories'],
                        tipo: exerecomendado[index]['calories'],
                        tasks: [1,2,3,4,5],
                        listTasks: listasks,
                      ),
                    );
                  },
                ),
              ),
            ),
            
            SizedBox(height: 100), 
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
          ],
        ),
      ),
    );
  }
}
