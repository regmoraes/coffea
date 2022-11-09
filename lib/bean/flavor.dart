import 'package:isar/isar.dart';

part 'flavor.g.dart';

@collection
class Flavor {
  Id id = Isar.autoIncrement;

  late String name;

  late int color;

  final flavors = IsarLinks<Flavor>();
}
