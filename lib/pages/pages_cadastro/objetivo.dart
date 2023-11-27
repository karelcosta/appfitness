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

class ObjAreaSelectionScreen extends StatefulWidget {
  @override
  _objAreaSelectionScreenState createState() =>
      _objAreaSelectionScreenState();
}

class _objAreaSelectionScreenState extends State<ObjAreaSelectionScreen> {
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
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              'Quais são seus principais objetivos?',
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
                  areaName: 'Perder Peso',
                  selectedArea: _selectedFocusArea,
                  onSelect: _selectFocusArea,
                ),
                SizedBox(height: 20),
                FocusAreaButton(
                  areaName: 'Aumentar musculos',
                  selectedArea: _selectedFocusArea,
                  onSelect: _selectFocusArea,
                ),
                SizedBox(height: 20),
                FocusAreaButton(
                  areaName: 'Definir',
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
