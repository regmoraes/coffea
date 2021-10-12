import 'package:coffea/bean/cubit.dart';
import 'package:coffea/bean/repository.dart';
import 'package:coffea/ui/add_bean_route.dart';
import 'package:coffea/ui/beans_route.dart';
import 'package:flutter_modular/flutter_modular.dart';

const beansRouteName = '/beans';
const addBeanRouteName = '/add-bean';

class BeanModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => BeanRepository()),
        Bind.singleton((i) => BeanCubit(i.get()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          beansRouteName,
          child: (_, __) => const BeansRoute(),
        ),
        ChildRoute(
          addBeanRouteName,
          child: (context, args) => const AddBeanRoute(),
        ),
      ];
}
