import 'package:flutter/material.dart';

class GenderSelectionScreen extends StatefulWidget {
  @override
  _GenderSelectionScreenState createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen> {
  String _selectedGender = ''; // Variável para armazenar o gênero selecionado

  void _selectGender(String gender) {
    setState(() {
      // Verifica se o mesmo botão foi pressionado duas vezes
      if (_selectedGender == gender) {
        _selectedGender = ''; // Deseleciona o botão se pressionado novamente
      } else {
        _selectedGender = gender; // Seleciona o botão se não estiver selecionado
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(
        //   '',
        //   style: TextStyle(
        //     color: Colors.black,
        //     fontSize: 20,
        //   ),
        // ),
        backgroundColor: Colors.transparent,
        elevation: 0, // Para remover a sombra
        iconTheme: IconThemeData(color: Colors.black), // Altera a cor do ícone de volta para preto
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              'Qual é o seu sexo?',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 40),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _selectGender('Masculino'); // Chama a função ao pressionar o botão
                  },
                  style: ElevatedButton.styleFrom(
                    primary: _selectedGender == 'Masculino'
                        ? Colors.blue // Cor do botão selecionado
                        : Colors.white, // Cor do botão não selecionado
                    onPrimary: Colors.black, // Cor do texto
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 5,
                    shadowColor: Colors.grey,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    child: Text(
                      'Masculino',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _selectGender('Feminino'); // Chama a função ao pressionar o botão
                  },
                  style: ElevatedButton.styleFrom(
                    primary: _selectedGender == 'Feminino'
                        ? Colors.blue // Cor do botão selecionado
                        : Colors.white, // Cor do botão não selecionado
                    onPrimary: Colors.black, // Cor do texto
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 5,
                    shadowColor: Colors.grey,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    child: Text(
                      'Feminino',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}