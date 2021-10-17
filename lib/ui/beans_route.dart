import 'package:coffea/bean/cubit.dart';
import 'package:coffea/bean/module.dart';
import 'package:coffea/bean/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BeansRoute extends StatelessWidget {
  const BeansRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final beanCubit = Modular.get<BeanCubit>();

    return Scaffold(
      body: BlocBuilder<BeanCubit, BeanState>(
        bloc: beanCubit,
        builder: (context, state) {
          if (state is GetBeansState && state.hasData) {
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                final bean = state.data.elementAt(index);
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
          Modular.to.pushNamed(addBeanRouteName);
        },
      ),
    );
  }
}
