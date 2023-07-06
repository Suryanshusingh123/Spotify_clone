import 'package:flutter/material.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/getwidget.dart';
import 'package:spotify/audio.dart';
import 'package:spotify/data.dart';

class RecentlyPlayed extends StatelessWidget {
  const RecentlyPlayed({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left:10,),
          child: Container(
            child: Text(
              "Recently Played",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'LibreFranklin',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Container(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: Data().recentlyPlayed.length,
            itemBuilder: (context,index){
              return Container(
                width: 150,
                padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                child: Column(
                  crossAxisAlignment: Data().recentlyPlayed[index]['alignment'] as CrossAxisAlignment,
                  children: [
                    InkWell(
                      onTap:(){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder:(context){
                                  return AudioplayerPro(
                                      audioURl: Data().recentlyPlayed[index]['audio'].toString(),
                                      image:  Data().recentlyPlayed[index]['image'].toString(),
                                      name:  Data().recentlyPlayed[index]['name'].toString(),
                                  );
                                }
                            ),
                        );
                              },
                      child: Container(
                        child: GFAvatar(
                          shape: Data().recentlyPlayed[index]['shape'] as GFAvatarShape,
                          backgroundImage: AssetImage(
                            Data().recentlyPlayed[index]['image'].toString()
                          ),
                          radius: 70,
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Align(
                      alignment:Alignment.center,
                      child: Text(
                          Data().recentlyPlayed[index]['name'].toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    )
                  ],
                ),
              );
            },
          ),


        )
      ],
    );
  }
}
