import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  final String name;
  final String carga;
  final int id;
  final int tipo;

  Task({
    required this.name,
    required this.carga,
    required this.id,
    required this.tipo,
  });

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0), // Adicionando margens de 8.0 em todos os lados
      decoration: BoxDecoration(
        color: isChecked ? Colors.grey[300] : Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  widget.carga,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              isChecked ? Icons.check_circle : Icons.radio_button_unchecked,
              color: Colors.blue,
            ),
            onPressed: () {
              setState(() {
                isChecked = !isChecked;
              });
            },
          ),
        ],
      ),
    );
  }
}
