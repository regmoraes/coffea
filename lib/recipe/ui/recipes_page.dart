import 'package:coffea/bean/model/bean.dart';
import 'package:coffea/recipe/model/ratio_calculator.dart';
import 'package:coffea/recipe/use_case/find_recipes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RecipesPage extends StatelessWidget {
  final findRecipes = Modular.get<GetRecipes>();
  final Bean? bean;

  RecipesPage({Key? key, this.bean}) : super(key: key) {
    if (bean == null) {
      findRecipes.getAll();
    } else {
      findRecipes.findAllByBean(bean!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetRecipes, FindRecipesState>(
        bloc: findRecipes,
        builder: (context, state) {
          if (state is RecipesFound) {
            return ListView.builder(
              itemCount: state.recipes.length,
              itemBuilder: (context, index) {
                final recipe = state.recipes[index];
                return ListTile(
                  leading: Text(recipe.method.value?.name ?? ''),
                  title: Text(recipe.ratio.formattedAsRatio()),
                  trailing: Text('${recipe.totalDuration}'),
                  onTap: () {
                    Modular.to.pushNamed(
                      '/recipes/detail',
                      arguments: state.recipes[index],
                    );
                  },
                );
              },
            );
          } else {
            return Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Modular.to.pushNamed('/add-recipe', arguments: bean);
          findRecipes.getAll();
        },
      ),
    );
  }
}
