import 'package:flutter/material.dart';
import './ruangan.dart';
import './cariBooking.dart';

class RowPertama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: new GestureDetector(
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new HalamanRuangan())),
                child: Text("Booking Room",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'RobotoMono')),
              ),
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.only(right: 1.0),
              alignment: Alignment.center,
              // width: 500,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.green,
                // border: Border.all(),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: new GestureDetector(
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new BookedRoom())),
                child: Text("Booked Room",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    )),
              ),
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.center,
              // width: 200,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                // border: Border.all(),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}