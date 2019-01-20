import 'package:flutter/material.dart';
import 'background.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'statsscreen.dart';


GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


class HomeScreen extends StatefulWidget{

  List _retrievedData;

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
      key: _scaffoldKey,
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
                    padding: EdgeInsets.only(right: 20.0,left: 20.0),
                    child: TextField(
                      cursorColor: Color(0xffED5DA1),
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
                    onPressed: () => setState(
                      (){
                        FocusScope.of(context).requestFocus(FocusNode());
                        submission(screenWidth,screenHeight);
                      }
                    ),
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

  //data retiriever
  Future<void> getPlayerData(String inputText) async{

    var response = await http.get(
      Uri.encodeFull("https://osu.ppy.sh/api/get_user?u="+ inputText +"&k=88177bbff34a296b417b893413fc408948d79fed")
      );

     widget._retrievedData = json.decode(response.body);
  }

  //submission
  void submission(var screenWidth,var screenHeight){               
      _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        backgroundColor: Color(0xffED5DA1),
        duration: Duration(seconds: 4),
        content:Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            LinearProgressIndicator(
              backgroundColor: Color(0xff212121),
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
            Divider(
              height: screenHeight/26,
              color: Colors.transparent,
            ),
            Text("Fetching Data",style:TextStyle(fontFamily: "Aller",fontSize: 23.0,fontWeight: FontWeight.w400))
          ],
        ),
        ),
    );
    getPlayerData(myController.text)
      .whenComplete((){
        _scaffoldKey.currentState.hideCurrentSnackBar();
        if(widget._retrievedData.length == 0){
          showDialog(context: context, 
          builder: (BuildContext context) => Theme(
            data: ThemeData(
              dialogBackgroundColor: Color(0xffED5DA1),
            ),
            child: AlertDialog(
              title: Text("Error code 1",style:TextStyle(fontFamily: "Aller",fontSize: 18.0,fontWeight: FontWeight.w400,color: Colors.white)),
              content: Text("Enter a valid username.",style:TextStyle(fontFamily: "Aller",fontSize: 14.0,fontWeight: FontWeight.w400,color: Colors.white)),
            ),
          )
        );
          return;
        }
        
        if(widget._retrievedData[0]["playcount"] == null){
          showDialog(context: context, 
          builder: (BuildContext context) => Theme(
            data: ThemeData(
              dialogBackgroundColor: Color(0xffED5DA1),
            ),
            child: AlertDialog(
              title: Text("Error code 2",style:TextStyle(fontFamily: "Aller",fontSize: 18.0,fontWeight: FontWeight.w400,color: Colors.white)),
              content: Text("Insuffcient data. Player didn't play before.",style:TextStyle(fontFamily: "Aller",fontSize: 14.0,fontWeight: FontWeight.w400,color: Colors.white)),
            ),
          )
        );
          return;
        }

        Navigator.push(context, MaterialPageRoute(builder: (context) => StatsScreen(widget._retrievedData[0])));
      });
  }
}