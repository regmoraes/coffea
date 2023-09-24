import 'package:coffea/roaster/model/roaster.dart';
import 'package:coffea/roaster/use_case/find_roasters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RoastersPage extends StatefulWidget {
  const RoastersPage({Key? key}) : super(key: key);

  @override
  State<RoastersPage> createState() => _RoastersPageState();
}

class _RoastersPageState extends State<RoastersPage> {
  final FindRoasters findRoasters = Modular.get<FindRoasters>();

  @override
  void initState() {
    super.initState();
    findRoasters.findAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FindRoasters, List<Roaster>>(
        bloc: findRoasters,
        builder: (context, state) {
            return ListView.builder(
              itemCount: state.length,
              itemBuilder: (context, index) {
                final bean = state.elementAt(index);
                return ListTile(title: Text(bean.name));
              },
            );
          },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Modular.to.pushNamed('/add-roaster');
        },
      ),
    );
  }
}
