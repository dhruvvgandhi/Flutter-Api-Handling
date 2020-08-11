import 'package:flutter/material.dart';
import 'Model/Data.dart';

class Detail extends StatefulWidget {
  Data data;
  Detail(this.data);
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Detail Page"),
        backgroundColor: Colors.green,
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            margin: EdgeInsets.all(10.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[

                new Image.network(
                  widget.data.url,
                  height: 250.0,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                new SizedBox(height: 10.0,),
                 new Container(
                   child: new Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: <Widget>[
                       new Expanded(
                         flex: 1,
                         child: new CircleAvatar(
                           child: new Text(widget.data.id.toString()),
                         ),
                       ),
                       new SizedBox(height: 7.0,),
                       new Expanded(
                         flex: 2,
                         child:new Text(widget.data.title),
                       )
                     ],
                   ),
                 )

              ],
            ),
          )
        ],
      ),
    );
  }
}
