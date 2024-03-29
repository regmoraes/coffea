import 'package:coffea/bean/model/bean.dart';
import 'package:coffea/bean/model/flavor.dart';
import 'package:coffea/bean/model/grind_size.dart';
import 'package:coffea/bean/model/roast.dart';
import 'package:isar/isar.dart';

class BeanRepository {
  final Isar database;

  BeanRepository(this.database);

  Future<int> save(Bean bean) async {
    return database.writeTxn(() => database.beans.put(bean));
  }

  Future<List<Bean>> findBeans() {
    return database.beans.where().findAll();
  }

  Future<List<Flavor>> findFlavors() {
    return database.flavors.where().findAll();
  }

  Future<List<GrindSize>> findGrindSizes() {
    return database.grindSizes.where().findAll();
  }

  Future<List<Roast>> findRoasts() {
    return database.roasts.where().findAll();
  }
}
