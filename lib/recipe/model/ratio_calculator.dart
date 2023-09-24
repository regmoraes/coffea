const minRatio = 1 / 36; // 1:36
const maxRatio = 1 / 2; // 1:2

const minBeanQuantity = 0.75;
const maxBeanQuantity = 1000.0;

const minWaterQuantity = 15.0;
const maxWaterQuantity = 1000.0;

const defaultWaterQuantity = 100.0;
const defaultBeanQuantity = 10.0;

class RatioCalculator {
  double _waterQuantity = defaultWaterQuantity;
  double _beanQuantity = defaultBeanQuantity;
  late double _ratio;

  RatioCalculator() {
    _ratio = _beanQuantity / _waterQuantity;
  }

  set ratio(double ratio) {
    _ratio = ratio;
    _beanQuantity = _waterQuantity * _ratio;
  }

  set beanQuantity(double quantity) {
    _beanQuantity = quantity;

    if (ratio > maxRatio) {
      _waterQuantity = _beanQuantity / maxRatio;
    } else if (ratio < minRatio) {
      _waterQuantity = _beanQuantity / minRatio;
    } else {
      _ratio = ratio;
    }
  }

  set waterQuantity(double quantity) {
    _waterQuantity = quantity;

    if (ratio > maxRatio) {
      _beanQuantity = _waterQuantity * maxRatio;
    } else if (ratio < minRatio) {
      _beanQuantity = _waterQuantity * minRatio;
    } else {
      _ratio = ratio;
    }
  }

  double get beanQuantity => _beanQuantity;

  double get waterQuantity => _waterQuantity;

  double get ratio => _beanQuantity / _waterQuantity;

  @override
  String toString() {
    return 'RatioCalculator{_waterQuantity: $_waterQuantity, _beanQuantity: $_beanQuantity, _ratio: $_ratio}';
  }
}

extension RatioFormatter on double {
  String formattedAsRatio() {
    final beanQuantity = 1 / this;
    return '1:${beanQuantity.toStringAsFixed(0)}';
  }

  String formattedAsMl() => '${toStringAsFixed(1)}ml';

  String formattedAsGrams() => '${toStringAsFixed(1)}g';
}
