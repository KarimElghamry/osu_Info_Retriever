import 'package:flutter/material.dart';
import 'charts.dart';

class StatsScreen extends StatelessWidget{

  var _playerData;
  StatsScreen(this._playerData);

  Widget build(BuildContext context){
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Stats",style:TextStyle(fontFamily: "Aller",fontSize: 23.0,fontWeight: FontWeight.w400)),
        centerTitle: true,
        backgroundColor: Color(0xffED5DA1),
        elevation: 0.0,
      ),
      backgroundColor: Color(0xff212121),
      body: ListView(
        children: <Widget>[
          Container(
            height: screenHeight/3.5,
            decoration: BoxDecoration(
              color: Color(0xffED5DA1),
              boxShadow: [BoxShadow(
                color: Colors.black,
                offset: Offset(0.0, 7.0),
                blurRadius: 5.0,
              )],
            ),

            child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(10.0),
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 1.5,
                crossAxisCount: 3,
                children: <Widget>[
                  statDisplay(_playerData["username"], "Username"),
                  statDisplay(_playerData["playcount"], "Play Count"),
                  statDisplay(int.parse(_playerData["pp_rank"]).toString(), "PP Rank"),
                  statDisplay(double.parse(_playerData["accuracy"]).ceil().toString() + "%", "Accuracy"),
                  statDisplay(_playerData["count_rank_ss"], "SS Plays"),
                  statDisplay(_playerData["pp_raw"], "Raw PP"),
                ],
            ),
          ),


          Divider(
            height: 13.0,
            color: Colors.transparent,
          ),


          HitCountPage(_playerData),

          Divider(
            height: 30.0,
            color: Colors.transparent,
          ),

        ],
      ),
    );
  }
}

Widget Legend(Color inputColor,String inputText){

    return Row(
      children: <Widget>[
        Container(
          height: 25.0,
          width: 25.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(color: Colors.white,width: 2.0),
            color: inputColor,
          ),
        ),

        Padding(
          padding: EdgeInsets.only(left: 15.0),

          child: Text(
          inputText,
          style:TextStyle(fontFamily: "Aller",fontSize: 16.0,fontWeight: FontWeight.w400,color: Colors.white)
        ),
        ),
      ],
    );
}

Widget statDisplay(String inputData,String dataTitle){
  return Container(
    decoration: BoxDecoration(
      color: Colors.transparent,
      border: Border.all(color: Colors.white,width: 2.0),
      borderRadius: BorderRadius.circular(10.0),
    ),

    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(dataTitle,style:TextStyle(fontFamily: "Aller",fontSize: 14.0,fontWeight: FontWeight.w400,color: Colors.white)),

          Text(inputData,style:TextStyle(fontFamily: "Aller",fontSize: 12.0,fontWeight: FontWeight.w400,color: Colors.white)),
        ],
      )
    ),
  );
}

Widget HitCountPage(var _playerData){
  return Column(
    children: <Widget>[
      Center(
            child: Text(
            "Hit Count",
            style:TextStyle(fontFamily: "Aller",fontSize: 28.0,fontWeight: FontWeight.w400,color: Colors.white)
              ),
          ),

          Container(
            child: HitCountChart(_playerData),
          ),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Legend(Color(0xffED5DA1), "300s"),
              Legend(Color(0xff168A94), "100s"),
              Legend(Color(0xffBFD8D1), "50s"),
            ],
          ),
    ],
  );
}