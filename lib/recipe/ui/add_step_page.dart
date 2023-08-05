import 'package:coffea/recipe/model/recipe_builder.dart';
import 'package:coffea/recipe/model/step_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddStepPage extends StatefulWidget {
  final RecipeBuilder recipeBuilder;

  const AddStepPage({Key? key, required this.recipeBuilder}) : super(key: key);

  @override
  AddStepPageState createState() => AddStepPageState();
}

class AddStepPageState extends State<AddStepPage> {
  final _formData = _AddStepFormData(GlobalKey<FormState>());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("New Step")),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formData.formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Name',
                ),
                onChanged: (text) {
                  setState(() => _formData.stepBuilder.description = text);
                },
                validator: (value) {
                  return value?.isNotEmpty == true
                      ? null
                      : 'Name must not be empty';
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Duration',
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: false,
                  signed: false,
                ),
                onChanged: (text) {
                  setState(() {
                    _formData.stepBuilder.duration = Duration(
                      seconds: int.parse(text),
                    );
                  });
                },
                validator: (value) {
                  return value != null ? null : 'Water must not be empty';
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formData.isValid) {
                    final step = _formData.stepBuilder.build();
                    widget.recipeBuilder.steps.add(step);
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

class _AddStepFormData {
  GlobalKey<FormState> formKey;
  StepBuilder stepBuilder = StepBuilder();

  _AddStepFormData(this.formKey);

  bool get isValid => formKey.currentState?.validate() ?? false;
}
