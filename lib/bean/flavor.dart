class Flavor {
  String name;
  List<Flavor>? flavors;

  Flavor(this.name, this.flavors);

  @override
  String toString() => 'Flavor{name: $name, flavors: $flavors}';

  factory Flavor.fromJson(Map<String, dynamic> json) {
    final name = json['flavor'];
    final flavors = json['children'];

    if (flavors == null) {
      return Flavor(name, flavors);
    } else {
      return Flavor(
        name,
        List<Flavor>.from(flavors.map((child) => Flavor.fromJson(child))),
      );
    }
  }
}
