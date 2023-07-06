import 'package:flutter/material.dart';
import 'package:spotify/home/widgets/HeaderActions.dart';
import 'package:spotify/home/widgets/Playlists.dart';
import 'package:spotify/home/widgets/RecentlyPlayed.dart';
import 'package:spotify/home/widgets/jumpIn.dart';

import '../bottomnavigation.dart';
  
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       body: Container(
         decoration: const BoxDecoration(
           gradient: LinearGradient(
             colors: [
               Color.fromRGBO(57, 90, 81, 1),
               Color.fromRGBO(46, 71, 65, 1),
               Color.fromRGBO(43, 64, 59, 1),
               Color.fromRGBO(18, 18, 18, 1),
             ],
           stops: [
             0.01,
             0.03,
             0.06,
             0.2
           ]),
         ),
         child:ListView(
           children: [
             const SizedBox(height: 15,),
             Padding(
               padding: EdgeInsets.only(left:5,),
               child: Row(
                 children: const [
                   Text("Good morning",
                     style: TextStyle(
                       color: Colors.white,
                       fontSize: 25,
                       fontWeight: FontWeight.bold,
                         fontFamily: 'LibreFranklin',
                     ),
                   ),
                  HeaderActions(),
                 ],
               ),
             ),
             SizedBox(height: 10,),
             Container(
               height: 210,
               child: const Playlists(),
             ),
             SizedBox(height: 20,),
             RecentlyPlayed(),
             JumpIn(),
           ],
         ),
         ),
        bottomNavigationBar: BottomBar(0),
       ),
    );

  }
}
