import 'package:flutter/material.dart';
import 'package:shipwreckswa/models/zone.dart';
import 'package:shipwreckswa/util/app_bar.dart';

class WrecksList extends StatefulWidget {
  @override
  _WrecksListState createState() => _WrecksListState();
  Zone zone ;

  WrecksList(this.zone);

}

class _WrecksListState extends State<WrecksList> {
  ShipWrecksAppBar shipWrecksAppBar = ShipWrecksAppBar() ;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: shipWrecksAppBar.box ,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: ShipWrecksAppBar().build(context),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.grey.shade50,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10 , bottom: 8),
                child: Align(
                  alignment: Alignment.topCenter,
                    child: Text(widget.zone.name,style:
                    TextStyle(
                        color: Colors.blue.shade900,
                        fontSize: 28 ,
                        fontWeight: FontWeight.bold

                    ),
                    ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemBuilder: (context,index){
                      return Card(
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: ExactAssetImage('assets/images/onboarding1.jpg'),
                                          fit: BoxFit.cover,),
                                        shape: BoxShape.circle
                                      ),
                                      margin: EdgeInsets.only(right: 10),
                                    ),
                                     Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text("dsfg"),
                                            Text("adsfg"),
                                          ],
                                        ),
                                      ),

                                    IconButton(
                                        icon: Icon(Icons.favorite,color: Colors.grey.shade400,),
                                        onPressed: (){
                                          
                                        }
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 16, left: 16,bottom: 5),
                                child: Text('sdfghjkjhgfdsauiuytrewqwertyuiytrewertyubb          erty'),
                              ),
                              Container(
                                height: 180,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: ExactAssetImage('assets/images/onboarding1.jpg'),
                                      fit: BoxFit.cover,),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                margin: EdgeInsets.only(right: 10,left: 10,top:5 ,bottom: 5),
                              ),


                            ],
                          ),
                        ),
                      );
              },
                  itemCount: 6,
              ),
              ),
            ],
          ),
        ),
      ),
    );
    
  }
}
