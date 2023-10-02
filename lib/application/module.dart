import 'package:coffea/application/ui/home_page.dart';
import 'package:coffea/bean/repository/local_repository.dart';
import 'package:coffea/bean/ui/add_bean_page.dart';
import 'package:coffea/bean/ui/beans_page.dart';
import 'package:coffea/bean/ui/flavors_page.dart';
import 'package:coffea/bean/use_case/add_bean.dart';
import 'package:coffea/bean/use_case/find_flavors.dart';
import 'package:coffea/bean/use_case/find_grind_sizes.dart';
import 'package:coffea/bean/use_case/find_roasts.dart';
import 'package:coffea/recipe/repository/method_repository.dart';
import 'package:coffea/recipe/repository/recipe_repository.dart';
import 'package:coffea/recipe/ui/add_step_page.dart';
import 'package:coffea/recipe/ui/make_recipe_page.dart';
import 'package:coffea/recipe/ui/new_recipe_page.dart';
import 'package:coffea/recipe/ui/recipe_page.dart';
import 'package:coffea/recipe/ui/recipes_page.dart';
import 'package:coffea/recipe/use_case/create_recipe.dart';
import 'package:coffea/recipe/use_case/find_methods.dart';
import 'package:coffea/recipe/use_case/find_recipes.dart';
import 'package:coffea/recipe/use_case/make_recipe.dart';
import 'package:coffea/roaster/repository/local_repository.dart';
import 'package:coffea/roaster/ui/add_roaster_page.dart';
import 'package:coffea/roaster/ui/roasters_page.dart';
import 'package:coffea/roaster/use_case/add_roaster.dart';
import 'package:coffea/roaster/use_case/find_roasters.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:isar/isar.dart';

import '../bean/use_case/find_beans.dart';

class CoffeaModule extends Module {
  @override
  void binds(Injector i) {
    i.addInstance<Isar>(Isar.getInstance()!);
    i.addSingleton(BeanRepository.new);
    i.addSingleton(MethodRepository.new);
    i.addSingleton(RecipeRepository.new);
    i.addSingleton(RoasterRepository.new);
    i.addSingleton(AddBean.new);
    i.addSingleton(CreateRecipe.new);
    i.addSingleton(AddRoaster.new);
    i.addSingleton(FindBeans.new);
    i.addSingleton(FindFlavors.new);
    i.addSingleton(FindGrindSizes.new);
    i.addSingleton(FindMethods.new);
    i.addSingleton(FindRecipes.new);
    i.addSingleton(FindRoasts.new);
    i.addSingleton(FindRoasters.new);
    i.add(MakeRecipe.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => const HomePage(),
      children: [
        ChildRoute('/beans', child: (_) => const BeansPage()),
        ChildRoute('/recipes', child: (_) => RecipesPage()),
        ChildRoute('/roasters', child: (_) => const RoastersPage()),
      ],
    );
    r.child('/add-bean', child: (_) => const AddBeanPage());
    r.child('/add-recipe', child: (_) => const NewRecipePage());
    r.child('/add-roaster', child: (_) => const AddRoasterPage());
    r.child('/beans/recipes', child: (_) => RecipesPage(bean: r.args.data));
    r.child('/flavors', child: (_) => FlavorsPage(r.args.data));
    r.child('/recipes/detail', child: (_) => RecipePage(r.args.data));
    r.child('/recipes/make', child: (_) => MakeRecipePage(r.args.data));
    r.child('/recipes/steps', child: (_) => AddStepPage(recipeBuilder: r.args.data));
    r.child('/add-bean', child: (_) => const AddBeanPage());
    r.child('/add-recipe', child: (_) => const NewRecipePage());
    r.child('/add-roaster', child: (_) => const AddRoasterPage());
    r.child('/beans/recipes', child: (_) => RecipesPage(bean: r.args.data));
    r.child('/flavors', child: (_) => FlavorsPage(r.args.data));
    r.child('/recipes/detail', child: (_) => RecipePage(r.args.data));
    r.child('/recipes/make', child: (_) => MakeRecipePage(r.args.data));
    r.child('/recipes/steps', child: (_) => AddStepPage(recipeBuilder: r.args.data));
  }
}
