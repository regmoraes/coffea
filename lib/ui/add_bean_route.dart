import 'package:coffea/bean/bean.dart';
import 'package:coffea/bean/cubit.dart';
import 'package:coffea/bean/flavor.dart';
import 'package:coffea/bean/roast.dart';
import 'package:coffea/bean/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddBeanRoute extends StatefulWidget {
  const AddBeanRoute({Key? key}) : super(key: key);

  @override
  AddBeanRouteState createState() => AddBeanRouteState();
}

class AddBeanRouteState extends State<AddBeanRoute> {
  final beanCubit = Modular.get<BeanCubit>();
  final _formData = _AddBeanFormData(GlobalKey<FormState>());

  @override
  void initState() {
    super.initState();
    beanCubit
      ..getFlavors()
      ..getRoasts();
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
              BlocBuilder<BeanCubit, BeanState>(
                bloc: beanCubit,
                buildWhen: (context, state) => state is GetRoastsState,
                builder: (context, state) {
                  return DropdownButtonFormField<Roast>(
                    hint: const Text("Roast"),
                    value: _formData.selectedRoast,
                    onChanged: (roast) {
                      setState(() => _formData.selectedRoast = roast);
                    },
                    items: state is GetRoastsState
                        ? state.data
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
              BlocBuilder<BeanCubit, BeanState>(
                bloc: beanCubit,
                buildWhen: (_, current) => current is GetFlavorsState,
                builder: (context, state) {},
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formData.isValid) {
                    final newBean = _formData.createBean();
                    beanCubit.addBean(newBean);
                    Modular.to.navigate('/beans');
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

Map<String, dynamic> displayEntry(Flavor flavor) {
  return {"display": flavor.name, "value": flavor};
}

class _AddBeanFormData {
  GlobalKey<FormState> formKey;
  late String beanName;
  late String beanBrand;
  late Roast beanRoast;
  late List<Flavor> beanFlavors;

  Roast? selectedRoast;
  List<Flavor> selectedFlavors = <Flavor>[];

  _AddBeanFormData(this.formKey);

  bool get isValid => formKey.currentState!.validate();

  Bean createBean() {
    return Bean(
      beanName,
      brand: beanBrand,
      flavors: beanFlavors,
      roast: selectedRoast,
    );
  }
}
