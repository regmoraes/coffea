import 'package:coffea/application/ui/home_page.dart';
import 'package:coffea/bean/repository/local_repository.dart';
import 'package:coffea/bean/ui/add_bean_page.dart';
import 'package:coffea/bean/ui/beans_page.dart';
import 'package:coffea/bean/ui/flavors_page.dart';
import 'package:coffea/bean/use_case/add_bean.dart';
import 'package:coffea/bean/use_case/get_beans.dart';
import 'package:coffea/bean/use_case/get_flavors.dart';
import 'package:coffea/bean/use_case/get_roasts.dart';
import 'package:coffea/experiment/ui/experiments_page.dart';
import 'package:coffea/method/repository/local_repository.dart';
import 'package:coffea/method/use_case/find_methods.dart';
import 'package:coffea/recipe/repository/local_repository.dart';
import 'package:coffea/recipe/ui/add_recipe_page.dart';
import 'package:coffea/recipe/ui/add_step_page.dart';
import 'package:coffea/recipe/ui/make_recipe_page.dart';
import 'package:coffea/recipe/ui/recipe_page.dart';
import 'package:coffea/recipe/ui/recipes_page.dart';
import 'package:coffea/recipe/use_case/add_recipe.dart';
import 'package:coffea/recipe/use_case/find_recipes.dart';
import 'package:coffea/recipe/use_case/make_recipe.dart';
import 'package:coffea/roaster/repository/local_repository.dart';
import 'package:coffea/roaster/ui/add_roaster_page.dart';
import 'package:coffea/roaster/ui/roasters_page.dart';
import 'package:coffea/roaster/use_case/add_roaster.dart';
import 'package:coffea/roaster/use_case/find_roasters.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:isar/isar.dart';

class CoffeaModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.instance((i) => Isar.getInstance()),
        Bind.singleton((i) => BeanRepository(i.get())),
        Bind.singleton((i) => MethodRepository(i.get())),
        Bind.singleton((i) => RecipeRepository(i.get())),
        Bind.singleton((i) => RoasterRepository(i.get())),
        Bind.singleton((i) => AddBean(i.get())),
        Bind.singleton((i) => AddRecipe(i.get())),
        Bind.singleton((i) => AddRoaster(i.get())),
        Bind.singleton((i) => GetBeans(i.get())),
        Bind.singleton((i) => GetFlavors(i.get())),
        // Bind.singleton((i) => FindGrindSizes(i.get())),
        Bind.singleton((i) => GetMethods(i.get())),
        Bind.singleton((i) => GetRecipes(i.get())),
        Bind.singleton((i) => FindRoasts(i.get())),
        Bind.singleton((i) => GetRoasters(i.get())),
        Bind.factory((i) => MakeRecipe()),
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
          '/recipes/make',
          child: (_, recipe) => MakeRecipePage(recipe.data),
        ),
        ChildRoute(
          '/recipes/steps',
          child: (_, args) => AddStepPage(recipeBuilder: args.data),
        ),
      ];
}
