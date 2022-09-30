import 'package:cook_it/widgets/recipe_category.dart';
import 'package:flutter/material.dart';

class Catalog extends StatefulWidget {
  const Catalog({Key? key}) : super(key: key);

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[800],
          title: Text(
            "Catalog",
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    RecipeCategory(
                        category: "Каши",
                        image_address:
                            "assets/images/recipe_categories/categ_1.jpg"),
                    RecipeCategory(
                        category: "Горячие блюда",
                        image_address:
                            "assets/images/recipe_categories/categ_3.jpg"),
                    RecipeCategory(
                        category: "Салаты",
                        image_address:
                            "assets/images/recipe_categories/categ_5.jpg"),
                    RecipeCategory(
                        category: "Соусы",
                        image_address:
                            "assets/images/recipe_categories/categ_7.jpg"),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    RecipeCategory(
                        category: "Супы",
                        image_address:
                            "assets/images/recipe_categories/categ_2.jpg"),
                    RecipeCategory(
                        category: "Выпечка",
                        image_address:
                            "assets/images/recipe_categories/categ_4.jpg"),
                    RecipeCategory(
                        category: "Десерты",
                        image_address:
                            "assets/images/recipe_categories/categ_6.jpg"),
                    RecipeCategory(
                        category: "Напитки",
                        image_address:
                            "assets/images/recipe_categories/categ_8.jpg"),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
