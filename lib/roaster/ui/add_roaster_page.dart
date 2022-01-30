import 'package:coffea/roaster/roaster.dart';
import 'package:coffea/roaster/use_case/add_roaster.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddRoasterPage extends StatefulWidget {
  const AddRoasterPage({Key? key}) : super(key: key);

  @override
  AddRoasterPageState createState() => AddRoasterPageState();
}

class AddRoasterPageState extends State<AddRoasterPage> {
  final addRoaster = Modular.get<AddRoaster>();
  final _formData = _AddRoasterFormData(GlobalKey<FormState>());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("New Roaster")),
      body: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Form(
          key: _formData.formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(), labelText: 'Name'),
                onChanged: (text) => _formData.roasterName = text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name must not be empty';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formData.isValid) {
                    final newRoaster = _formData.createRoaster();
                    addRoaster.add(newRoaster);
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

class _AddRoasterFormData {
  GlobalKey<FormState> formKey;
  String? roasterName;

  _AddRoasterFormData(this.formKey);

  bool get isValid => formKey.currentState?.validate() ?? false;

  Roaster createRoaster() {
    assert(roasterName != null);

    return Roaster(roasterName!);
  }
}
