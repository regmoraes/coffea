import 'package:coffea/bean/bean.dart';

class BeanRepository {
  final _beans = <Bean>{};

  Future<void> addBean(Bean bean) async {
    _beans.add(bean);
  }

  Future<Set<Bean>> getBeans() async {
    return _beans;
  }
}
