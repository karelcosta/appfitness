import 'package:flutter/material.dart';
import 'package:appfitness/adm.dart'; 

class BMIComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtendo os dados de peso e altura da classe UserData
    double userWeight = UserData.userWeight;
    double userHeight = UserData.userHeight;

    // Cálculo do IMC
    double bmi = userWeight / (userHeight * userHeight);

    // Lógica para determinar se o usuário está saudável com base no IMC
    String healthStatus = getHealthStatus(bmi);

    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Seu IMC é: ${bmi.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Status de saúde: $healthStatus',
            style: TextStyle(
              fontSize: 16,
              color: healthStatus == 'Saudável' ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  // Função para determinar o status de saúde com base no IMC
  String getHealthStatus(double bmi) {
    if (bmi < 18.5) {
      return 'Abaixo do peso';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Saudável';
    } else if (bmi >= 25.0 && bmi < 29.9) {
      return 'Sobrepeso';
    } else {
      return 'Obesidade';
    }
  }
}
