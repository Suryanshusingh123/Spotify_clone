import 'package:flutter/material.dart';

import '../../data.dart';
import 'Tiles.dart';

class TopGenre extends StatelessWidget {
  const TopGenre({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10,),
        Text(
          "Your Top Genere",
          style: TextStyle(
            fontFamily: 'LibreFranklin',
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10,),
        Tiles(something: Data().genres,),
        SizedBox(height: 10,),
        Text(
            'Browse All',
          style: TextStyle(
            fontFamily: 'LibreFranklin',
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10,),
        Tiles(something: Data().browseall,),
      ],
    );
  }
}
