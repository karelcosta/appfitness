import 'package:flutter/material.dart';

class WeeklyGoalCard extends StatelessWidget {
  final List<bool> goalsAchieved;

  WeeklyGoalCard({required this.goalsAchieved});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 4,
      margin: EdgeInsets.all(8),
      color: Colors.black.withOpacity(0.8), // Define a cor do Card como preto
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Meta Semanal',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Define a cor do texto como branco
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                goalsAchieved.length,
                (index) => GestureDetector(
                  onTap: () {
                    // Adicione aqui a lógica para quando o usuário interagir com um dia da semana, se necessário
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: goalsAchieved[index] ? Colors.blue : Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        (index + 1).toString(), // Mostra o número do dia
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
