import 'package:coffea/bean/model/bean.dart';
import 'package:isar/isar.dart';

part 'roaster.g.dart';

@collection
class Roaster {
  Id id = Isar.autoIncrement;

  late String name;

  @Backlink(to: 'roaster')
  final beans = IsarLinks<Bean>();
}
