import 'dart:ui';

import 'package:cook_it/locale_string.dart';
import 'package:cook_it/pages/catalog/catalog.dart';
import 'package:cook_it/pages/catalog/categoried_recipes.dart';
import 'package:cook_it/pages/catalog/local_catalog.dart';
import 'package:cook_it/pages/fridge/add_product.dart';
import 'package:cook_it/pages/fridge/categories.dart';
import 'package:cook_it/pages/fridge/fridge.dart';
import 'package:cook_it/pages/search/recipe_screen.dart';
import 'package:cook_it/pages/search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

Future initialization(BuildContext? context) async {
  await Future.delayed(Duration(seconds: 3));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LocalString(),
      locale: window.locale.languageCode == "ru"
          ? Locale('ru', "RU")
          : Locale('en', "US"),
      theme: ThemeData(
        primarySwatch: Colors.grey,
        unselectedWidgetColor: Colors.deepOrangeAccent,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.deepOrangeAccent),
        ),
      ),
      routes: {
        '/': (context) => const MainPage(),
        '/fridge': (context) => const Fridge(),
        '/search': (context) => const Search(),
        '/catalog': (context) => const Catalog(),
        '/categories': (context) => const Categories(),
        '/addproduct': (context) => const AddProduct(),
        '/recipe_screen': (context) => const RecipeScreen(),
        '/local_catalog': (context) => const LocalCatalog(),
        '/categoried_recipes': (context) => const CategoriedRecipes(),
      },
    );
  }
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
    const Catalog(),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.grey[800]));
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(
          fontFamily: "Comfort",
        ),
        showUnselectedLabels: false,
        onTap: (index) => setState(() => currentIndex = index),
        currentIndex: currentIndex,
        backgroundColor: Colors.grey[800],
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
              icon: ImageIcon(
                AssetImage("assets/images/folder_button.png"),
              ),
              label: "Catalog"),
        ],
      ),
    );
  }
}
