import 'package:coffea/domain/bean.dart';
import 'package:coffea/domain/flavor.dart';
import 'package:coffea/domain/roast.dart';
import 'package:coffea/infrastructure/cubit.dart';
import 'package:coffea/infrastructure/cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:search_choices/search_choices.dart';

class AddBeanRoute extends StatefulWidget {
  const AddBeanRoute({Key? key}) : super(key: key);

  @override
  AddBeanRouteState createState() => AddBeanRouteState();
}

class AddBeanRouteState extends State<AddBeanRoute> {
  final _formData = _AddBeanFormData(GlobalKey<FormState>());

  @override
  void initState() {
    super.initState();
    context.read<CoffeaCubit>()
      ..getRoasts()
      ..getFlavors();
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
                    border: UnderlineInputBorder(), labelText: 'Brand'),
                onChanged: (text) => _formData.beanBrand = text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Brand must not be empty';
                  }
                  return null;
                },
              ),
              BlocBuilder<CoffeaCubit, CoffeaState>(
                buildWhen: (context, state) => state is RoastsState,
                builder: (context, state) {
                  return DropdownButtonFormField<Roast>(
                    hint: const Text("Roast"),
                    value: _formData.selectedRoast,
                    onChanged: (roast) {
                      setState(() => _formData.selectedRoast = roast);
                    },
                    items: state is RoastsState
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
              BlocBuilder<CoffeaCubit, CoffeaState>(
                buildWhen: (context, state) => state is FlavorsState,
                builder: (context, state) {
                  return SearchChoices<Flavor>.multiple(
                    onChanged: (selectState) => setState(
                      () => _formData.selectedFlavors = selectState.value,
                    ),
                    items: state is FlavorsState
                        ? state.flavors
                            .map((e) =>
                                DropdownMenuItem(child: Text(e.name), value: e))
                            .toList()
                        : List.empty(),
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formData.isValid) {
                    final newBean = _formData.buildBean();
                    context.read<CoffeaCubit>().addBean(newBean);
                    Navigator.pop(context);
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
  late String beanName;
  late String beanBrand;
  late Roast beanRoast;
  var beanFlavors = <Flavor>[];
  Roast? selectedRoast;
  var selectedFlavors = <Flavor>[];

  _AddBeanFormData(this.formKey);

  bool get isValid => formKey.currentState!.validate();

  Bean buildBean() {
    return Bean(
      beanName,
      brand: beanBrand,
      flavors: beanFlavors,
      roast: selectedRoast,
    );
  }
}
