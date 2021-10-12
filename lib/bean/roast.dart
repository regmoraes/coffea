import 'package:equatable/equatable.dart';

class Roast extends Equatable {
  final String type;

  const Roast(this.type);

  @override
  String toString() => 'Roast{type: $type}';

  factory Roast.fromJson(dynamic value) => Roast(value as String);

  @override
  List<Object?> get props => [type];
}
