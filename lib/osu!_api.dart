import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<String> getData(String inputText) async{
  var response = await http.get(
    Uri.encodeFull("https://osu.ppy.sh/api/get_user?u="+ inputText +"&k=88177bbff34a296b417b893413fc408948d79fed")
    );

  List data = json.decode(response.body);
  if(data.length == 0) print("invalid username");
  else print(data[0]["username"]);
}