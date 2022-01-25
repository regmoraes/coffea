const minRatio = 1;
const maxRatio = 20;

const minBeanQuantity = 0.75;
const maxBeanQuantity = 1000.0;

const minWaterQuantity = 15.0;
const maxWaterQuantity = 1000.0;

const defaultWaterQuantity = 100.0;
const defaultBeanQuantity = 10.0;

class BeanWaterRatio {
  double _waterQuantity = defaultWaterQuantity;
  double _beanQuantity = defaultBeanQuantity;
  late double _value;

  BeanWaterRatio() {
    _value = _waterQuantity / _beanQuantity;
  }

  set ratio(double quantity) {
    _value = quantity;
    _beanQuantity = (_waterQuantity / _value);
  }

  set beanQuantity(double quantity) {
    _beanQuantity = quantity;

    if (ratio > maxRatio) {
      _waterQuantity = _beanQuantity * maxRatio;
    } else if (ratio < minRatio) {
      _waterQuantity = _beanQuantity * minRatio;
    } else {
      _value = ratio;
    }
  }

  set waterQuantity(double quantity) {
    _waterQuantity = quantity;

    if (ratio > maxRatio) {
      _beanQuantity = _waterQuantity / maxRatio;
    } else if (ratio < minRatio) {
      _beanQuantity = _waterQuantity / minRatio;
    } else {
      _value = ratio;
    }
  }

  double get beanQuantity => _beanQuantity;

  double get waterQuantity => _waterQuantity;

  double get ratio => _waterQuantity / _beanQuantity;

  String get formattedValue => '1:${_value.toStringAsFixed(1)}';

  @override
  String toString() {
    return 'Ratio{_waterQuantity: $_waterQuantity, _beanQuantity: $_beanQuantity, _value: $_value}';
  }
}
