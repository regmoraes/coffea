import 'package:coffea/roaster/roaster.dart';
import 'package:isar/isar.dart';

class RoasterRepository {
  final Isar database;

  RoasterRepository(this.database);

  Future<List<Roaster>> findAll() {
    return database.roasters.where().findAll();
  }

  Future<int> addRoaster(Roaster roaster) {
      return database.roasters.put(roaster);
  }
}
