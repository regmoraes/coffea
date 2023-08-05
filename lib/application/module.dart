import 'package:coffea/application/ui/home_page.dart';
import 'package:coffea/bean/repository/local_repository.dart';
import 'package:coffea/bean/ui/add_bean_page.dart';
import 'package:coffea/bean/ui/beans_page.dart';
import 'package:coffea/bean/ui/flavors_page.dart';
import 'package:coffea/bean/use_case/add_bean.dart';
import 'package:coffea/bean/use_case/get_flavors.dart';
import 'package:coffea/bean/use_case/get_beans.dart';
import 'package:coffea/bean/use_case/get_roasts.dart';
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
  void binds(Injector i) {
    i.addInstance<Isar>(Isar.getInstance()!);
    i.addSingleton(BeanRepository.new);
    i.addSingleton(MethodRepository.new);
    i.addSingleton(RecipeRepository.new);
    i.addSingleton(RoasterRepository.new);
    i.addSingleton(AddBean.new);
    i.addSingleton(AddRecipe.new);
    i.addSingleton(AddRoaster.new);
    i.addSingleton(GetBeans.new);
    i.addSingleton(GetFlavors.new);
    i.addSingleton(GetMethods.new);
    i.addSingleton(GetRecipes.new);
    i.addSingleton(GetRoasts.new);
    i.addSingleton(GetRoasters.new);
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
    r.child('/add-recipe', child: (_) => const AddRecipePage());
    r.child('/add-roaster', child: (_) => const AddRoasterPage());
    r.child('/beans/recipes', child: (_) => RecipesPage(bean: r.args.data));
    r.child('/flavors', child: (_) => FlavorsPage(r.args.data));
    r.child('/recipes/detail', child: (_) => RecipePage(r.args.data));
    r.child('/recipes/make', child: (_) => MakeRecipePage(r.args.data));
    r.child('/recipes/steps', child: (_) => AddStepPage(recipeBuilder: r.args.data));
    r.child('/add-bean', child: (_) => const AddBeanPage());
    r.child('/add-recipe', child: (_) => const AddRecipePage());
    r.child('/add-roaster', child: (_) => const AddRoasterPage());
    r.child('/beans/recipes', child: (_) => RecipesPage(bean: r.args.data));
    r.child('/flavors', child: (_) => FlavorsPage(r.args.data));
    r.child('/recipes/detail', child: (_) => RecipePage(r.args.data));
    r.child('/recipes/make', child: (_) => MakeRecipePage(r.args.data));
    r.child('/recipes/steps', child: (_) => AddStepPage(recipeBuilder: r.args.data));
  }
}
