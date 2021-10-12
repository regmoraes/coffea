import 'package:coffea/bean/module.dart';
import 'package:coffea/ui/experiments_route.dart';
import 'package:coffea/ui/home_route.dart';
import 'package:coffea/ui/recipe_route.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoffeaModule extends Module {
  @override
  List<Bind> get binds => [...BeanModule().binds];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => HomeRoute(),
          children: [
            ModuleRoute(
              '/beans',
              module: BeanModule(),
            ),
            ChildRoute(
              '/recipes',
              child: (_, __) => const RecipesRoute(),
            ),
            ChildRoute(
              '/experiments',
              child: (_, __) => const ExperimentsRoute(),
            ),
          ],
        ),
      ];
}
