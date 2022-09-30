import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipeCategory extends StatelessWidget {
  String category;
  String image_address;

  RecipeCategory({required this.category, required this.image_address});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 5,
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          Positioned.fill(
              child: Padding(
            padding: EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                image_address,
                fit: BoxFit.cover,
              ),
            ),
          )),
          Positioned(
              child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black,
                      Colors.transparent,
                    ],
                  )),
            ),
          ))
        ],
      ),
    );
  }
}
