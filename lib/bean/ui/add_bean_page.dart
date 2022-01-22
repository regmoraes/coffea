import 'package:coffea/bean/model/bean.dart';
import 'package:coffea/bean/model/flavor.dart';
import 'package:coffea/bean/model/roast.dart';
import 'package:coffea/bean/use_case/add_bean.dart';
import 'package:coffea/bean/use_case/find_flavors.dart';
import 'package:coffea/bean/use_case/find_roasts.dart';
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
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(), labelText: 'Name'),
                onChanged: (text) => _formData.beanName = text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name must not be empty';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Brand',
                ),
                onChanged: (text) => _formData.beanBrand = text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Brand must not be empty';
                  }
                  return null;
                },
              ),
              BlocBuilder<FindRoasts, FindRoastsState>(
                bloc: findRoasts,
                builder: (context, state) {
                  return DropdownButtonFormField<Roast>(
                    hint: const Text("Roast"),
                    value: _formData.beanRoast,
                    onChanged: (roast) {
                      setState(() => _formData.beanRoast = roast);
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
                  (e) {
                    return Chip(
                      label: Text(e.name),
                      backgroundColor: e.color,
                      onDeleted: () {
                        setState(() => _formData.beanFlavors.remove(e));
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
  String? beanBrand;
  Roast? beanRoast;
  List<Flavor> beanFlavors = [];

  _AddBeanFormData(this.formKey);

  bool get isValid => formKey.currentState?.validate() ?? false;

  Bean createBean() {
    assert(beanName != null);

    return Bean(
      beanName!,
      brand: beanBrand,
      flavors: beanFlavors,
      roast: beanRoast,
    );
  }
}
