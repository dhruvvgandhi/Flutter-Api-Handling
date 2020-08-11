import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'Model/Data.dart';
import 'DetailPage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<MaterialColor>_color=[Colors.deepOrange,Colors.red,Colors.green,Colors.purple,Colors.brown];

  Future<List<Data>> getAllData() async{
     var api ="https://jsonplaceholder.typicode.com/photos";
     var data=await http.get(api);

     var jsonData=json.decode(data.body);
     List<Data>listof=[];
     for(var i in jsonData){
       Data data=new Data(i["id"],i["title"],i["url"], i["thubnailUrl"]);
       listof.add(data);
     }
     return listof;
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("api"),
        backgroundColor: Colors.deepOrange,
        actions: <Widget>[

          new IconButton
            (icon: new Icon(Icons.search),
              onPressed: ()=>debugPrint("Search")
          ),
          new IconButton
            (icon: new Icon(Icons.add),
              onPressed: ()=>debugPrint("Add")
          )
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("CodeWith Dhruv"),
                accountEmail: new Text ("Dhruv.vimeshkumar.gandhi@gmail.com"),
                decoration: new BoxDecoration(
                  color: Colors.deepOrange
                ),
             ),
            new ListTile(
              title: new Text("First Page"),
              //leading for front side / and trailing for back part
              leading: new Icon(Icons.search,color: Colors.orange,),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),
            new ListTile(
              title: new Text("Second Page"),
              leading: new Icon(Icons.add,color: Colors.red,),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),
            new ListTile(
              title: new Text("Third Page"),
              leading: new Icon(Icons.title,color: Colors.purple,),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),
            new ListTile(
              title: new Text("Fourth Page"),
              leading: new Icon(Icons.list,color: Colors.green,),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),
            new Divider(
              height: 15.0,
            ),
            new ListTile(
              title: new Text("close"),
              leading: new Icon(Icons.close,color: Colors.red,),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            margin:EdgeInsets.all(10.0),
            height: 250.0,
            child:new FutureBuilder(
              future: getAllData(),
              builder:(BuildContext c,AsyncSnapshot snapshot){
                if(snapshot.data==null){
                  return Center(
                    child: new Text("Loading Data....."),
                  );
                }
                else{
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    scrollDirection:Axis.horizontal,
                    itemBuilder: (BuildContext c,int index){
                      MaterialColor mColor=_color[index % _color.length];
                      return Card(
                        elevation:10.0,
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:<Widget>[
                             new Image.network(snapshot.data[index].url,
                               height: 150.0,
                               width: 150.0,
                               fit:BoxFit.cover,
                             ),
                            new SizedBox(height:7.0,),
                            new Container(
                              margin:EdgeInsets.all(6.0),
                              height: 50.0,
                              child:new Row(
                                children: <Widget>[
                                  new Container(
                                    child:new CircleAvatar(
                                      child: new Text(snapshot.data[index].id.toString()),
                                      backgroundColor: mColor,
                                      foregroundColor: Colors.white,
                                    ),
                                  ),
                                  new SizedBox(
                                    width: 6.0,
                                  ),
                                  new Container(
                                    width: 80.0,
                                    child: InkWell(
                                      child: new Text(snapshot.data[index].title,
                                      maxLines: 1,
                                          style:TextStyle(
                                            color: Colors.deepOrange
                                          )
                                      ),
                                      onTap: (){
                                        Navigator.of(context).push(new MaterialPageRoute(builder:(BuildContext c)=>Detail(snapshot.data[index])));
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }
                  );
                }
              }
            ),
          ),
          new SizedBox(height: 7.0,),
          new Container(
            margin:EdgeInsets.all(10.0) ,
            height: MediaQuery.of(context).size.height,
            child: new FutureBuilder(
                future: getAllData(),
              builder: (BuildContext c,AsyncSnapshot snapshot){
                if(snapshot.data==null){
                  return Center(
                    child: new Text("Loading Data....."),
                  );
                }
                else{
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder:(BuildContext c,int index) {
                        MaterialColor mColor = _color[index % _color.length];
                        return Card(
                          elevation: 7.0,
                          child: Container(
                            height: 80.0,
                            child: new Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Expanded(
                                  flex: 1,
                                  child: new Image.network(
                                      snapshot.data[index].url,
                                      height: 80.0,
                                      fit: BoxFit.cover,
                                    ),
                                ),
                                new SizedBox(width: 7.0,),
                                new Expanded(
                                  flex: 2,
                                      child: InkWell(
                                        child: new Text(
                                        snapshot.data[index].title,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 17.0
                                        ),
                                    ),
                                        onTap: (){
                                          Navigator.of(context).push(new MaterialPageRoute(builder:(BuildContext c)=>Detail(snapshot.data[index])));
                                        },
                                      ),
                                ),
                                new Expanded(
                                  flex: 1,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: CircleAvatar(
                                      child: new Text(
                                          snapshot.data[index].id.toString()),
                                      backgroundColor: mColor,
                                      foregroundColor: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    );
                }
              }
            ),
          ),
        ],
      ),
    );
  }
}
