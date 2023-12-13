import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:appfitness/Data/DB.dart';
import 'package:appfitness/components/barra_de_navegação.dart';
import 'package:appfitness/DB/hive_config.dart';
import 'package:appfitness/DB/crate_user.dart';
import 'package:appfitness/DB/hive_adapter.dart';

class CadastroScreen extends StatefulWidget {
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final TextEditingController pesoControler = TextEditingController();
  final TextEditingController alturaControler = TextEditingController();
  
  String? sexo;
  double? peso;
  double? altura;
  int cardAtual = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Card(
          elevation: 5.0,
          margin: EdgeInsets.all(20.0),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: _buildCardContent(),
          ),
        ),
      ),
    );
  }

  Widget _buildCardContent() {
    if (cardAtual == 1) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Qual é o seu sexo?'),
          ElevatedButton(
            onPressed: () {
              setState(() {
                sexo = 'Feminino';
                cardAtual++;
              });
            },
            child: Text('Feminino'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                sexo = 'Masculino';
                cardAtual++;
              });
            },
            child: Text('Masculino'),
          ),
        ],
      );
    } else if (cardAtual == 2) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Qual é o seu peso?'),
          TextFormField(
            controller: pesoControler,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              peso = double.parse(value);
            },
          ),
          Text('Qual é a sua altura?'),
          TextFormField(
            controller: alturaControler,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              altura = double.parse(value);
            },
          ),
          ElevatedButton(
            onPressed: () async {
              double peso = double.parse(pesoControler.text);
              double altura = double.parse(alturaControler.text);

              if (peso != null && altura != null)
              {
                CreateUser createUser = CreateUser(
                  peso: peso,
                  altura: altura,
                );

                await HiveConfig.insertHistory(createUser);
                _irParaProximaTela();

              }else{
                  
              }
            },
            child: Text('Finalizar Tarefa'),
          ),
        ],
      );
    }
    return SizedBox(); // Card vazio se a etapa de cadastro terminar
  }

  // void _salvarDados() async {
  //   Map<String, dynamic> cadastro = {
  //     'sexo': sexo,
  //     'peso': peso,
  //     'altura': altura,
  //   };
  //   // await dbHelper.insertCadastro(cadastro);
  //   // Mostrar card de carregamento
  //   _mostrarCardCarregando();
  // }

  void _mostrarCardCarregando() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Processando'),
          content: Text('Os dados estão sendo salvos no banco de dados...'),
          actions: <Widget>[
            ElevatedButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                // Navegar para a próxima tela após salvar os dados
                _irParaProximaTela();
              },
            ),
          ],
        );
      },
    );
  }

  void _irParaProximaTela() {
    // Aqui você pode navegar para a próxima tela
    // Por exemplo:
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NavigationScreen()),
    );
  }
}
