// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:appfitness/Data/DB.dart';

// class WeightReport extends StatefulWidget {
//   @override
//   _WeightReportState createState() => _WeightReportState();
// }

// class _WeightReportState extends State<WeightReport> {
//   late Box<WeightModel> weightBox;
//   double currentWeight = 0.0;

//   @override
//   void initState() {
//     super.initState();
//     _openBox();
//   }

//   Future<void> _openBox() async {
//     weightBox = await Hive.openBox<WeightModel>('weightBox');
//     _updateCurrentWeight();
//   }

//   void _updateCurrentWeight() {
//     if (weightBox.isNotEmpty) {
//       setState(() {
//         currentWeight = weightBox.getAt(weightBox.length - 1)!.weight;
//       });
//     }
//   }

//   Future<void> _addWeight(double newWeight) async {
//     await weightBox.add(WeightModel(newWeight));
//     _updateCurrentWeight();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Relatório'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Peso atual: $currentWeight kg',
//               style: TextStyle(fontSize: 20.0),
//             ),
//             SizedBox(height: 20.0),
//             ElevatedButton(
//               onPressed: () {
//                 _showInputDialog(context);
//               },
//               child: Text('Inserir novo peso'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _showInputDialog(BuildContext context) {
//     TextEditingController weightController = TextEditingController();

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Inserir novo peso'),
//           content: TextField(
//             controller: weightController,
//             keyboardType: TextInputType.number,
//             decoration: InputDecoration(labelText: 'Peso (kg)'),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context); // Fecha o pop-up
//               },
//               child: Text('Cancelar'),
//             ),
//             TextButton(
//               onPressed: () {
//                 double newWeight = double.parse(weightController.text);
//                 _addWeight(newWeight);
//                 Navigator.pop(context); // Fecha o pop-up
//               },
//               child: Text('Salvar'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
