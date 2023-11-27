import 'package:flutter/material.dart';

class WorkoutSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações dos Treinos'),
      ),
      body: Center(
        child: Text(
          'Página de Configuração dos Treinos',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

