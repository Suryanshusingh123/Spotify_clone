

import 'package:awesome_notifications/awesome_notifications.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:spotify/premium/premium.dart';
import 'package:spotify/search/search.dart';
import 'package:spotify/utilities/notify.dart';
import 'package:get/get.dart';

import 'home/homepage.dart';
import 'llibrary/library.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  AwesomeNotifications().initialize(null,[
    NotificationChannel(
        channelKey: 'basic',
        channelName:'basic notification',
        channelDescription:'notification for playing/pausing music',
        importance:NotificationImportance.High,
      enableVibration: false,
      channelShowBadge: true,

    )
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Notify notify=Get.put(Notify());


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context)=> HomePage(),
          '/search': (context)=> Search(),
          '/library': (context)=> Library(),
          '/premium': (context)=> Premium(),

        }
    );
  }
}


