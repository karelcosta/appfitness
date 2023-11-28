import 'package:flutter/material.dart';
import 'package:appfitness/adm.dart';
import 'package:appfitness/components/barra_de_navegação.dart';
import 'package:appfitness/themes/colors.dart';
import 'package:appfitness/pages/tela_cadastro.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppFitness',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagem na tela inteira
          Image.asset(
            'assets/images/image01.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          
          // Gradiente na metade inferior da tela
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, const Color.fromARGB(255, 0, 0, 0)],
                stops: [0.4, 1.0],
              ),
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 30, // Altere conforme necessário para ajustar a posição do botão
            child: Center(
              child: ButtonTheme(
                minWidth: 300.0, // Define a largura do botão
                height: 60.0, // Define a altura do botão
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UserRegistrationFlow()));
                    // Ação quando o botão é pressionado
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0), // Define a borda redonda
                    ),
                  ),
                  child: Text(
                    'Avançar',
                    style: TextStyle(fontSize: 18.0), // Define o tamanho do texto
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}