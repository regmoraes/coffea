import 'package:coffea/bean/flavor.dart';
import 'package:coffea/bean/roast.dart';
import 'package:coffea/roaster/roaster.dart';
import 'package:isar/isar.dart';

part 'bean.g.dart';

@collection
class Bean {
  Id id = Isar.autoIncrement;

  late String name;

  final roaster = IsarLink<Roaster>();

  final roast = IsarLink<Roast>();

  final flavors = IsarLinks<Flavor>();
}
