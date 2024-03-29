import 'package:coffea/recipe/model/method.dart';
import 'package:isar/isar.dart';

class MethodRepository {
  final Isar database;

  MethodRepository(this.database);

  Future<List<Method>> findAll() {
    return database.methods.where().findAll();
  }
}
