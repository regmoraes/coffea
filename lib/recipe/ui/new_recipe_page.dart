import 'package:coffea/bean/model/bean.dart';
import 'package:coffea/recipe/model/recipe_builder.dart';
import 'package:coffea/recipe/ui/recipe_details_tab.dart';
import 'package:coffea/recipe/ui/recipe_steps_tab.dart';
import 'package:flutter/material.dart';

class NewRecipePage extends StatefulWidget {
  final Bean? bean;

  const NewRecipePage({Key? key, this.bean}) : super(key: key);

  @override
  NewRecipePageState createState() => NewRecipePageState();
}

class NewRecipePageState extends State<NewRecipePage> {
  final formData = NewRecipeFormData(GlobalKey<FormState>());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("New Recipe"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Details"),
              Tab(text: "Steps"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            RecipeDetailsTab(formData: formData),
            RecipeStepsTab(formData: formData),
          ],
        ),
      ),
    );
  }
}

class NewRecipeFormData {
  GlobalKey<FormState> formKey;
  RecipeBuilder recipeBuilder = RecipeBuilder();

  NewRecipeFormData(this.formKey);

  bool get isValid => formKey.currentState?.validate() ?? false;
}
