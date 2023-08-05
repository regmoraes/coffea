import 'package:coffea/bean/model/bean.dart';
import 'package:coffea/bean/use_case/get_beans.dart';
import 'package:coffea/method/model/method.dart';
import 'package:coffea/method/use_case/find_methods.dart';
import 'package:coffea/recipe/model/grind_size.dart';
import 'package:coffea/recipe/model/ratio_calculator.dart';
import 'package:coffea/recipe/model/recipe_builder.dart';
import 'package:coffea/recipe/use_case/add_recipe.dart';
import 'package:coffea/recipe/use_case/find_grind_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RecipeContentTab extends StatefulWidget {
  final RecipeBuilder recipeBuilder;

  const RecipeContentTab({Key? key, required this.recipeBuilder})
      : super(key: key);

  @override
  RecipeContentTabState createState() => RecipeContentTabState();
}

class RecipeContentTabState extends State<RecipeContentTab> {
  final addRecipe = Modular.get<AddRecipe>();
  final findMethods = Modular.get<GetMethods>();
  final findBeans = Modular.get<GetBeans>();
  // final findGrindSizes = Modular.get<FindGrindSizes>();
  final _formData = _AddRecipeFormData(GlobalKey<FormState>());
  late final TextEditingController _beanQuantityController =
      TextEditingController(
    text: '${_formData.recipeBuilder.ratioCalculator.beanQuantity}',
  );
  late final TextEditingController _waterQuantityController =
      TextEditingController(
    text: '${_formData.recipeBuilder.ratioCalculator.waterQuantity}',
  );

  @override
  void initState() {
    super.initState();
    if (widget.recipeBuilder.bean == null) {
      findBeans.getAll();
    }
    findMethods.findAll();
    findBeans.getAll();
    // findGrindSizes.getAll();

    // _beanQuantityController =
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Form(
        key: _formData.formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Name',
              ),
              onFieldSubmitted: (text) {
                setState(() => _formData.recipeBuilder.name = text);
              },
              validator: (value) {
                return value?.isNotEmpty == true
                    ? null
                    : 'Name must not be empty';
              },
            ),
            BlocBuilder<GetMethods, FindMethodsState>(
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
                              onTap: () {
                                _formData.recipeBuilder.method = method;
                              },
                            ),
                          )
                          .toList()
                      : List.empty(),
                );
              },
            ),
            BlocBuilder<GetBeans, FindBeansState>(
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
                            (bean) => DropdownMenuItem(
                              value: bean,
                              child: Text(bean.name),
                              onTap: () {
                                _formData.recipeBuilder.bean = bean;
                              },
                            ),
                          )
                          .toList()
                      : List.empty(),
                );
              },
            ),
            // BlocBuilder<FindGrindSizes, FindGrindSizesState>(
            //   bloc: findGrindSizes,
            //   builder: (context, state) {
            //     return DropdownButtonFormField<GrindSize>(
            //       hint: const Text("Grind Size"),
            //       value: _formData.recipeBuilder.grindSize,
            //       onChanged: (grindSize) {
            //         setState(() {
            //           if (grindSize != null) {
            //             _formData.recipeBuilder.grindSize;
            //           }
            //         });
            //       },
            //       items: state is GrindSizesFound
            //           ? state.grindSizes
            //               .map(
            //                 (grindSize) => DropdownMenuItem(
            //                   value: grindSize,
            //                   child: Text(grindSize.size),
            //                   onTap: () {
            //                     _formData.recipeBuilder.grindSize = grindSize;
            //                   },
            //                 ),
            //               )
            //               .toList()
            //           : List.empty(),
            //     );
            //   },
            // ),
            TextFormField(
              controller: _waterQuantityController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Water',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onFieldSubmitted: (text) {
                setState(() {
                  if (isValidQuantity(text)) {
                    _formData.recipeBuilder.ratioCalculator.waterQuantity =
                        double.parse(text);
                  }
                });
              },
              validator: (value) {
                return isValidQuantity(value)
                    ? null
                    : 'Water must not be empty';
              },
            ),
            TextFormField(
              keyboardType: const TextInputType.numberWithOptions(
                signed: false,
                decimal: true,
              ),
              controller: _beanQuantityController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Bean',
              ),
              onFieldSubmitted: (text) {
                setState(() {
                  if (isValidQuantity(text)) {
                    _formData.recipeBuilder.ratioCalculator.beanQuantity =
                        double.parse(text);
                  }
                });
              },
              validator: (value) {
                return isValidQuantity(value) ? null : 'Bean must not be empty';
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Ratio (${_formData.recipeBuilder.ratioCalculator.ratio.formattedAsRatio()})',
                style: const TextStyle(fontSize: 24),
              ),
            ),
            Slider(
              value: _formData.recipeBuilder.ratioCalculator.ratio,
              min: minRatio,
              max: maxRatio,
              divisions: ratioSteps.toInt(),
              onChanged: (double value) {
                setState(() => updateRatio(value));
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
    );
  }

  bool isValidQuantity(String? text) {
    if (text == null) {
      return false;
    } else {
      return text.isNotEmpty && double.parse(text) > 0;
    }
  }

  void updateRatio(double ratio) {
    _formData.recipeBuilder.ratioCalculator.ratio = ratio;
    _beanQuantityController.text =
        _formData.recipeBuilder.ratioCalculator.beanQuantity.toStringAsFixed(1);
    _waterQuantityController.text =
        '${_formData.recipeBuilder.ratioCalculator.waterQuantity}';
  }
}

class _AddRecipeFormData {
  GlobalKey<FormState> formKey;
  RecipeBuilder recipeBuilder = RecipeBuilder();

  _AddRecipeFormData(this.formKey);

  bool get isValid => formKey.currentState?.validate() ?? false;
}
