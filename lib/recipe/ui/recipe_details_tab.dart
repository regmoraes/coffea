import 'package:coffea/application/data/event.dart';
import 'package:coffea/bean/model/bean.dart';
import 'package:coffea/bean/model/grind_size.dart';
import 'package:coffea/bean/use_case/find_beans.dart';
import 'package:coffea/bean/use_case/find_grind_sizes.dart';
import 'package:coffea/recipe/model/method.dart';
import 'package:coffea/recipe/model/ratio_calculator.dart';
import 'package:coffea/recipe/ui/new_recipe_page.dart';
import 'package:coffea/recipe/use_case/create_recipe.dart';
import 'package:coffea/recipe/use_case/find_methods.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RecipeDetailsTab extends StatefulWidget {
  final NewRecipeFormData formData;

  const RecipeDetailsTab({Key? key, required this.formData}) : super(key: key);

  @override
  RecipeDetailsTabState createState() => RecipeDetailsTabState();
}

class RecipeDetailsTabState extends State<RecipeDetailsTab> {
  final createRecipe = Modular.get<CreateRecipe>();
  final findMethods = Modular.get<FindMethods>();
  final findBeans = Modular.get<FindBeans>();
  final findGrindSizes = Modular.get<FindGrindSizes>();

  late final TextEditingController _beanQuantityController = TextEditingController(
    text: '${widget.formData.recipeBuilder.ratioCalculator.beanQuantity}',
  );
  late final TextEditingController _waterQuantityController = TextEditingController(
    text: '${widget.formData.recipeBuilder.ratioCalculator.waterQuantity}',
  );
  late final TextEditingController _ratioController = TextEditingController(
    text: widget.formData.recipeBuilder.ratioCalculator.ratio.formattedAsRatio(),
  );

  @override
  void initState() {
    super.initState();
    if (widget.formData.recipeBuilder.bean == null) {
      findBeans.findAll();
    }
    findBeans.findAll();
    findGrindSizes.findAll();
    findMethods.findAll();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Form(
          key: widget.formData.formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Name',
                ),
                onChanged: (text) {
                  setState(() => widget.formData.recipeBuilder.name = text);
                },
                validator: (value) {
                  return value?.isNotEmpty == true ? null : 'Name must not be empty';
                },
              ),
              BlocBuilder<FindMethods, Event<List<Method>>>(
                bloc: findMethods,
                builder: (context, state) {
                  return DropdownButtonFormField<Method>(
                    hint: const Text("Method"),
                    value: widget.formData.recipeBuilder.method,
                    onChanged: (method) {
                      setState(() {
                        if (method != null) {
                          widget.formData.recipeBuilder.method;
                        }
                      });
                    },
                    items: state is Success<List<Method>>
                        ? state.data
                            .map(
                              (method) => DropdownMenuItem(
                                value: method,
                                child: Text(method.name),
                                onTap: () {
                                  widget.formData.recipeBuilder.method = method;
                                },
                              ),
                            )
                            .toList()
                        : List.empty(),
                  );
                },
              ),
              BlocBuilder<FindBeans, Event<List<Bean>>>(
                bloc: findBeans,
                builder: (context, state) {
                  return DropdownButtonFormField<Bean>(
                    hint: const Text("Bean"),
                    value: widget.formData.recipeBuilder.bean,
                    onChanged: (bean) {
                      setState(() => widget.formData.recipeBuilder.bean = bean);
                    },
                    items: state is Success<List<Bean>>
                        ? state.data
                            .map(
                              (bean) => DropdownMenuItem(
                                value: bean,
                                child: Text(bean.name),
                                onTap: () {
                                  widget.formData.recipeBuilder.bean = bean;
                                },
                              ),
                            )
                            .toList()
                        : List.empty(),
                  );
                },
              ),
              BlocBuilder<FindGrindSizes, FindGrindSizesState>(
                bloc: findGrindSizes,
                builder: (context, state) {
                  return DropdownButtonFormField<GrindSize>(
                    hint: const Text("Grind Size"),
                    value: widget.formData.recipeBuilder.grindSize,
                    onChanged: (grindSize) {
                      setState(() {
                        if (grindSize != null) {
                          widget.formData.recipeBuilder.grindSize;
                        }
                      });
                    },
                    items: state is GrindSizesFound
                        ? state.grindSizes
                            .map(
                              (grindSize) => DropdownMenuItem(
                                value: grindSize,
                                child: Text(grindSize.name),
                                onTap: () {
                                  widget.formData.recipeBuilder.grindSize = grindSize;
                                },
                              ),
                            )
                            .toList()
                        : List.empty(),
                  );
                },
              ),
              TextFormField(
                controller: _waterQuantityController,
                onChanged: (text) {
                  if (isValidQuantity(text)) {
                    widget.formData.recipeBuilder.ratioCalculator.waterQuantity = double.parse(text);
                  }
                },
                validator: (value) {
                  return isValidQuantity(value) ? null : 'Water must not be empty';
                },
                onFieldSubmitted: (text) {
                  setState(() {
                    if (isValidQuantity(text)) {
                      widget.formData.recipeBuilder.ratioCalculator.waterQuantity = double.parse(text);
                    }
                  });
                },
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Water',
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
              ),
              TextFormField(
                controller: _beanQuantityController,
                onChanged: (text) {
                  if (isValidQuantity(text)) {
                    widget.formData.recipeBuilder.ratioCalculator.beanQuantity = double.parse(text);
                  }
                },
                onFieldSubmitted: (text) {
                  setState(() {
                    if (isValidQuantity(text)) {
                      widget.formData.recipeBuilder.ratioCalculator.beanQuantity = double.parse(text);
                    }
                  });
                },
                validator: (value) {
                  return isValidQuantity(value) ? null : 'Bean must not be empty';
                },
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Bean',
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  signed: false,
                  decimal: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _ratioController,
                  onChanged: (text) {
                    if (isValidQuantity(text)) {
                      updateRatio(double.parse(text));
                    }
                  },
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Ratio',
                  ),
                  keyboardType: const TextInputType.numberWithOptions(
                    signed: false,
                    decimal: true,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (widget.formData.isValid) {
                    final newRecipe = widget.formData.recipeBuilder.build();
                    createRecipe(newRecipe);
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

  bool isValidQuantity(String? text) {
    if (text == null) {
      return false;
    } else {
      return text.isNotEmpty && double.parse(text) > 0;
    }
  }

  void updateRatio(double ratio) {
    widget.formData.recipeBuilder.ratioCalculator.ratio = 1 / ratio;
    _beanQuantityController.text = widget.formData.recipeBuilder.ratioCalculator.beanQuantity.toStringAsFixed(1);
    _waterQuantityController.text = '${widget.formData.recipeBuilder.ratioCalculator.waterQuantity}';
  }
}
