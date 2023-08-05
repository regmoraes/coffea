import 'package:coffea/roaster/roaster.dart';

final _roasters = {
  Roaster('Ovelha Negra'),
  Roaster('Net Cafés'),
};

class RoasterRepository {
  Future<Set<Roaster>> findAll() async {
    return _roasters;
  }

  addRoaster(Roaster roaster) {
    _roasters.add(roaster);
  }
}
