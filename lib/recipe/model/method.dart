import 'package:isar/isar.dart';

part 'method.g.dart';

@collection
class Method {
  Id id = Isar.autoIncrement;

  late String name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Method && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
