import 'package:isar/isar.dart';

part 'flavor.g.dart';

@collection
class Flavor {
  Id id = Isar.autoIncrement;

  late String name;

  late String color;

  final flavors = IsarLinks<Flavor>();

  int get colorHex => int.parse(color, radix: 16);
}
