import 'package:coffea/bean/model/flavor.dart';
import 'package:coffea/bean/use_case/find_flavors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FlavorsPage extends StatefulWidget {
  final List<Flavor> beanFlavors;

  const FlavorsPage(this.beanFlavors, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FlavorsState();
}

class _FlavorsState extends State<FlavorsPage> {
  final FindFlavors findFlavors = Modular.get<FindFlavors>();

  @override
  void initState() {
    super.initState();
    findFlavors.findAllFlatten();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flavors")),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<FindFlavors, FindFlavorsState>(
              bloc: findFlavors,
              builder: (context, state) {
                if (state is FlavorsFound) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.flavors.length,
                    itemBuilder: (context, index) {
                      final flavor = state.flavors.elementAt(index);
                      return ListTile(
                        title: Text(
                          flavor.name,
                          style: TextStyle(
                            color: _getTextColorForFlavorColor(flavor.color),
                          ),
                        ),
                        tileColor: flavor.color,
                        trailing: Checkbox(
                          value: widget.beanFlavors.contains(flavor),
                          onChanged: (selected) {
                            setState(() {
                              if (selected == true) {
                                widget.beanFlavors.add(flavor);
                              } else {
                                widget.beanFlavors.remove(flavor);
                              }
                            });
                          },
                        ),
                      );
                    },
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
          ElevatedButton(
            child: const Text("Confirm"),
            onPressed: () => Modular.to.pop(),
          )
        ],
      ),
    );
  }
}

Color _getTextColorForFlavorColor(Color color) {
  return ThemeData.estimateBrightnessForColor(color) == Brightness.dark
      ? Colors.white
      : Colors.black;
}
