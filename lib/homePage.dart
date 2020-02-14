import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import './ruangan.dart';
// import './cariBooking.dart';
import './rowHalamanHome.dart';
import './bookedRoom.dart';
import 'content/booking.dart';
// void main() => runApp(MyApp());

void main() {
  runApp(new MaterialApp(
    // icon: Image.asset('images/mrobj-edit.png'),
    title: "MR OBJ",
    theme: ThemeData(fontFamily: 'RobotoMono'),
    debugShowCheckedModeBanner: false,
    home: new HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  static final List<String> imgSlider = [
    '1.jpg',
    '2.jpg',
    '3.jpg',
    '4.jpg',
    '5.jpg'
  ];

  final CarouselSlider autoPlayImage = CarouselSlider(
    items: imgSlider.map((fileImage) {
      return Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Image.asset(
            'images/slider/${fileImage}',
            width: 10000,
            fit: BoxFit.cover,
          ),
        ),
      );
    }).toList(),
    height: 150,
    autoPlay: true,
    enlargeCenterPage: true,
    aspectRatio: 2.0,
  );

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: Center(
        child: Container(
          margin: EdgeInsets.only(top: 25.0),
          // child: Text(
          //   'MR OBJ',
          //   style: TextStyle(
          //     fontSize: 20.0,
          //     fontFamily: 'RobotoMono',
          //     color: Colors.lightBlueAccent,
          //   ),
          // ),
          child: Column(
            children: [
              new CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 28.0,
                child: Image.asset(
                  'images/mrobj-edit.png',
                  width: 40,
                ),
              ),
              new Text(
                'MR OBJ',
                // 'Meeting Reservation Online Booking Jogja',
                style: TextStyle(
                  fontSize: 15.0,
                  fontFamily: 'RobotoMono',
                  color: Colors.lightBlueAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: new Scaffold(
          body: TabBarView(
            children: <Widget>[
              new Container(
                color: Colors.white,
                child: Center(
                    child: ListView(
                  shrinkWrap: false,
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  children: <Widget>[
                    logo,
                    // RowPertama(),
                    autoPlayImage,
                    Utama(),
                  ],
                )
                ),
              ),
              new Container(
                child: BookedRoom(),
              ),
              new Container(
                child: HalamanRuangan(),
              ),
            ],
          ),
          bottomNavigationBar: new TabBar(
            tabs: [
              Tab(
                icon: new Icon(Icons.home),
                // radius: 28.0,
                text: 'Home',
                ),
              Tab(
                icon: new Icon(Icons.info),
                // text: 'Booked Room',
                text: 'Meeting Rule',
              ),
              Tab(
                icon: new Icon(Icons.room),
                text: 'Rooms',
              ),
            ],
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey[600],
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Colors.blue,
          ),
          backgroundColor: Colors.lightBlue[50],
        )
      )
    );
  }
}


class Utama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: new Card(
                elevation:3,
                // margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  margin: EdgeInsets.all(30.0),
                  // padding: EdgeInsets.only(right: 1000.0),
                  alignment: Alignment.center,
                  height: 50,
                  // width: 1000,
                  child: ListTile(
                    title: Center(
                      child: new GestureDetector(
                        onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) => new HalamanRuangan()
                        )),
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.room_service),
                            Text(
                              "Booking",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black87,
                                  fontFamily: 'RobotoMono'
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: new Card(
                elevation:3,
                // margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  margin: EdgeInsets.all(30.0),
                  // padding: EdgeInsets.only(right: 1000.0),
                  alignment: Alignment.center,
                  height: 50,
                  // width: 1000,
                  child: ListTile(
                    title: Center(
                      child: new GestureDetector(
                        onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) => new HalamanRuangan()
                        )),
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.live_help),
                            Text(
                              "Live Booking",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black87,
                                  fontFamily: 'RobotoMono'
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: new Card(
                elevation:3,
                // margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  margin: EdgeInsets.all(30.0),
                  // padding: EdgeInsets.only(right: 1000.0),
                  alignment: Alignment.center,
                  height: 50,
                  // width: 1000,
                  child: ListTile(
                    title: Center(
                      child: new GestureDetector(
                        onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) => new HalamanRuangan()
                        )),
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.contacts),
                            Text(
                              "Contact",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black87,
                                  fontFamily: 'RobotoMono'
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: new Card(
                elevation:3,
                // margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  margin: EdgeInsets.all(30.0),
                  // padding: EdgeInsets.only(right: 1000.0),
                  alignment: Alignment.center,
                  height: 50,
                  child: ListTile(
                    title: Center(
                      child: new GestureDetector(
                        onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) => new HalamanRuangan()
                        )),
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.live_tv),
                            Text(
                              "Tutorial",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black87,
                                  fontFamily: 'RobotoMono'
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}