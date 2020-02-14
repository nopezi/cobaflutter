import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class BookedRoom extends StatelessWidget {
  Map data;
  Future <List> getData() async {
    final response = await http.get(Uri.encodeFull(
        'http://goonpro.id/pinru_v2/api/ruangan/sudah_terbooking'));
    if (response.statusCode == 200) {
      // data = json.decode(response.body);
      // return data['data'];
      return json.decode(response.body);
    } else {
      throw Exception('gagal ambil data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Center(
          child: Text('Rooms'),
        ),
        actions: <Widget>[
//          new Icon(Icons.search)
        ],
      ),
      body: new FutureBuilder<List>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? new Isitable(
                    list: snapshot.data,
                  )
                : new Center(
                    child: new CircularProgressIndicator(),
                  );
          }),
    );
  }
}

class Isitable extends StatelessWidget {
  final List list;
  Isitable({this.list});

  DataTable dataBody() {
    return DataTable(
      columns: [
        DataColumn(
            label: Text('Meeting Date'),
            numeric: false,
            tooltip: "Meeting Room"
        ),
        DataColumn(
          label: Text('Name'), 
          numeric: false, 
          tooltip: "Nama"
        ),
        // DataColumn(
        //     label: Text('Room'),
        //     numeric: false,
        //     tooltip: "Ruangan"
        // ),
        // DataColumn(
        //     label: Text('Time'),
        //     numeric: false,
        //     tooltip: "Waktu"
        // ),
      ],
      // rows: [
      //   DataRow(cells: [
      //     DataCell(Text(list[index]['tanggal'])),
      //     DataCell(Text(list[index]['nama_peminjam'])),
      //     DataCell(Text(list[index]['nama_ruangan'])),
      //     DataCell(Text("${list[index]['waktu_mulai']} - ${list[index]['waktu_selesai']}")),
      // ]),
      // DataRow(cells: [
      //   DataCell(Text('tes')),
      //   DataCell(Text('tes')),
      // DataCell(Text('tes')),
      // DataCell(Text('tes')),
      // ])
      rows: list
          .map(
            ((data) => DataRow(
              cells: <DataCell>[
                DataCell(Text(data['tanggal'])),
                DataCell(Text(data['nama_peminjam'])),
              ],
            )),
          )
          .toList(),
      sortColumnIndex: 0,
      sortAscending: true,
    );
  }

  badanBody() {
    return Center(
      // child: Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: dataBody(),
            ),
          )
        ],
      ),
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // return new ListView.builder(
    //   itemCount: list == null ? 0 : list.length,
    //   itemBuilder: (BuildContext context, int index){
    return badanBody();
    //   },
    // );
  }
}

class Isi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
        border: TableBorder.all(width: 1.0, color: Colors.black),
        children: [
          TableRow(children: [
            TableCell(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    new Text('Meeting Date'),
                    new Text('Name'),
                    new Text('Room'),
                  ]),
            )
          ])
        ]);
  }
}
