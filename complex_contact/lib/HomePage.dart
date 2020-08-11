import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  List listOf;
  Home(this.listOf);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<MaterialColor>_color=[Colors.green,Colors.brown,Colors.indigo,Colors.red,Colors.brown,Colors.purple,Colors.orange,Colors.amber,Colors.pink,Colors.red];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Complex Data Passing"),
        backgroundColor: Colors.indigo,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.search),
              onPressed: ()=>debugPrint("Search")),

          new IconButton(
              icon: new Icon(Icons.title),
              onPressed: ()=>debugPrint("Title")),
        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height:MediaQuery.of(context).size.height,
            margin: EdgeInsets.all(10.0),
            child: ListView.builder(
                itemCount: widget.listOf.length,
              itemBuilder: (BuildContext c,int index){
                  MaterialColor mcolor= _color[index % _color.length];
                  return Card(
                    elevation: 10.0,
                    margin: EdgeInsets.all(10.0),
                    child: new Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new CircleAvatar(
                            child: new Text(widget.listOf[index]['id'].toString()[0]),
                            backgroundColor: mcolor,
                            foregroundColor: Colors.white,
                          ),
                        ),
                        new Container(
                          width: 200.0,
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text("Name : "+widget.listOf[index]['name'],
                            style: TextStyle(fontSize: 17.0),),
                              new SizedBox(height: 4.0,),
                              new Text("UserName : "+widget.listOf[index]['username'],
                                style: TextStyle(fontSize: 17.0),),
                              new SizedBox(height: 4.0,),
                              new Text("Email : "+widget.listOf[index]['email'],
                                style: TextStyle(fontSize: 17.0),),
                              new SizedBox(height: 4.0,),
                              new Text("Address Street : "+widget.listOf[index]['address']['street'],
                                style: TextStyle(fontSize: 17.0),),
                              new SizedBox(height: 4.0,),
                              new Text("Suite : "+widget.listOf[index]['address']['suite'],
                                style: TextStyle(fontSize: 17.0),),
                              new SizedBox(height: 4.0,),
                              new Text("City : "+widget.listOf[index]['address']['city'],
                                style: TextStyle(fontSize: 17.0),),
                              new SizedBox(height: 4.0,),
                              new Text("Zipcode : "+widget.listOf[index]['address']['zipcode'],
                                style: TextStyle(fontSize: 17.0),),
                              new SizedBox(height: 4.0,),
                              new Text("Geo latitude : "+widget.listOf[index]['address']['geo']['lat'],
                                style: TextStyle(fontSize: 17.0),),
                              new SizedBox(height: 4.0,),
                              new Text("Geo langitutde : "+widget.listOf[index]['address']['geo']['lng'],
                                style: TextStyle(fontSize: 17.0),),

                              new SizedBox(height: 4.0,),
                              new Text("PhoneNumber : "+widget.listOf[index]['phone'],
                                style: TextStyle(fontSize: 17.0),),
                              new SizedBox(height: 4.0,),
                              new Text("Website : "+widget.listOf[index]['website'],
                                style: TextStyle(fontSize: 17.0),),
                              new SizedBox(height: 4.0,),
                              new Text("Company name :"+widget.listOf[index]['company']['name'],
                                style: TextStyle(fontSize: 17.0),),
                              new SizedBox(height: 4.0,),
                              new Text("Company CatchPhrase :"+widget.listOf[index]['company']['catchPhrase'],
                                maxLines: 2,
                                style: TextStyle(fontSize: 17.0),),
                              new SizedBox(height: 4.0,),
                              new Text("Company bs :"+widget.listOf[index]['company']['bs'],
                                style: TextStyle(fontSize: 17.0),),





                            ],
                          ),
                        )
                      ],
                    ),
                  );
              },
            ),
          )
        ],
      ),
    );
  }
}
