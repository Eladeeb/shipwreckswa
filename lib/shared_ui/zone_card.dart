import 'package:flutter/material.dart';
import 'package:shipwreckswa/models/zone.dart';

class ZoneCard extends StatelessWidget {
  TextStyle _zoneTitle , _wrecksCount ;

  double _paddingLeft  , _paddingRight ;

  Alignment _alignment ;
  MainAxisAlignment _mainAxisAlignment ;
  CrossAxisAlignment _crossAxisAlignment ;
  TextAlign _textAlign ;
  Zone _zone ;
  ZoneCard(this._zoneTitle, this._wrecksCount, this._paddingLeft,
      this._paddingRight, this._alignment, this._mainAxisAlignment,
      this._crossAxisAlignment, this._textAlign, this._zone);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Card(
        child: Container(
          padding: EdgeInsets.only(top:75 , bottom :75),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(this._zone.image),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding:  EdgeInsets.only(right: _paddingRight ,left: _paddingLeft),
            child: Align(
              alignment: _alignment,
              child: Column(
                mainAxisAlignment: _mainAxisAlignment,
                crossAxisAlignment: _crossAxisAlignment,
                children: <Widget>[
                  Text(this._zone.name,style: _zoneTitle,textAlign: _textAlign,),
                  Text('${this._zone.wreckCount} Wrecks',style: _wrecksCount,textAlign: _textAlign),

                ],
              ),
            ),
          ),
        ),
      ),
    );

  }

}
