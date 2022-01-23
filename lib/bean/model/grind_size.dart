class GrindSize {
  final String size;

  GrindSize(this.size);

  factory GrindSize.fromJson(dynamic value) => GrindSize(value as String);
}
