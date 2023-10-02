import 'package:isar/isar.dart';

part 'grind_size.g.dart';

@collection
class GrindSize {
  Id id = Isar.autoIncrement;

  late String name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is GrindSize && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
