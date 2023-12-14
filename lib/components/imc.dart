import 'package:flutter/material.dart';

class UserData {
  static double userWeight = 0.0;
  static double userHeight = 0.0;
}

class BMIComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _showDataInputDialog(context);
      },
      child: Text('Calcular IMC'),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  void _showDataInputDialog(BuildContext context) {
    TextEditingController weightController = TextEditingController();
    TextEditingController heightController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          title: Text('Informe seu peso e altura'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Peso (kg)'),
              ),
              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Altura (m)'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  String weight = weightController.text;
                  String height = heightController.text;

                  if (weight.isEmpty || height.isEmpty) {
                    _showErrorDialog(context);
                  } else {
                    UserData.userWeight = double.parse(weight);
                    UserData.userHeight = double.parse(height);
                    Navigator.pop(context); // Fecha o pop-up de entrada de dados
                    _showBMIResultDialog(context);
                  }
                },
                child: Text('Calcular'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showBMIResultDialog(BuildContext context) {
    double userWeight = UserData.userWeight;
    double userHeight = UserData.userHeight;
    double bmi = userWeight / (userHeight * userHeight);
    String healthStatus = getHealthStatus(bmi);

    Color textColor = Colors.green; // Cor padrão para "Saudável"
    if (healthStatus == 'Abaixo do peso' || healthStatus == 'Sobrepeso') {
      textColor = Colors.amber;
    } else if (healthStatus == 'Obesidade') {
      textColor = Colors.red;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          title: Text('Seu IMC é: ${bmi.toStringAsFixed(2)}'),
          content: Text(
            'Status de saúde: $healthStatus',
            style: TextStyle(
              color: textColor,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Fecha o pop-up do resultado do IMC
              },
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          title: Text('Erro'),
          content: Text('Por favor, preencha todos os campos.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Fecha o pop-up de erro
              },
              child: Text(
                'Fechar',
                style: TextStyle(color: Colors.transparent),
              ),
            ),
          ],
        );
      },
    );
  }

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
