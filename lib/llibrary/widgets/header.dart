import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround ,
        children: [
          //SizedBox(height: 40,),
          CircleAvatar(
            radius: 16,
            backgroundColor: Colors.deepOrange ,
            child: Text(
                'S',
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 10,),
          Text(
            'Your Library',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          Row(
            children: [
              Icon(Icons.search,color: Colors.white,size: 30,),
              SizedBox(width: 15,),
              Icon(Icons.add,color: Colors.white,size: 30,),
            ],
          )
        ],
      ),
    );
  }
}
