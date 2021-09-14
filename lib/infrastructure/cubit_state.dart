import 'package:coffea/domain/bean.dart';
import 'package:coffea/domain/flavor.dart';
import 'package:coffea/domain/roast.dart';

abstract class CoffeaState {}

class InitialState extends CoffeaState {}

class BeansState extends CoffeaState {
  final Set<Bean> beans;
  final Bean? addedBean;
  final Bean? removedBean;

  BeansState(this.beans, {this.addedBean, this.removedBean});
}

class RoastsState extends CoffeaState {
  final List<Roast> roasts;

  RoastsState(this.roasts);
}

class FlavorsState extends CoffeaState {
  final List<Flavor> flavors;

  FlavorsState(this.flavors);
}
