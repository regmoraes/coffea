import 'package:coffea/bean/flavor.dart';
import 'package:coffea/bean/roast.dart';
import 'package:coffea/roaster/roaster.dart';

class Bean {
  final String name;
  final Roaster? roaster;
  final Roast? roast;
  final List<Flavor>? flavors;

  Bean(this.name, {this.roaster, this.roast, this.flavors});
}
