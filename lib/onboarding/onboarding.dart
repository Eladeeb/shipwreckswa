import 'package:shared_preferences/shared_preferences.dart';
import 'package:shipwreckswa/models/walkthrough.dart';
import 'package:flutter/material.dart';
class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<WalkThrough> screens =[
    WalkThrough('Welcome..!','Welcome to Shipwrecks App, your Wrecks info source','assets/images/onboarding.jpg'),
    WalkThrough('Geolocation','See all Wrecks on map','assets/images/onboarding1.jpg'),
    WalkThrough('Favourites','Save your favourites Wrecks in your own list','assets/images/onboarding2.jpg'),

  ];
  PageController _pageController ;
  int currentIndex =0 ;
  bool lastPage = false ;

  @override
  void initState() {
    super.initState();
    _pageController =PageController(
      initialPage: 0,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        PageView.builder(
          controller: _pageController,
          itemCount: screens.length,
          itemBuilder: (context,index){
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: ExactAssetImage(screens[index].image),
                fit: BoxFit.cover)
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation:  0,
                ),
                body:Padding(
                  padding: const EdgeInsets.only(right :60 , left: 60 , bottom:  385),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(screens[index].title,style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 32
                        ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(screens[index].description,style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22
                        ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                ),

              ),
            );
          },
          onPageChanged: (int position){
            setState(() {
              currentIndex = position ;
              if(currentIndex == screens.length-1){
                lastPage = true ;
              }else{lastPage = false;
              }
            });
          },

        ),
        Transform.translate(
          offset: Offset(120,250),
          child: Container(
            child: Row(
              children:_drawDots(screens.length),

            ),
          ),
        ),
        (lastPage)?_showButton():Container(),
      ],
    );

  }
  Widget _showButton(){
    return Container(
      child: Transform.translate(
        offset: Offset(18,500),
        child: SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width*.90,
          child: RaisedButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            color: Colors.blue,
            onPressed: ()async{
              var pref = await SharedPreferences.getInstance();
              pref.setBool('is_seen', true);
              Navigator.of(context).pushNamed('zones');
            },
            child: Text(
              "START",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  letterSpacing: 3
              ),
            ),

          ),
        ),
      ),
    );
  }
  List<Widget> _drawDots(int qty){
    List<Widget> widgets =[];
    for(int i =0 ;i<qty;i++)
    {
      widgets.add(
        Padding(
          padding: const EdgeInsets.only(right: 5,left: 5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: ((i == currentIndex)? Colors.blue : Colors.grey.shade400),
            ),
            width: 30,
            height: 7,
          ),
        ),
      );
    }
    return widgets ;
  }
}
