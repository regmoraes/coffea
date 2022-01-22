import 'package:coffea/bean/repository.dart';
import 'package:coffea/bean/ui/add_bean_page.dart';
import 'package:coffea/bean/ui/beans_page.dart';
import 'package:coffea/bean/use_case/add_bean.dart';
import 'package:coffea/bean/use_case/find_beans.dart';
import 'package:coffea/bean/use_case/find_flavors.dart';
import 'package:coffea/bean/use_case/find_roasts.dart';
import 'package:coffea/ui/experiments_page.dart';
import 'package:coffea/ui/flavors_page.dart';
import 'package:coffea/ui/home_page.dart';
import 'package:coffea/ui/recipes_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoffeaModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => BeanRepository()),
        Bind.singleton((i) => FindBeans(i.get())),
        Bind.singleton((i) => FindRoasts(i.get())),
        Bind.singleton((i) => FindFlavors(i.get())),
        Bind.singleton((i) => AddBean(i.get()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const HomeRoute(),
          children: [
            ChildRoute('/beans', child: (_, __) => const BeansPage()),
            ChildRoute('/recipes', child: (_, __) => const RecipesPage()),
            ChildRoute(
              '/experiments',
              child: (_, __) => const ExperimentsRoute(),
            ),
          ],
        ),
        ChildRoute('/add-bean', child: (_, __) => const AddBeanPage()),
        ChildRoute('/flavors', child: (_, args) => FlavorsPage(args.data)),
      ];
}
