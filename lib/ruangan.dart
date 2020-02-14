import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import './detail.dart';
//import 'package:url_launcher/url_launcher.dart';

// void main() {
//   runApp(new MaterialApp(
//     title: "MR OBJ",
//     home: new DemoPage(),
//   ));
// }

//class DemoPage extends StatelessWidget {
//  launchURL() {
//    launch('https://flutter.dev');
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Center(
//        child: RaisedButton(
//          onPressed: launchURL,
//          child: Text('Show Flutter homepage'),
//        ),
//      ),
//    );
//  }
//}


class HalamanRuangan extends StatelessWidget {
  Future<List> getData() async {
    final response= await http.get(Uri.encodeFull('http://goonpro.id/pinru_v2/api/ruangan'));
    if (response.statusCode == 200){
      return json.decode(response.body);
    }else{
      throw Exception('gagal ambil data');
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.lightBlueAccent,
//        leading: new Icon(Icons.home),
        // title: new Center(child: new Text("Ruangan"),),
        title: Center(
          child: Text('Rooms'),
        ),
        actions: <Widget>[
//          new Icon(Icons.search)
        ],
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot){
          if(snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? new ItemList(list: snapshot.data,)
              : new Center(child: new CircularProgressIndicator(),);
        }
      ),
    );
  }
}


class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: list==null ? 0 : list.length,
        itemBuilder: (context, i){
          return new Container(
            padding: const EdgeInsets.all(10.0),
            child: new GestureDetector(
              onTap: ()=>Navigator.of(context).push(
                new MaterialPageRoute(
                  builder: (BuildContext context)=> new Detail(
                    list: list,
                    index: i,
                  )
                )
              ),
              child: new Card(
                child: new ListTile(
                  title: new Text(list[i]['nama_ruangan']),
                  // leading: new Icon(Icons.widgets),
                  leading: Image.network('${list[i]['foto'][0]}'),
                  subtitle: new Text("Kapasitas : ${list[i]['kapasitas']} Participants"),
                ),
            ),
            ),
          );
        },

    );
  }

}

