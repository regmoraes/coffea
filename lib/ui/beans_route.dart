import 'package:coffea/infrastructure/cubit.dart';
import 'package:coffea/infrastructure/cubit_state.dart';
import 'package:coffea/ui/add_bean_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BeansRoute extends StatelessWidget {
  const BeansRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CoffeaCubit, CoffeaState>(
        builder: (context, state) {
          if (state is BeansState) {
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
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddBeanRoute()),
          );
          context.read<CoffeaCubit>().getBeans();
        },
      ),
    );
  }
}
