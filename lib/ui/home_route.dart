import 'package:coffea/ui/beans_route.dart';
import 'package:flutter/material.dart';

const beansPageIndex = 0;
const recipesPageIndex = 1;
const experimentsPageIndex = 2;

class HomeRoute extends StatefulWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  var _currentNavBarItemIndex = beansPageIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffea'),
      ),
      body: const BeansRoute(),
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
            },
          );
        },
      ),
    );
  }
}
