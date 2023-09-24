import 'package:isar/isar.dart';

part 'method.g.dart';

@collection
class Method {
  Id id = Isar.autoIncrement;

  late String name;
}
