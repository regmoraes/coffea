import 'package:coffea/application/repository.dart';
import 'package:coffea/bean/bean.dart';
import 'package:coffea/bean/flavor.dart';
import 'package:coffea/bean/roast.dart';

class BeanRepository {
  final _beans = <Bean>{};

  BeanRepository() {
    loadCoffeaData();
  }

  Future<void> addBean(Bean bean) async {
    _beans.add(bean);
  }

  Future<Set<Bean>> getBeans() async {
    return _beans;
  }

  Future<Set<Flavor>> getFlavors() async {
    return Set<Flavor>.from(
      coffeaData["flavors"].map((flavorJson) => Flavor.fromJson(flavorJson)),
    );
  }

  Future<Set<Roast>> getRoasts() async {
    return Set<Roast>.from(
      coffeaData["roasts"].map((roast) => Roast.fromJson(roast)),
    );
  }
}
