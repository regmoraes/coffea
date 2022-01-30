const minRatio = 1;
const maxRatio = 36;

const minBeanQuantity = 0.75;
const maxBeanQuantity = 1000.0;

const minWaterQuantity = 15.0;
const maxWaterQuantity = 1000.0;

const defaultWaterQuantity = 100.0;
const defaultBeanQuantity = 10.0;

class BeanWaterRatio {
  double _waterQuantity = defaultWaterQuantity;
  double _beanQuantity = defaultBeanQuantity;
  late double _ratio;

  BeanWaterRatio() {
    _ratio = _waterQuantity / _beanQuantity;
  }

  set ratio(double quantity) {
    _ratio = quantity;
    _beanQuantity = (_waterQuantity / _ratio);
  }

  set beanQuantity(double quantity) {
    _beanQuantity = quantity;

    if (ratio > maxRatio) {
      _waterQuantity = _beanQuantity * maxRatio;
    } else if (ratio < minRatio) {
      _waterQuantity = _beanQuantity * minRatio;
    } else {
      _ratio = ratio;
    }
  }

  set waterQuantity(double quantity) {
    _waterQuantity = quantity;

    if (ratio > maxRatio) {
      _beanQuantity = _waterQuantity / maxRatio;
    } else if (ratio < minRatio) {
      _beanQuantity = _waterQuantity / minRatio;
    } else {
      _ratio = ratio;
    }
  }

  double get beanQuantity => _beanQuantity;

  double get waterQuantity => _waterQuantity;

  double get ratio => _waterQuantity / _beanQuantity;

  String get ratioFormatted => '1:${_ratio.toStringAsFixed(1)}';

  @override
  String toString() {
    return 'BeanWaterRatio{_waterQuantity: $_waterQuantity, _beanQuantity: $_beanQuantity, _beanWaterRatio: $_ratio}';
  }
}
