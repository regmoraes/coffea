import 'package:coffea/bean/model/flavor.dart';
import 'package:coffea/bean/model/roast.dart';
import 'package:coffea/roaster/model/roaster.dart';
import 'package:isar/isar.dart';

part 'bean.g.dart';

@collection
class Bean {
  Id id = Isar.autoIncrement;

  late String name;

  final roaster = IsarLink<Roaster>();

  final roast = IsarLink<Roast>();

  final flavors = IsarLinks<Flavor>();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Bean && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
