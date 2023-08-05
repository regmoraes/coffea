import 'package:coffea/roaster/model/roaster.dart';
import 'package:isar/isar.dart';

class RoasterRepository {
  final Isar database;

  RoasterRepository(this.database);

  Future<List<Roaster>> findAll() {
    return database.roasters.where().findAll();
  }

  Future<int> addRoaster(Roaster roaster) {
      return database.writeTxn(() => database.roasters.put(roaster));
  }
}
