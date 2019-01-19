import 'package:flutter/material.dart';
import 'background.dart';
import 'osu!_api.dart';


class HomeScreen extends StatefulWidget{

  createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  @override
  final myController = TextEditingController();
  void dispose() {
  myController.dispose();
  super.dispose();
  }


  @override
  Widget build(BuildContext context){
    //screen aspects
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    //widgets
    return Scaffold(
      backgroundColor: Color(0xff212121),
      body: Stack(
        children: <Widget>[
          //background
          Background(Color(0xffED5DA1)),
          

          //float widget
          Center(
            child: Container(
              height: screenHeight/3.7,
              width: screenWidth/1.3,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0.0, 3.0),
                    blurRadius: 10.0,
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 16.0,left: 16.0),
                    child: TextField(
                      controller: myController,
                      decoration: InputDecoration(
                      hintText: 'Enter your username',
                      ),
                    ),
                  ),

                  Divider(
                    height: screenHeight/14,
                    color: Colors.transparent,
                  ),

                  ButtonTheme(
                  height: screenHeight/11,
                  child: RaisedButton(
                    highlightColor: Color(0xffED5DA1),
                    splashColor: Color(0xffED5DA1),
                    color: Colors.grey[800],
                    textColor: Colors.white,
                    elevation: 0.0,
                    onPressed: () => getData(myController.text),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0),bottomRight:Radius.circular(10.0)),
                    ),
                    child: Text("Submit",style:TextStyle(fontFamily: "Aller",fontSize: 23.0,fontWeight: FontWeight.w400)),
                    ),
                  ),
                ],
                ),
                ),
              ),
        ],
      ),
    );
  }
}