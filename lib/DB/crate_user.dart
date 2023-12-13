import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class CreateUser {
  @HiveField(0)
  final double peso;
  @HiveField(1)
  final double altura;
  
  CreateUser({
    required this.peso,
    required this.altura,
    
  });
}