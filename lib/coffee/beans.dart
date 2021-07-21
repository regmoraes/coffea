import 'package:coffea/coffee/flavor.dart';
import 'package:coffea/coffee/roast.dart';

class Bean {
  final String brand;
  final String name;
  final Roast roast;
  final List<Flavor> flavors;

  Bean(this.brand, this.name, this.roast, this.flavors);
}


