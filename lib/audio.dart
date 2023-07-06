import 'package:audioplayers/audioplayers.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:share_plus/share_plus.dart';
import 'package:spotify/utilities/notify.dart';

class AudioplayerPro extends StatefulWidget {

  AudioplayerPro(
      {required this.audioURl, required this.image, required this.name});
  final String audioURl;
  final String image;
  final String name;

  @override
  State<AudioplayerPro> createState() => _AudioplayerProState();
}

class _AudioplayerProState extends State<AudioplayerPro> {

  Notify notify=Get.find();

  Duration  _duration=Duration();
  Duration _position=Duration();

  static AudioPlayer advancedPlayer=AudioPlayer();

  @override
  void initState() {
    // TODO: implement initState
    initPlayer();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }
  void initPlayer()
  {
    advancedPlayer=AudioPlayer();
    advancedPlayer.onDurationChanged.listen((d) {
      setState(() {
        _duration=d;
      });
    });
    advancedPlayer.onPositionChanged.listen((p) {
      setState(() {
        _duration=p;
      });
    });
  }
  void seekToSecond(second)
  {
    Duration newDuration=Duration(seconds: second);
    advancedPlayer.seek(newDuration);
  }
  double setChanged() {
    Duration newDuration = Duration(seconds: 0);
    advancedPlayer.seek(newDuration);
    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
        body: Container(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 40,
            ),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.brown,
                  Colors.black87,
                ])),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        LineIcons.angleDown,
                        color: Colors.white,
                        size: 24,
                      ),
                      Column(
                        children: [
                          Text(
                            "PLAYING FROM ALBUM",
                            style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            widget.name,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              fontFamily: "ProximaNova",
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        LineIcons.verticalEllipsis,
                        // LineIcons.ellipsis_v,
                        color: Colors.white,
                        size: 24,
                      )
                    ],
                  ),
                  SizedBox(height: 100,),
                  Container(
                    width: 325,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        widget.image,
                      ),
                    ),
                  ),
                  SizedBox(height: 100,),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 25,right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.name,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                wordSpacing: 0.2,
                                fontFamily: "ProximaNova",
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Classics",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.1,
                                fontFamily: "ProximaNova",
                                color: Colors.grey.shade400,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Obx(
                              ()=>(notify.isHeartPressed.value)?Icon(
                                LineIcons.heart,
                                color: Colors.white,
                                size:24,
                              ):Icon(
                                Icons.favorite,
                                color: Colors.green,
                                size:24,
                              ),

                          ),
                          onPressed: (){
                            notify.isHeartPressed.value=notify.isHeartPressed.value?false:true;
                          },

                        ),
                      ],
                    ),
                  ),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        width: double.infinity,
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Colors.grey.shade600,
                            activeTickMarkColor: Colors.white,
                            trackHeight: 3,
                            thumbColor: Colors.white,
                            thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 4,
                            )
                          ),
                          child: Slider(
                            value: (_position.inSeconds.toDouble()!=_duration.inSeconds.toDouble()?_position.inSeconds.toDouble():setChanged()),
                            onChanged: (value){
                              setState(() {
                                seekToSecond(value.toInt());
                                value = value;
                              });
                            },
                            max: _duration.inSeconds.toDouble(),
                            min: 0,
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 25,right: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${_position.inMinutes.toInt()}:${(_position.inSeconds%60).toString().padLeft(2,"0") }",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.1,
                                fontFamily: "ProximaNova",
                                color: Colors.grey.shade400,

                              ),
                            ),
                            Text(
                              "${_duration.inMinutes.toInt()}:${(_duration.inSeconds%60).toString().padLeft(2,"0") }",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.1,
                                fontFamily: "ProximaNova",
                                color: Colors.grey.shade400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 22,right: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          LineIcons.random,
                          color:  Colors.grey.shade400,
                        ),
                        InkWell(
                          onTap: (){},
                          child: Icon(
                            Icons.skip_previous,
                            color:  Colors.grey.shade400,
                            size: 40,
                          ),
                        ),
                        Container(
                          height: 90,
                                  width: 90,
                                  child: Center(
                                    child:
                                    IconButton(
                                      iconSize: 70,
                                      alignment: Alignment.center,
                     //obx is used to change the state of the icon agr true to pause agr false to play
                                       icon: Obx(
                                        () => (notify.isIconPlay.value) ? Icon(
                                    Icons.pause_circle_filled,
                                    color: Colors.white,
                                  )
                                      : Icon(
                                    Icons.play_circle_filled,
                                    color: Colors.white,
                                  ),
                        ),
                                      onPressed: (){
                                        notify.isIconPlay.value = notify.isIconPlay.value ? false : true;
                                        if (notify.isIconPlay.value) {
                                          print("Playing .....");
                                          advancedPlayer.play(UrlSource(widget.audioURl));
                                        } else {
                                          print("Paused .....");
                                          advancedPlayer.pause();
                                        }
                                        AwesomeNotifications().createNotification(
                                            content:NotificationContent(
                                                id: 123,
                                                channelKey: "basic",
                                              title: 'Now playing- ${widget.name}',
                                              autoDismissible: false,
                                              displayOnBackground: true,
                                              payload: {"name":"FlutterCampus"},
                                            ),
                                          actionButtons: [
                                            NotificationActionButton(
                                                key:'play' ,
                                                label:'play',
                                              autoDismissible: false,
                                              showInCompactView: true,
                                                actionType: ActionType.KeepOnTop,
                                            ),
                                            NotificationActionButton(
                                              key:'pause' ,
                                              label:'pause',
                                              autoDismissible: false,
                                              showInCompactView: true,
                                              actionType: ActionType.KeepOnTop,
                                            ),
                                            NotificationActionButton(
                                              key:'stop' ,
                                              label:'stop',
                                              autoDismissible: false,
                                              showInCompactView: true,
                                              actionType: ActionType.KeepOnTop,
                                            ),
                                          ]);

                                      },
                                    ),
                                  ),
                        ),
                        InkWell(
                          onTap: (){},
                          child: Icon(
                            Icons.skip_next,
                            // LineIcons.ellipsis_v,
                            color: Colors.white,
                            size: 40,

                          ),
                        ),
                        Icon(
                          Icons.repeat,
                          // LineIcons.ellipsis_v,
                          color: Colors.grey.shade400,
                        ),
                      ],
                    ),
                  ),
  //new
                  SizedBox(height: 13,),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 22,right: 22),
                    child: Row(

                      children: [
                        Icon(
                         Icons.speaker_group_outlined,
                          color:  Colors.grey.shade400,
                        ),
                        Spacer(flex: 5,),
                        InkWell(
                          onTap: (){
                            Share.share("https://spotify/songid-234134");
                          },
                          child: Icon(
                            Icons.share_outlined,
                            color:  Colors.grey.shade400,
                           // size: 40,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.line_weight_sharp,
                          // LineIcons.ellipsis_v,
                          color: Colors.grey.shade400,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ),
    );
  }
}
