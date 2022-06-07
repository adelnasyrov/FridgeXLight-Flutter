import 'dart:js';

import 'package:cook_it/pages/addproduct.dart';
import 'package:cook_it/pages/fridge.dart';
import 'package:flutter/material.dart';
import 'package:cook_it/pages/search.dart';
import 'package:cook_it/pages/recipes.dart';
import 'package:cook_it/pages/categories.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    theme: ThemeData(
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.deepOrangeAccent),
      ),
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => const MainPage(),
      '/fridge': (context) => const Fridge(),
      '/search': (context) => const Search(),
      '/recipes': (context) => const Recipes(),
      '/categories': (context) => const Categories(),
      '/addproduct': (context) => const AddProduct(),
    },
  ));
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  final screens = [
    const Fridge(),
    const Search(),
    const Recipes(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(
          fontFamily: "Comfort",
        ),
        showUnselectedLabels: false,
        onTap: (index) => setState(() => currentIndex = index),
        currentIndex: currentIndex,
        backgroundColor: Colors.grey[850],
        fixedColor: Colors.deepOrangeAccent,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/fridge_button.png"),
              ),
              label: "Fridge"),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/search_button.png"),
              ),
              label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.menu_book_outlined,
              ),
              label: "Recipes"),
        ],
      ),
    );
  }
}
