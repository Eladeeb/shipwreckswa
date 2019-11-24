import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shipwreckswa/api/zones.dart';
import 'package:shipwreckswa/models/zone.dart' as prefix0;
import 'package:shipwreckswa/screens/wrecks_list.dart';
import 'package:shipwreckswa/shared_ui/zone_card.dart';
import 'package:shipwreckswa/util/app_bar.dart';

class ZonesList extends StatefulWidget {
  @override
  _ZonesListState createState() => _ZonesListState();
}

class _ZonesListState extends State<ZonesList> {

  List<Zone> zones ;
  Zones zonesApi = Zones();

  @override
  void initState() {
    super.initState();
    zonesApi.getZones() ;
  }


  TextStyle _zoneTitle = TextStyle(
      color: Colors.blue.shade900,
      fontSize: 28 ,
      fontWeight: FontWeight.bold

  );
  TextStyle _wrecksCount = TextStyle(
    color: Colors.grey.shade600,
    fontWeight: FontWeight.bold,
    fontSize: 22,
  );

  double _paddingLeft =0 ;
  double _paddingRight = 24;

  Alignment _alignment = Alignment.centerRight ;
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.end;
  CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.end;
  TextAlign _textAlign = TextAlign.right ;

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: ExactAssetImage(
                  'assets/images/onboarding5.jpg'
              ),
              fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar:ShipWrecksAppBar().build(context),
        drawer: Drawer(),
        body: Container(
          color: Colors.grey.shade50,
          child: FutureBuilder(
            future: zonesApi.getZones(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Align(
                  alignment: Alignment.center,
                  child: Center(
                    //replace this with a loading icon
                      child: new CircularProgressIndicator()),
                );
              }else{
                List<prefix0.Zone> count = snapshot.data ;
                return ListView.builder(
                  itemBuilder:(context , index){

                    if (index %2 ==0)
                    {

                      _paddingLeft =0 ;
                      _paddingRight = 24;

                      _alignment = Alignment.centerRight ;
                      _mainAxisAlignment = MainAxisAlignment.end;
                      _crossAxisAlignment = CrossAxisAlignment.end;
                      _textAlign = TextAlign.right ;
                    }else{
                      _paddingLeft =24 ;
                      _paddingRight = 0;

                      _alignment = Alignment.centerLeft;
                      _mainAxisAlignment = MainAxisAlignment.start;
                      _crossAxisAlignment = CrossAxisAlignment.start;
                      _textAlign = TextAlign.left ;
                    }
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                          MaterialPageRoute(builder: (context) => WrecksList(snapshot.data[index]))
                        );
                      },
                        child: ZoneCard(_zoneTitle, _wrecksCount, _paddingLeft, _paddingRight, _alignment, _mainAxisAlignment, _crossAxisAlignment, _textAlign,snapshot.data[index]));
                  },
                  itemCount:  count.length,
                );
              }

            }
          ),
        ),
      ),
    );

  }


}
