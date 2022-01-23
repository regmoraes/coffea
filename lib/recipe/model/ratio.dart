class Ratio {
  double beanQuantity;
  double waterQuantity;

  Ratio({required this.beanQuantity, required this.waterQuantity});

  String get value => '1:${beanQuantity / waterQuantity}';
}
