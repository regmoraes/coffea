import 'package:coffea/application/ui/home_page.dart';
import 'package:coffea/bean/repository/local_repository.dart';
import 'package:coffea/bean/ui/add_bean_page.dart';
import 'package:coffea/bean/ui/beans_page.dart';
import 'package:coffea/bean/ui/flavors_page.dart';
import 'package:coffea/bean/use_case/add_bean.dart';
import 'package:coffea/bean/use_case/find_beans.dart';
import 'package:coffea/bean/use_case/find_flavors.dart';
import 'package:coffea/bean/use_case/find_roasts.dart';
import 'package:coffea/experiment/ui/experiments_page.dart';
import 'package:coffea/method/repository/local_repository.dart';
import 'package:coffea/method/use_case/find_methods.dart';
import 'package:coffea/recipe/repository/local_repository.dart';
import 'package:coffea/recipe/ui/add_recipe_page.dart';
import 'package:coffea/recipe/ui/add_step_page.dart';
import 'package:coffea/recipe/ui/recipe_execution_page.dart';
import 'package:coffea/recipe/ui/recipe_page.dart';
import 'package:coffea/recipe/ui/recipes_page.dart';
import 'package:coffea/recipe/use_case/add_recipe.dart';
import 'package:coffea/recipe/use_case/find_grind_sizes.dart';
import 'package:coffea/recipe/use_case/find_recipes.dart';
import 'package:coffea/roaster/repository/local_repository.dart';
import 'package:coffea/roaster/ui/add_roaster_page.dart';
import 'package:coffea/roaster/ui/roasters_page.dart';
import 'package:coffea/roaster/use_case/add_roaster.dart';
import 'package:coffea/roaster/use_case/find_roasters.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoffeaModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => BeanRepository()),
        Bind.singleton((i) => MethodRepository()),
        Bind.singleton((i) => RecipeRepository()),
        Bind.singleton((i) => RoasterRepository()),
        Bind.singleton((i) => AddBean(i.get())),
        Bind.singleton((i) => AddRecipe(i.get())),
        Bind.singleton((i) => AddRoaster(i.get())),
        Bind.singleton((i) => FindBeans(i.get())),
        Bind.singleton((i) => FindFlavors(i.get())),
        Bind.singleton((i) => FindGrindSizes(i.get())),
        Bind.singleton((i) => FindMethods(i.get())),
        Bind.singleton((i) => FindRecipes(i.get())),
        Bind.singleton((i) => FindRoasts(i.get())),
        Bind.singleton((i) => FindRoasters(i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const HomePage(),
          children: [
            ChildRoute('/beans', child: (_, __) => const BeansPage()),
            ChildRoute(
              '/experiments',
              child: (_, __) => const ExperimentsPage(),
            ),
            ChildRoute('/recipes', child: (_, __) => RecipesPage()),
            ChildRoute('/roasters', child: (_, __) => const RoastersPage()),
          ],
        ),
        ChildRoute('/add-bean', child: (_, __) => const AddBeanPage()),
        ChildRoute('/add-recipe', child: (_, __) => const AddRecipePage()),
        ChildRoute('/add-roaster', child: (_, __) => const AddRoasterPage()),
        ChildRoute(
          '/beans/recipes',
          child: (_, args) => RecipesPage(bean: args.data),
        ),
        ChildRoute('/flavors', child: (_, args) => FlavorsPage(args.data)),
        ChildRoute(
          '/recipes/detail',
          child: (_, recipe) => RecipePage(recipe.data),
        ),
        ChildRoute(
          '/recipes/execution',
          child: (_, recipe) => RecipeExecutionPage(recipe.data),
        ),
        ChildRoute(
          '/recipes/steps',
          child: (_, recipe) => const AddStepPage(),
        ),
      ];
}
