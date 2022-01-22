class Size {
  final String size;

  Size(this.size);

  factory Size.fromJson(dynamic value) => Size(value as String);
}
