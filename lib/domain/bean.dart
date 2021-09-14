import 'package:coffea/domain/flavor.dart';
import 'package:coffea/domain/roast.dart';

class Bean {
  final String name;
  final String? brand;
  final Roast? roast;
  final List<Flavor>? flavors;

  Bean(this.name, {this.brand, this.roast, this.flavors});
}
