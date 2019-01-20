import 'package:flutter/material.dart';

class Background extends StatelessWidget{

  //variables
  Color _inputColor;

  //constructor
  Background(this._inputColor);

  @override
  Widget build(BuildContext context){
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return ListView(
      scrollDirection: Axis.vertical,
      physics: ScrollPhysics(),
      children: <Widget>[
        Stack(
      children: <Widget>[
        Container(
          width: screenWidth,
          height: screenHeight/1.57,
          decoration:BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(bottomLeft:Radius.circular(screenWidth)),
          ),
        ),

        Align(
          alignment: Alignment(1.0, -1.0),
          child: Container(
            width: screenWidth/1.07,
            height: screenHeight/1.7,
            decoration:BoxDecoration(
              color: _inputColor,
              borderRadius: BorderRadius.only(bottomLeft:Radius.circular(screenWidth)),
            ),
            child:Padding(
              padding: EdgeInsets.only(left: screenWidth/3.7,top: screenHeight/12),
              child: Text("osu!",style:TextStyle(fontFamily: "Aller",fontSize: (screenHeight+screenWidth)/9,color: Colors.white)),
            ),
          ),
        ),
      ],
    ),
      ],
    );
  }

}