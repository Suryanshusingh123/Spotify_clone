import 'package:flutter/material.dart';
import 'package:spotify/search/widgets/SearchWidget.dart';
import 'package:spotify/search/widgets/topgenres.dart';

import '../bottomnavigation.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
            backgroundColor: Color.fromRGBO(18, 18, 18, 80),
        body: Container(
          child: ListView(
            children: [
              SizedBox(height: 5,),
              Text(
                "Search",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
             SearchWidget(),
              TopGenre(),
            ],
          ),
        ),
        bottomNavigationBar: BottomBar(1),
      ),
    );
  }
}
