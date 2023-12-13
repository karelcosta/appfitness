import 'package:flutter/material.dart';
import 'package:appfitness/components/card_meta_semanal.dart'; 
import 'package:appfitness/components/imc.dart'; 
import 'package:appfitness/components/relatorio.dart'; 
import 'package:appfitness/adm.dart'; 
import 'package:appfitness/components/config_treinos.dart';
import 'package:appfitness/components/config_app.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    void _navigateToWorkoutSettings(BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WorkoutSettingsScreen()),
      );
    }

    void _navigateToAppSettings(BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AppSettingsScreen()),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xFF4D008C),
      // backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(  //SingleChildScrollView
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppBar(
              title: Text(
                'RELATORIO',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              automaticallyImplyLeading: false, // Centraliza o texto
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
            SizedBox(height: 20), 
            // StatsReport(),
            SizedBox(height: 20),
            WeeklyGoalCard(
                    goalsAchieved: [true, false, false, false, false, false, false],
                  ),
            SizedBox(height: 20), 
            BMIComponent(),
            SizedBox(height: 20), 
            Center(
              child: Text(
                'DEFINIÇÕES',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  // Adicione outros estilos aqui, se desejar
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _navigateToWorkoutSettings(context),
              child: Text('Configurações dos Treinos'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _navigateToAppSettings(context),
              child: Text('Configurações do Aplicativo'),
            ),
          ],
        ),
      ),
    );
  }
}
