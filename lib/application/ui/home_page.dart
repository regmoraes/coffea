import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

const beansPageIndex = 0;
const recipesPageIndex = 1;
const roastersPageIndex = 2;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentNavBarItemIndex = beansPageIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffea'),
      ),
      body: const RouterOutlet(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentNavBarItemIndex,
        items: const [
          BottomNavigationBarItem(
            label: "Beans",
            icon: Icon(Icons.coffee),
          ),
          BottomNavigationBarItem(
            label: "Recipes",
            icon: Icon(Icons.sticky_note_2),
          ),
          BottomNavigationBarItem(
            label: "Roasters",
            icon: Icon(Icons.local_fire_department_outlined),
          ),
        ],
        onTap: (itemIndex) {
          setState(
            () {
              _currentNavBarItemIndex = itemIndex;
              switch (itemIndex) {
                case beansPageIndex:
                  Modular.to.navigate('/beans');
                  break;
                case recipesPageIndex:
                  Modular.to.navigate('/recipes');
                  break;
                case roastersPageIndex:
                  Modular.to.navigate('/roasters');
                  break;
              }
            },
          );
        },
      ),
    );
  }
}
