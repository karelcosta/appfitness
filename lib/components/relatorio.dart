import 'package:flutter/material.dart';
import 'package:appfitness/adm.dart'; 

class StatsReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int exerciseCount = UserData.exerciseCount;
    int calories = UserData.calories;
    int trainingTime = UserData.trainingTime;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Text(
          //   'Relatório',
          //   style: TextStyle(
          //     fontSize: 20,
          //     fontWeight: FontWeight.bold,
          //   ),
          //   textAlign: TextAlign.center,
          // ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    'Treinos',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '$exerciseCount',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Calorias',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '$calories',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Tempo',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '$trainingTime min',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}