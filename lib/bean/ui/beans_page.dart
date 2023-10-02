import 'package:coffea/application/data/event.dart';
import 'package:coffea/bean/model/bean.dart';
import 'package:coffea/bean/use_case/find_beans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BeansPage extends StatefulWidget {
  const BeansPage({Key? key}) : super(key: key);

  @override
  State<BeansPage> createState() => _BeansPageState();
}

class _BeansPageState extends State<BeansPage> {
  final findBeans = Modular.get<FindBeans>();

  @override
  void initState() {
    super.initState();
    findBeans.findAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FindBeans, Event<List<Bean>>>(
        bloc: findBeans,
        builder: (context, event) {
          if (event is Success<List<Bean>>) {
            return ListView.builder(
              itemCount: event.data.length,
              itemBuilder: (context, index) {
                final bean = event.data.elementAt(index);
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
