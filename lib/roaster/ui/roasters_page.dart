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
  final GetRoasters findRoasters = Modular.get<GetRoasters>();

  @override
  void initState() {
    super.initState();
    findRoasters.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetRoasters, FindRoastersState>(
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
        },
      ),
    );
  }
}
