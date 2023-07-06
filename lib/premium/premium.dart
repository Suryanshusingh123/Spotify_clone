import 'package:flutter/material.dart';
import 'package:spotify/premium/widgets/currentplan.dart';
import 'package:spotify/premium/widgets/premiumplan.dart';

import '../bottomnavigation.dart';
import 'widgets/buttons.dart';
import 'widgets/carousesl.dart';

class Premium extends StatelessWidget {
  const Premium({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(18,18 ,18 ,50 ),
        body: ListView(
          children:  [
            SizedBox(height: 70,),
            Text(
              "Get 9 monthd of \n premium for ₹100",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            Cards(),
            Buttons(text:'GET PREMIUM'),
            const SizedBox(height: 10),
            const Text(
              'Terms and conditions apply. Open only to users who aren\'t subscribed to a recurring Premium plan and who haven\'t purchased a 12-month one-time Premium plan at a promotional price. Offer ends 8/15/21.',
              style: TextStyle(
                color: Color.fromRGBO(184, 184, 184, 10),
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
            CurrentPlan(),
            PremiumPlan(),
          ],
        ),
        bottomNavigationBar: BottomBar(3),
      ),
    );
  }
}
