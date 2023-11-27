import 'package:flutter/material.dart';

class AppSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações do Aplicativo'),
      ),
      body: Center(
        child: Text(
          'Página de Configuração do Aplicativo',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
