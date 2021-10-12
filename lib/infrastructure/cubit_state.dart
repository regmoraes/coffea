import 'package:coffea/bean/flavor.dart';
import 'package:coffea/bean/roast.dart';

abstract class CoffeaState {}

class InitialState extends CoffeaState {}

class RoastsState extends CoffeaState {
  final List<Roast> roasts;

  RoastsState(this.roasts);
}

class FlavorsState extends CoffeaState {
  final List<Flavor> flavors;

  FlavorsState(this.flavors);
}
