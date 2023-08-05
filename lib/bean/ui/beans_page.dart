import 'package:coffea/bean/use_case/get_beans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BeansPage extends StatefulWidget {
  const BeansPage({Key? key}) : super(key: key);

  @override
  State<BeansPage> createState() => _BeansPageState();
}

class _BeansPageState extends State<BeansPage> {
  final findBeans = Modular.get<GetBeans>();

  @override
  void initState() {
    super.initState();
    findBeans.getAll();
  }

  @override
  Widget build(BuildContext context) {
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
