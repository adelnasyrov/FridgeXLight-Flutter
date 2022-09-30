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
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
            )
          ],
          centerTitle: true,
        ),
        backgroundColor: Colors.grey[900],
        body: Container(
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 4,
                    child: Stack(
                      alignment: AlignmentDirectional.centerStart,
                      children: [
                        Positioned.fill(
                            child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/images/recipes_categories/categ_1.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        )),
                      ],
                    ),
                  )
                ],
              ),
              Column(
                children: [],
              )
            ],
          ),
        ));
  }
}
