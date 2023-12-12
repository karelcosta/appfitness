import 'package:flutter/material.dart';

class FocusAreaButton extends StatelessWidget {
  final String areaName;
  final String selectedArea;
  final Function(String) onSelect;

  const FocusAreaButton({
    required this.areaName,
    required this.selectedArea,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onSelect(areaName);
      },
      style: ElevatedButton.styleFrom(
        primary: selectedArea == areaName ? Colors.blue : Colors.white,
        onPrimary: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
        shadowColor: Colors.grey,
        minimumSize: Size(200, 50),
      ),
      child: Text(areaName),
    );
  }
}

class NivelAreaSelectionScreen extends StatefulWidget {
  @override
  _NVAreaSelectionScreenState createState() =>
      _NVAreaSelectionScreenState();
}

class _NVAreaSelectionScreenState extends State<NivelAreaSelectionScreen> {
  String _selectedFocusArea = '';

  void _selectFocusArea(String focusArea) {
    setState(() {
      if (_selectedFocusArea == focusArea) {
        _selectedFocusArea = '';
      } else {
        _selectedFocusArea = focusArea;
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(
              'Qual é seu nivel de atividade física?',
              textAlign: TextAlign.center,
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
              children: [
                FocusAreaButton(
                  areaName: 'Sedentário',
                  selectedArea: _selectedFocusArea,
                  onSelect: _selectFocusArea,
                ),
                SizedBox(height: 20),
                FocusAreaButton(
                  areaName: 'Levemente ativo',
                  selectedArea: _selectedFocusArea,
                  onSelect: _selectFocusArea,
                ),
                SizedBox(height: 20),
                FocusAreaButton(
                  areaName: 'Moderadamente ativo',
                  selectedArea: _selectedFocusArea,
                  onSelect: _selectFocusArea,
                ),SizedBox(height: 20),
                FocusAreaButton(
                  areaName: 'Muito ativo',
                  selectedArea: _selectedFocusArea,
                  onSelect: _selectFocusArea,
                ),
                
                // Adicione mais botões aqui seguindo o mesmo padrão
              ],
            ),
          ),
        ],
      ),
    );
  }
}
