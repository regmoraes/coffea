class Method {
  final String name;

  Method(this.name);

  factory Method.fromJson(dynamic value) => Method(value as String);
}
