import 'package:coffea/bean/cubit.dart';
import 'package:coffea/bean/repository.dart';
import 'package:coffea/ui/beans_route.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
          Modular.initialRoute,
          child: (_, __) => const BeansRoute(),
        ),
      ];
}
