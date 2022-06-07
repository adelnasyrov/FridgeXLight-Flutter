import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
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
        body: const Center(
          child: Text(
            "Search",
            style: TextStyle(color: Colors.white),
          ),
        ));
  }
}
