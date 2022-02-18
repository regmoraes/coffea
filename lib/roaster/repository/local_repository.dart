import 'package:coffea/roaster/roaster.dart';

final _roasters = {
  Roaster('Alfredo'),
  Roaster('João'),
  Roaster('Maria'),
};

class RoasterRepository {
  Future<Set<Roaster>> findAll() async {
    print('Getting Roasters: $_roasters');
    return _roasters;
  }

  addRoaster(Roaster roaster) {
    _roasters.add(roaster);
  }
}
