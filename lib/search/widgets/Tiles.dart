import 'package:flutter/material.dart';

class Tiles extends StatelessWidget {
  Tiles({required this.something});
  final List<String> something;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 16 / 9,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: something.map((imageURl) {
          return Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5 ),
                child: Image.asset(
              imageURl,
              fit: BoxFit.cover,
            )),
          );
        }).toList(),
      ),
    );
  }
}
