import 'package:coffea/bean/model/bean.dart';
import 'package:coffea/bean/model/grind_size.dart';
import 'package:coffea/bean/use_case/find_beans.dart';
import 'package:coffea/method/model/method.dart';
import 'package:coffea/method/use_case/find_methods.dart';
import 'package:coffea/recipe/model/recipe.dart';
import 'package:coffea/recipe/use_case/add_recipe.dart';
import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    if (widget.bean == null) {
      findBeans.findAll();
    }
    findMethods.findAll();
    findBeans.findAll();
  }

  @override
  Widget build(BuildContext context) {
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
                    value: _formData.method,
                    onChanged: (method) {
                      setState(() => _formData.method = method);
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
                    value: _formData.bean,
                    onChanged: (bean) {
                      setState(() => _formData.bean = bean);
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
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(), labelText: 'Water'),
                onChanged: (text) =>
                    _formData.waterQuantity = double.parse(text),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Water must not be empty';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(), labelText: 'Bean'),
                onChanged: (text) =>
                    _formData.beanQuantity = double.parse(text),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Bean must not be empty';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formData.isValid) {
                    final newRecipe = _formData.createRecipe();
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
  Method? method;
  Bean? bean;
  double? beanQuantity;
  double? waterQuantity;
  String? comments;

  _AddRecipeFormData(this.formKey);

  bool get isValid => formKey.currentState?.validate() ?? false;

  Recipe createRecipe() {
    assert(method != null && bean != null);

    return Recipe(
      method: method!,
      bean: bean!,
      grindSize: GrindSize('Medium Fine'),
      steps: List.empty(),
    );
  }
}
