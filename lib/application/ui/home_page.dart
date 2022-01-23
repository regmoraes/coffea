import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

const beansPageIndex = 0;
const recipesPageIndex = 1;
const experimentsPageIndex = 2;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentNavBarItemIndex = beansPageIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffea'),
      ),
      body: RouterOutlet(),
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
            label: "Experiments",
            icon: Icon(Icons.science_outlined),
          ),
        ],
        onTap: (itemIndex) {
          setState(
            () {
              _currentNavBarItemIndex = itemIndex;
              switch (itemIndex) {
                case recipesPageIndex:
                  Modular.to.navigate('/recipes');
                  break;
                case experimentsPageIndex:
                  Modular.to.navigate('/experiments');
                  break;
                case beansPageIndex:
                  Modular.to.navigate('/beans');
                  break;
              }
            },
          );
        },
      ),
    );
  }
}
