import 'package:coffea/recipe/model/recipe.dart';

// class Ratio {
//   double value = 10.0;
//
//   String get formattedValue => '1:$value';
// }
//
class Ratio {
  double _waterQuantity = defaultWaterQuantity;
  double _beanQuantity = defaultBeanQuantity;
  late double _value;

  Ratio() {
    _value = _waterQuantity / _beanQuantity;
  }

  set value(double quantity) {
    _value = quantity;
    _beanQuantity = (_waterQuantity / _value).roundToDouble();
    print(this);
  }

  set beanQuantity(double quantity) {
    _beanQuantity = quantity;
    _value = _waterQuantity / _beanQuantity;
    print(this);
  }

  set waterQuantity(double quantity) {
    _waterQuantity = quantity;
    _beanQuantity = _waterQuantity / _value;
    print(this);
  }

  double get beanQuantity => _beanQuantity;

  double get waterQuantity => _waterQuantity;

  double get value => _waterQuantity / _beanQuantity;

  String get formattedValue => '1:${_value.toStringAsFixed(1)}';

  @override
  String toString() {
    return 'Ratio{_waterQuantity: $_waterQuantity, _beanQuantity: $_beanQuantity, _value: $_value}';
  }
}
