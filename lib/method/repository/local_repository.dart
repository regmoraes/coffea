import 'package:coffea/method/model/method.dart';
import 'package:isar/isar.dart';

class MethodRepository {
  final Isar database;

  MethodRepository(this.database);

  Future<List<Method>> getAll() {
    return database.methods.where().findAll();
  }
}
