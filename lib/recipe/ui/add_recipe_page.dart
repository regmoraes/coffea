import 'package:coffea/bean/model/bean.dart';
import 'package:coffea/bean/use_case/find_beans.dart';
import 'package:coffea/method/model/method.dart';
import 'package:coffea/method/use_case/find_methods.dart';
import 'package:coffea/recipe/model/recipe.dart';
import 'package:coffea/recipe/use_case/add_recipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddRecipePage extends StatefulWidget {
  final Bean? bean;

  const AddRecipePage({Key? key, this.bean}) : super(key: key);

  @override
  AddRecipePageState createState() => AddRecipePageState();
}

class AddRecipePageState extends State<AddRecipePage> {
  final addRecipe = Modular.get<AddRecipe>();
  final findMethods = Modular.get<FindMethods>();
  final findBeans = Modular.get<FindBeans>();
  final _formData = _AddRecipeFormData(GlobalKey<FormState>());
  late final TextEditingController _beanQuantityController;
  late final TextEditingController _waterQuantityController;

  @override
  void initState() {
    super.initState();
    if (widget.bean == null) {
      findBeans.findAll();
    }
    findMethods.findAll();
    findBeans.findAll();

    _beanQuantityController = TextEditingController(
      text: '${_formData.recipeBuilder.ratio.beanQuantity}',
    );

    _waterQuantityController = TextEditingController(
      text: '${_formData.recipeBuilder.ratio.waterQuantity}',
    );
  }

  @override
  Widget build(BuildContext context) {
    print(_formData.recipeBuilder.ratio);
    return Scaffold(
      appBar: AppBar(title: const Text("New Recipe")),
      body: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Form(
          key: _formData.formKey,
          child: Column(
            children: <Widget>[
              BlocBuilder<FindMethods, FindMethodsState>(
                bloc: findMethods,
                builder: (context, state) {
                  return DropdownButtonFormField<Method>(
                    hint: const Text("Method"),
                    value: _formData.recipeBuilder.method,
                    onChanged: (method) {
                      setState(() {
                        if (method != null) {
                          _formData.recipeBuilder.method;
                        }
                      });
                    },
                    items: state is MethodsFound
                        ? state.methods
                        .map(
                          (method) => DropdownMenuItem(
                        value: method,
                        child: Text(method.name),
                      ),
                    )
                        .toList()
                        : List.empty(),
                  );
                },
              ),
              BlocBuilder<FindBeans, FindBeansState>(
                bloc: findBeans,
                builder: (context, state) {
                  return DropdownButtonFormField<Bean>(
                    hint: const Text("Bean"),
                    value: _formData.recipeBuilder.bean,
                    onChanged: (bean) {
                      setState(
                            () {
                          if (bean != null) {
                            _formData.recipeBuilder.bean = bean;
                          }
                        },
                      );
                    },
                    items: state is BeansFound
                        ? state.beans
                        .map(
                          (method) => DropdownMenuItem(
                        value: method,
                        child: Text(method.name),
                      ),
                    )
                        .toList()
                        : List.empty(),
                  );
                },
              ),
              TextFormField(
                controller: _waterQuantityController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Water',
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                onChanged: (text) {
                  setState(() {
                    _formData.recipeBuilder.ratio.waterQuantity =
                        double.parse(text);
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Water must not be empty';
                  }
                  return null;
                },
              ),
              TextFormField(
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                controller: _beanQuantityController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Bean',
                ),
                onChanged: (text) {
                  setState(() {
                    _formData.recipeBuilder.ratio.beanQuantity =
                        double.parse(text);
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Bean must not be empty';
                  }
                  return null;
                },
              ),
              const Text('Ratio'),
              Slider(
                value: _formData.recipeBuilder.ratio.ratio,
                min: 1,
                max: 36,
                divisions: 35,
                label: _formData.recipeBuilder.ratio.formattedValue,
                onChanged: (double value) {
                  setState(() {
                    _formData.recipeBuilder.ratio.ratio = value;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formData.isValid) {
                    final newRecipe = _formData.recipeBuilder.build();
                    addRecipe.add(newRecipe);
                    Modular.to.pop();
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
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
