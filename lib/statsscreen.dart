import 'package:flutter/material.dart';

class StatsScreen extends StatelessWidget{

  List _playerData;

  StatsScreen(this._playerData);

  Widget build(BuildContext context){
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Stats"),
        centerTitle: true,
        backgroundColor: Color(0xffED5DA1),
        elevation: 0.0,
      ),
      backgroundColor: Color(0xff212121),
      body: ListView(
        children: <Widget>[
          Container(
            height: screenHeight/2.5,
            decoration: BoxDecoration(
              color: Color(0xffED5DA1),
              boxShadow: [BoxShadow(
                color: Colors.black,
                offset: Offset(0.0, 7.0),
                blurRadius: 5.0,
              )],
            ),
          )
        ],
      ),
    );
  }
}