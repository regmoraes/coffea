import 'package:coffea/application/repository.dart';
import 'package:coffea/method/method.dart';

class MethodRepository {
  Future<Set<Method>> findAll() async {
    return Set<Method>.from(coffeaData["methods"].map((name) => Method(name)));
  }
}
