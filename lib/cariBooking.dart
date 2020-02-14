import 'package:flutter/material.dart';

class BookedRoom extends StatefulWidget {
  @override
  _BookedRoomState createState() => _BookedRoomState();
}

class _BookedRoomState extends State<BookedRoom> {
  @override
  Widget build(BuildContext context) {

    final form = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Cari',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    return Scaffold(
      appBar: new AppBar(
        title: Text('Cari Ruangan')
      ),
      body: Center(
        child: ListView(
          // shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            SizedBox(height: 48.0,),
            form
          ],
        ),
      ),
    );
  }
}