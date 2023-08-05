import 'package:coffea/bean/model/bean.dart';
import 'package:coffea/recipe/model/recipe_builder.dart';
import 'package:coffea/recipe/ui/recipe_details_tab.dart';
import 'package:coffea/recipe/ui/recipe_steps_tab.dart';
import 'package:flutter/material.dart';

class AddRecipePage extends StatefulWidget {
  final Bean? bean;

  const AddRecipePage({Key? key, this.bean}) : super(key: key);

  @override
  AddRecipePageState createState() => AddRecipePageState();
}

class AddRecipePageState extends State<AddRecipePage> {
  final _formData = _AddRecipeFormData(GlobalKey<FormState>());

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
            RecipeContentTab(recipeBuilder: _formData.recipeBuilder),
            RecipeStepsTab(recipeBuilder: _formData.recipeBuilder),
          ],
        ),
      ),
    );
  }
}

class _AddRecipeFormData {
  GlobalKey<FormState> formKey;
  RecipeBuilder recipeBuilder = RecipeBuilder();

  _AddRecipeFormData(this.formKey);

  bool get isValid => formKey.currentState?.validate() ?? false;
}
