import 'dart:io';
import 'package:appfitness/DB/crate_user.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HiveConfig{
  static start() async{
    Directory directory = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(directory.path);
  }

  static Future<Box> _openBox() async{
    final recebeDocumento = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(recebeDocumento.path);
    return await Hive.openBox("CreateUser");
  }

  static Future<void> insertHistory(CreateUser createUser) async {
    final box = await _openBox();
    await box.add(CreateUser);
  }

  static Future<List<CreateUser>> viewHistory() async {
      try {
        final caixa = await _openBox();
        if (caixa.isEmpty) {
          return [];
        } else {
          List<CreateUser> listHistory = caixa.values.map((dynamic e) {
            if (e is CreateUser) {
              return e;
            } else {
              throw const FormatException('Valor inesperado no box');
            }
          }).toList();
          return listHistory;
        }
      } catch (e) {
        print("Erro ao mostrar conquista ");
        return [];
      }
    }
}