import 'package:flutter/material.dart';
import 'package:appfitness/Data/ClassTask.dart';

class task extends StatelessWidget {
  final String name;
  final String carga;
  final int id;
  final int tipo;

  task({
    required this.name,
    required this.carga,
    required this.id,
    required this.tipo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Expanded(
          //   child: Container(
          //     // Adicione sua imagem aqui
          //     // Exemplo: child: Image.asset('caminho_da_sua_imagem'),
          //     child:  Image.asset('assets/images/01.png'), // definir as imagens usadas 
          //   ),
          // ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  carga,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
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
