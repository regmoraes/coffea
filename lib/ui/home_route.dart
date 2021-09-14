import 'package:coffea/ui/beans_route.dart';
import 'package:coffea/ui/experiments_route.dart';
import 'package:coffea/ui/recipe_route.dart';
import 'package:flutter/material.dart';

const beansPageIndex = 0;
const recipesPageIndex = 1;
const experimentsPageIndex = 2;

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  final pages = {
    beansPageIndex: const BeansRoute(),
    recipesPageIndex: const RecipesPage(),
    experimentsPageIndex: const ExperimentsPage(),
  };

  Widget _getPageByItemIndex(itemIndex) {
    return pages[itemIndex] ?? pages[beansPageIndex]!;
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentNavBarItemIndex = beansPageIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffea'),
      ),
      body: widget._getPageByItemIndex(_currentNavBarItemIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentNavBarItemIndex,
        items: const [
          BottomNavigationBarItem(label: "Beans", icon: Icon(Icons.coffee)),
          BottomNavigationBarItem(
              label: "Recipes", icon: Icon(Icons.sticky_note_2)),
          BottomNavigationBarItem(
              label: "Experiments", icon: Icon(Icons.science_outlined)),
        ],
        onTap: (itemIndex) {
          setState(() {
            _currentNavBarItemIndex = itemIndex;
          });
        },
      ),
    );
  }
}
