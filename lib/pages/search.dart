import 'package:cook_it/models/recipe.dart';
import 'package:flutter/material.dart';

import '../DatabaseHelper/dbhelper.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Recipe> recipeList = [];
  List<String> recipeImages = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    var dbHelper = DBHelper();
    List<Recipe> recipesList = await dbHelper.getRecipes();
    List<String> recipesImages = await getImages();
    setState(
      () {
        recipeList = recipesList;
        recipeImages = recipesImages;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: const Text(
          "Search",
          style: TextStyle(
            fontFamily: "Comfort",
            color: Colors.white,
          ),
        ),
        centerTitle: false,
      ),
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: ListTile(
              dense: true,
              contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
              leading: Container(
                width: 160,
                child: AspectRatio(
                    aspectRatio: 8 / 7,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        recipeImages[recipeList[index].id - 1],
                        fit: BoxFit.cover,
                      ),
                    )),
              ),
            ),
            color: Colors.grey[900],
          );
        },
        itemCount: recipeList.length,
      ),
    );
  }

  List<String> getImages() {
    List<String> recipeImages = [
      "assets/images/recipes/recipe_1.jpg",
      "assets/images/recipes/recipe_2.jpg",
      "assets/images/recipes/recipe_3.jpg",
      "assets/images/recipes/recipe_4.jpg",
      "assets/images/recipes/recipe_5.jpg",
      "assets/images/recipes/recipe_6.jpg",
      "assets/images/recipes/recipe_7.jpg",
      "assets/images/recipes/recipe_8.jpg",
      "assets/images/recipes/recipe_9.jpg",
      "assets/images/recipes/recipe_10.jpg",
      "assets/images/recipes/recipe_11.jpg",
      "assets/images/recipes/recipe_12.jpg",
      "assets/images/recipes/recipe_13.jpg",
      "assets/images/recipes/recipe_14.jpg",
      "assets/images/recipes/recipe_15.jpg",
      "assets/images/recipes/recipe_16.jpg",
      "assets/images/recipes/recipe_17.jpg",
      "assets/images/recipes/recipe_18.jpg",
      "assets/images/recipes/recipe_19.jpg",
      "assets/images/recipes/recipe_20.jpg",
      "assets/images/recipes/recipe_21.jpg",
      "assets/images/recipes/recipe_22.jpg",
      "assets/images/recipes/recipe_23.jpg",
      "assets/images/recipes/recipe_24.jpg",
      "assets/images/recipes/recipe_25.jpg",
      "assets/images/recipes/recipe_26.jpg",
      "assets/images/recipes/recipe_27.jpg",
      "assets/images/recipes/recipe_28.jpg",
      "assets/images/recipes/recipe_29.jpg",
      "assets/images/recipes/recipe_30.jpg",
      "assets/images/recipes/recipe_31.jpg",
      "assets/images/recipes/recipe_32.jpg",
      "assets/images/recipes/recipe_33.jpg",
      "assets/images/recipes/recipe_34.jpg",
      "assets/images/recipes/recipe_35.jpg",
      "assets/images/recipes/recipe_36.jpg",
      "assets/images/recipes/recipe_37.jpg",
      "assets/images/recipes/recipe_38.jpg",
      "assets/images/recipes/recipe_39.jpg",
      "assets/images/recipes/recipe_40.jpg",
      "assets/images/recipes/recipe_41.jpg",
      "assets/images/recipes/recipe_42.jpg",
      "assets/images/recipes/recipe_43.jpg",
      "assets/images/recipes/recipe_44.jpg",
      "assets/images/recipes/recipe_45.jpg",
      "assets/images/recipes/recipe_46.jpg",
      "assets/images/recipes/recipe_47.jpg",
      "assets/images/recipes/recipe_48.jpg",
      "assets/images/recipes/recipe_49.jpg",
      "assets/images/recipes/recipe_50.jpg",
      "assets/images/recipes/recipe_51.jpg",
      "assets/images/recipes/recipe_52.jpg",
      "assets/images/recipes/recipe_53.jpg",
      "assets/images/recipes/recipe_54.jpg",
      "assets/images/recipes/recipe_55.jpg",
      "assets/images/recipes/recipe_56.jpg",
      "assets/images/recipes/recipe_57.jpg",
      "assets/images/recipes/recipe_58.jpg",
      "assets/images/recipes/recipe_59.jpg",
      "assets/images/recipes/recipe_60.jpg",
      "assets/images/recipes/recipe_61.jpg",
      "assets/images/recipes/recipe_62.jpg",
      "assets/images/recipes/recipe_63.jpg",
      "assets/images/recipes/recipe_64.jpg",
      "assets/images/recipes/recipe_65.jpg",
      "assets/images/recipes/recipe_66.jpg",
      "assets/images/recipes/recipe_67.jpg",
      "assets/images/recipes/recipe_68.jpg",
      "assets/images/recipes/recipe_69.jpg",
      "assets/images/recipes/recipe_70.jpg",
      "assets/images/recipes/recipe_71.jpg",
      "assets/images/recipes/recipe_72.jpg",
      "assets/images/recipes/recipe_73.jpg",
      "assets/images/recipes/recipe_74.jpg",
      "assets/images/recipes/recipe_75.jpg",
      "assets/images/recipes/recipe_76.jpg",
      "assets/images/recipes/recipe_77.jpg",
      "assets/images/recipes/recipe_78.jpg",
      "assets/images/recipes/recipe_79.jpg",
      "assets/images/recipes/recipe_80.jpg",
      "assets/images/recipes/recipe_81.jpg",
      "assets/images/recipes/recipe_82.jpg",
      "assets/images/recipes/recipe_83.jpg",
      "assets/images/recipes/recipe_84.jpg",
      "assets/images/recipes/recipe_85.jpg",
      "assets/images/recipes/recipe_86.jpg",
      "assets/images/recipes/recipe_87.jpg",
      "assets/images/recipes/recipe_88.jpg",
      "assets/images/recipes/recipe_89.jpg",
      "assets/images/recipes/recipe_90.jpg",
      "assets/images/recipes/recipe_91.jpg",
      "assets/images/recipes/recipe_92.jpg",
      "assets/images/recipes/recipe_93.jpg",
      "assets/images/recipes/recipe_94.jpg",
      "assets/images/recipes/recipe_95.jpg",
      "assets/images/recipes/recipe_96.jpg",
      "assets/images/recipes/recipe_97.jpg",
      "assets/images/recipes/recipe_98.jpg",
      "assets/images/recipes/recipe_99.jpg",
      "assets/images/recipes/recipe_100.jpg",
      "assets/images/recipes/recipe_101.jpg",
      "assets/images/recipes/recipe_102.jpg",
      "assets/images/recipes/recipe_103.jpg",
      "assets/images/recipes/recipe_104.jpg",
      "assets/images/recipes/recipe_105.jpg",
      "assets/images/recipes/recipe_106.jpg",
      "assets/images/recipes/recipe_107.jpg",
      "assets/images/recipes/recipe_108.jpg",
      "assets/images/recipes/recipe_109.jpg",
      "assets/images/recipes/recipe_110.jpg",
      "assets/images/recipes/recipe_111.jpg",
      "assets/images/recipes/recipe_112.jpg",
      "assets/images/recipes/recipe_113.jpg",
      "assets/images/recipes/recipe_114.jpg",
      "assets/images/recipes/recipe_115.jpg",
      "assets/images/recipes/recipe_116.jpg",
      "assets/images/recipes/recipe_117.jpg",
      "assets/images/recipes/recipe_118.jpg",
      "assets/images/recipes/recipe_119.jpg",
      "assets/images/recipes/recipe_120.jpg",
      "assets/images/recipes/recipe_121.jpg",
      "assets/images/recipes/recipe_122.jpg",
      "assets/images/recipes/recipe_123.jpg",
      "assets/images/recipes/recipe_124.jpg",
      "assets/images/recipes/recipe_125.jpg",
      "assets/images/recipes/recipe_126.jpg",
      "assets/images/recipes/recipe_127.jpg",
      "assets/images/recipes/recipe_128.jpg",
      "assets/images/recipes/recipe_129.jpg",
      "assets/images/recipes/recipe_130.jpg",
      "assets/images/recipes/recipe_131.jpg",
      "assets/images/recipes/recipe_132.jpg",
      "assets/images/recipes/recipe_133.jpg",
      "assets/images/recipes/recipe_134.jpg",
      "assets/images/recipes/recipe_135.jpg",
      "assets/images/recipes/recipe_136.jpg",
      "assets/images/recipes/recipe_137.jpg",
      "assets/images/recipes/recipe_138.jpg",
      "assets/images/recipes/recipe_139.jpg",
      "assets/images/recipes/recipe_140.jpg",
      "assets/images/recipes/recipe_141.jpg",
      "assets/images/recipes/recipe_142.jpg",
      "assets/images/recipes/recipe_143.jpg",
      "assets/images/recipes/recipe_144.jpg",
      "assets/images/recipes/recipe_145.jpg",
    ];
    return recipeImages;
  }
}
