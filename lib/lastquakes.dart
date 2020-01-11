import 'package:flutter/material.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' as DOM;
import 'package:http/http.dart' as http;
import 'appbar.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'quakeMapPage.dart';

class LastQuakesPage extends StatefulWidget {
  @override
  _LastQuakesPageState createState() => _LastQuakesPageState();
}

class _LastQuakesPageState extends State<LastQuakesPage> {
  List<Quake> quakeList = new List();

//map thing
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(45.521563, -122.677433);
  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }
//map thing

  Future<void> getLastQuakes() async {
    http.Response res =
        await http.get("http://www.koeri.boun.edu.tr/scripts/lst9.asp");
    DOM.Document doc = parse(res.body);
    DOM.Element pre = doc.getElementsByTagName("pre")[0];
    String mData = pre.innerHtml;
    RegExp regExp =
        RegExp(r"([\w\.\:\-\(\)]+\ )+", caseSensitive: false, multiLine: false);
    List<Quake> myList = new List();

    for (var data in mData.split("\n").sublist(6)) {
      Quake mQuake = new Quake.Empty();
      if (regExp.hasMatch(data)) {
        var regList = regExp.allMatches(data).toList();
        mQuake.dateTime = (regList[0].group(0));
        mQuake.lat = double.parse(regList[1].group(0));
        mQuake.lng = double.parse(regList[2].group(0));
        mQuake.depth = double.parse(regList[3].group(0));
        mQuake.power = double.parse(regList[5].group(0));
        mQuake.location = (regList[7].group(0));
        myList.add(mQuake);
      }
    }
    setState(() {
      quakeList = myList;
    });
  }

  @override
  void initState() {
    getLastQuakes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar("Son Depremler"),
        body: ListView.builder(
            itemCount: quakeList.length,
            itemBuilder: (ctx, id) {
              return RaisedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            contentPadding: EdgeInsets.all(0),
                            content: QuakeMapPage(quakeList[id]),
                          );
                        });
                  },
                  child: Container(
                      margin: EdgeInsets.only(top: 8, left: 0, right: 0),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red, width: 1.5),
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(10)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            quakeList[id].location,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Şiddet: " + quakeList[id].power.toString(),
                                style: TextStyle(
                                    color: Color.fromARGB(255, 200, 100, 100),
                                    fontWeight: FontWeight.w900),
                              ),
                              Text("Tarih: " + quakeList[id].dateTime),
                            ],
                          )
                        ],
                      )));
            }));
  }
}

class Quake {
  String dateTime;
  double lat, lng;
  double depth;
  double power;
  String location;
  Quake(
      this.dateTime, this.lat, this.lng, this.depth, this.power, this.location);
  Quake.Empty();
}
