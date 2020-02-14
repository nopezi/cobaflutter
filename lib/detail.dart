import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({this.index,this.list});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("${widget.list[widget.index]['nama_ruangan']}"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: new Container(
        padding: const EdgeInsets.all(10.0),
        child: new Card(
          child: new Column(
            children: <Widget>[
              // new Text(widget.list[widget.index]['nama_ruangan'], style: new TextStyle(fontSize: 20.0),),
              // new Container(
                // margin: const EdgeInsets.all(10.0),
                
                new Image.network('${widget.list[widget.index]['foto'][0]}'),
                new Text("Fasilitas : ${widget.list[widget.index]['fasilitas']}", style: new TextStyle(fontSize: 15.0),),
                new Text("Keterangan : ${widget.list[widget.index]['keterangan']}", style: new TextStyle(fontSize: 15.0),),
                new Padding(padding: const EdgeInsets.only(top: 300.0, left: 2000.0),),
                // new Margin(margin: const EdgeInsets.all(10.0)),
              // )

              // new Row(
              //   children: <Widget>[
              //     new RaisedButton(
              //       child: new Text("Edit"),
              //       color: Colors.green,
              //       onPressed: (){},
              //     ),
              //     new RaisedButton(
              //       child: new Text("Delete"),
              //       color: Colors.red,
              //       onPressed: (){},
              //     )
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}