import 'package:coffea/bean/model/bean.dart';
import 'package:coffea/bean/model/flavor.dart';
import 'package:coffea/bean/model/roast.dart';
import 'package:coffea/bean/use_case/add_bean.dart';
import 'package:coffea/bean/use_case/find_flavors.dart';
import 'package:coffea/bean/use_case/find_roasts.dart';
import 'package:coffea/roaster/model/roaster.dart';
import 'package:coffea/roaster/use_case/find_roasters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddBeanPage extends StatefulWidget {
  const AddBeanPage({Key? key}) : super(key: key);

  @override
  AddBeanPageState createState() => AddBeanPageState();
}

class AddBeanPageState extends State<AddBeanPage> {
  final addBean = Modular.get<AddBean>();
  final findFlavors = Modular.get<FindFlavors>();
  final findRoasters = Modular.get<FindRoasters>();
  final findRoasts = Modular.get<FindRoasts>();
  final _formData = _AddBeanFormData(GlobalKey<FormState>());

  @override
  void initState() {
    super.initState();
    findFlavors.findAll();
    findRoasts.findAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("New Bean")),
      body: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Form(
          key: _formData.formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(border: UnderlineInputBorder(), labelText: 'Name'),
                onChanged: (text) => _formData.beanName = text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name must not be empty';
                  }
                  return null;
                },
              ),
              BlocBuilder<FindRoasters, List<Roaster>>(
                bloc: findRoasters,
                builder: (context, state) {
                  return DropdownButtonFormField<Roaster>(
                    hint: const Text("Roaster"),
                    value: _formData.roaster,
                    onChanged: (roaster) {
                      setState(() => _formData.roaster = roaster);
                    },
                    items: state.map(
                              (roaster) => DropdownMenuItem(
                                value: roaster,
                                child: Text(roaster.name),
                              ),
                            )
                            .toList(),
                  );
                },
              ),
              BlocBuilder<FindRoasts, GetRoastsState>(
                bloc: findRoasts,
                builder: (context, state) {
                  return DropdownButtonFormField<Roast>(
                    hint: const Text("Roast"),
                    value: _formData.roast,
                    onChanged: (roast) {
                      setState(() => _formData.roast = roast);
                    },
                    items: state is RoastsFound
                        ? state.roasts
                            .map(
                              (roast) => DropdownMenuItem(
                                value: roast,
                                child: Text(roast.type),
                              ),
                            )
                            .toList()
                        : List.empty(),
                  );
                },
              ),
              Wrap(
                children: _formData.beanFlavors.map<Widget>(
                  (flavor) {
                    return Chip(
                      label: Text(flavor.name),
                      backgroundColor: Color(flavor.colorHex),
                      onDeleted: () {
                        setState(() => _formData.beanFlavors.remove(flavor));
                      },
                    );
                  },
                ).toList()
                  ..add(
                    ActionChip(
                      label: const Icon(Icons.add),
                      onPressed: () => Modular.to
                          .pushNamed(
                            '/flavors',
                            arguments: _formData.beanFlavors,
                          )
                          .then((_) => setState(() {})),
                    ),
                  ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formData.isValid) {
                    final newBean = _formData.createBean();
                    addBean.add(newBean);
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

class _AddBeanFormData {
  GlobalKey<FormState> formKey;
  String? beanName;
  Roaster? roaster;
  Roast? roast;
  List<Flavor> beanFlavors = [];

  _AddBeanFormData(this.formKey);

  bool get isValid => formKey.currentState?.validate() ?? false;

  Bean createBean() {
    assert(beanName != null);

    return Bean()
      ..name = beanName!
      ..roaster.value = roaster!
      ..flavors.addAll(beanFlavors)
      ..roast.value = roast!;
  }
}
