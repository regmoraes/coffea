import 'package:isar/isar.dart';

part 'producer.g.dart';

@collection
class Producer {
  Id? id = Isar.autoIncrement;

  String name;

  Producer(this.name);
}
