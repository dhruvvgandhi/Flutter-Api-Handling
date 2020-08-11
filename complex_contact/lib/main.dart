import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
void main() async{
  List listOf=await getAllData();
  runApp(new MyApp(listOf));
}
class MyApp extends StatelessWidget {
  List listOf;
  MyApp(this.listOf);
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: Home(listOf),
    );
  }
}
Future<List>getAllData() async{
  var api="https://jsonplaceholder.typicode.com/users";
  var data=await http.get(api);
  var jsonData=json.decode(data.body);
  return jsonData;
}