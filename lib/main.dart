import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shipwreckswa/screens/zones_list.dart';
import 'onboarding/onboarding.dart';

void main() async{
  var pref = await SharedPreferences.getInstance();
  bool isSeen = pref.getBool('is_seen');
  Widget homePage = ZonesList();
  if(isSeen == null || !isSeen ){
    homePage=OnBoarding();
  }
  runApp(Shipwrecks(homePage) );
}
class Shipwrecks extends StatelessWidget {
  final Widget homePage ;

  Shipwrecks(this.homePage);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'zones' : (context) => ZonesList(),
        'onboarding' : (context) => OnBoarding(),
      },
      title: 'Shipwrecks WA',
      theme: ThemeData(
        primaryColor: Colors.blue.shade800,
      ),
      debugShowCheckedModeBanner: false,
      home: homePage,
    );
  }

}

