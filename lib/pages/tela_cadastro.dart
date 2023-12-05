import 'package:flutter/material.dart';
import 'package:appfitness/pages/pages_cadastro/genero.dart';
import 'package:appfitness/pages/pages_cadastro/foco.dart';
import 'package:appfitness/pages/pages_cadastro/objetivo.dart';
import 'package:appfitness/pages/pages_cadastro/nivel.dart';
import 'package:appfitness/components/barra_de_navegação.dart';

class UserRegistrationFlow extends StatefulWidget {
  @override
  _UserRegistrationFlowState createState() => _UserRegistrationFlowState();
}

class _UserRegistrationFlowState extends State<UserRegistrationFlow> {
  int _currentStep = 0; // Controla a etapa atual do fluxo de cadastro

  List<Widget> _steps = [
    GenderSelectionScreen(),
    FocusAreaSelectionScreen(),
    ObjAreaSelectionScreen(),
    NivelAreaSelectionScreen(),

    // Adicione outras telas aqui de acordo com o fluxo de perguntas
  ];

  void _nextStep() {
    if (_currentStep < _steps.length - 1) {
      setState(() {
        _currentStep++;
      });
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavigationScreen()));
      // Implemente a lógica para finalizar o cadastro ou navegar para a próxima tela
      // Por exemplo, ao final das perguntas, pode ser que você deseje salvar as informações
      // ou navegar para a próxima tela do aplicativo.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(''),
      // ),
      body: _steps[_currentStep],
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0, // Remover a sombra
        color: Colors.transparent, // Defina a cor do BottomAppBar conforme necessário
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _nextStep,
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150, 50), // Define o tamanho mínimo do botão
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Borda circular
                  ),
                ),
                child: Text(
                  _currentStep == _steps.length - 1 ? 'Finalizar' : 'Próxima',
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}