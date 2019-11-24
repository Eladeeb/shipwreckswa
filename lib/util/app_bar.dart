import 'package:flutter/material.dart';
class ShipWrecksAppBar extends StatelessWidget {
  BoxDecoration box =  BoxDecoration(
      image: DecorationImage(
          image: ExactAssetImage(
              'assets/images/onboarding5.jpg'
          ),
          fit: BoxFit.cover)
  );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Transform.translate(
          offset: Offset(-10,0),
          child: Image(image: ExactAssetImage('assets/images/onboarding6.png'),)),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }



}
