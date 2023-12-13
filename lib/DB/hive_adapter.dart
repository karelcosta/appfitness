import 'package:hive/hive.dart';
import 'package:appfitness/DB/crate_user.dart';

class HiveAdapter extends TypeAdapter<CreateUser> {
  @override
  final int typeId = 0;

  @override
  CreateUser read(BinaryReader reader) {
    final peso = reader.readDouble();
    final altura = reader.readDouble();

    return CreateUser(
      peso: peso,
      altura: altura,
    );
  }

  @override
  void write(BinaryWriter writer, CreateUser obj) {
    writer.writeDouble(obj.peso);
    writer.writeDouble(obj.altura);
  }
}