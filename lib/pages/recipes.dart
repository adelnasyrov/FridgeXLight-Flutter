import 'package:flutter/material.dart';

class Recipes extends StatefulWidget {
  const Recipes({Key? key}) : super(key: key);

  @override
  State<Recipes> createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[800],
          title: const Text(
            "Recipes",
            style: TextStyle(
              fontFamily: "Comfort",
              color: Colors.white,
            ),
          ),
          centerTitle: false,
        ),
        backgroundColor: Colors.black,
        body: const Center(
          child: Text(
            "Recipes",
            style: TextStyle(color: Colors.white),
          ),
        ));
  }
}
