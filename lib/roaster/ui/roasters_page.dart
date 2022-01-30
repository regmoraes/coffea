import 'package:coffea/roaster/use_case/find_roasters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RoastersPage extends StatelessWidget {
  const RoastersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final findRoasters = Modular.get<FindRoasters>();

    return Scaffold(
      body: BlocBuilder<FindRoasters, FindRoastersState>(
        bloc: findRoasters,
        builder: (context, state) {
          if (state is RoastersFound) {
            return ListView.builder(
              itemCount: state.roasters.length,
              itemBuilder: (context, index) {
                final bean = state.roasters.elementAt(index);
                return ListTile(title: Text(bean.name));
              },
            );
          } else {
            return Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Modular.to.pushNamed('/add-roaster');
          findRoasters.findAll();
        },
      ),
    );
  }
}
