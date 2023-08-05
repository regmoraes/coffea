import 'package:isar/isar.dart';

part 'roast.g.dart';

@collection
class Roast {
  Id id = Isar.autoIncrement;

  late String type;
}
