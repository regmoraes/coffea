import 'package:coffea/bean/use_case/find_beans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BeansPage extends StatelessWidget {
  const BeansPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final findBeans = Modular.get<FindBeans>();

    return Scaffold(
      body: BlocBuilder<FindBeans, FindBeansState>(
        bloc: findBeans,
        builder: (context, state) {
          if (state is BeansFound) {
            return ListView.builder(
              itemCount: state.beans.length,
              itemBuilder: (context, index) {
                final bean = state.beans.elementAt(index);
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
          await Modular.to.pushNamed('/add-bean');
          findBeans.findAll();
        },
      ),
    );
  }
}
