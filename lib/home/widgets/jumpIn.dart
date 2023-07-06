import 'package:flutter/material.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/getwidget.dart';
import 'package:spotify/data.dart';

import '../../audio.dart';

class JumpIn extends StatelessWidget {
  const JumpIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left:10,),
          child: Container(
            child: Text(
              "Jump Back In",
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
            itemCount: Data().anotherRandomList.length,
            itemBuilder: (context,index){
              return Container(
                width: 150,
                padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                child: Column(
                  crossAxisAlignment: Data().anotherRandomList[index]['alignment'] as CrossAxisAlignment,
                  children: [
                    InkWell(
                      onTap:(){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder:(context){
                                return AudioplayerPro(
                                  audioURl: Data().anotherRandomList[index]['audio'].toString(),
                                  image:  Data().anotherRandomList[index]['image'].toString(),
                                  name:  Data().anotherRandomList[index]['name'].toString(),
                                );
                              }
                          ),
                        );
                      },
                      child: Container(
                        child: GFAvatar(
                          shape: Data().anotherRandomList[index]['shape'] as GFAvatarShape,
                          backgroundImage: AssetImage(
                              Data().anotherRandomList[index]['image'].toString()
                          ),
                          radius: 70,
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Align(
                      alignment:Alignment.center,
                      child: Text(
                        Data().anotherRandomList[index]['name'].toString(),
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
