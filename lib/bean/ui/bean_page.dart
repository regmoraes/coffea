import 'package:coffea/bean/use_case/get_beans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BeanPage extends StatelessWidget {
  const BeanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final findBeans = Modular.get<GetBeans>();

    return Scaffold(
      body: BlocBuilder<GetBeans, FindBeansState>(
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
          findBeans.getAll();
        },
      ),
    );
  }
}
