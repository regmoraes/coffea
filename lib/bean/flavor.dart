import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Flavor extends Equatable {
  final String name;
  final Color color;
  final List<Flavor>? flavors;

  const Flavor(this.name, this.color, this.flavors);

  @override
  String toString() => 'Flavor{name: $name, color: $color, flavors: $flavors}';

  factory Flavor.fromJson(Map<String, dynamic> json) {
    final name = json['flavor'];
    final color = Color(int.parse(json['color']));
    final flavors = json['flavors'];

    return Flavor(
      name,
      color,
      flavors?.map<Flavor>((child) => Flavor.fromJson(child)).toList(),
    );
  }

  @override
  List<Object?> get props => [name, color, flavors];
}
