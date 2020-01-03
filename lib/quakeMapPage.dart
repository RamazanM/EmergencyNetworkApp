import 'dart:async';

import "lastquakes.dart";
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class QuakeMapPage extends StatefulWidget {
  Quake quake;
  QuakeMapPage(this.quake);
  @override
  _QuakeMapPageState createState() => _QuakeMapPageState(quake);
}

class _QuakeMapPageState extends State<QuakeMapPage> {
  Quake quake;
  _QuakeMapPageState(this.quake);
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        gMap(),
        Container(
          constraints:
              BoxConstraints.expand(width: double.infinity, height: 30),
          height: 5,
          alignment: Alignment(0, 0),
          child: Text(quake.location,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          decoration: BoxDecoration(
              color: Colors.blue,
              border: Border.all(
                color: Colors.blue,
                width: 2,
              )),
        ),
        Align(
          child: FloatingActionButton(child: Icon(Icons.close),onPressed:(){Navigator.pop(context);},),
          alignment: Alignment(0, 0.9),
          
        )
        
      ],
    );
  }

  Widget gMap() {
    return Container(
        child: GoogleMap(
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      initialCameraPosition:
          CameraPosition(target: LatLng(quake.lat, quake.lng), zoom: 10.0),
      circles: Set.from([
        Circle(
            circleId: CircleId(quake.location),
            center: LatLng(quake.lat, quake.lng),
            radius: quake.power * 750,
            fillColor: Colors.red[100],
            strokeColor: Colors.red[300]),
      ]),
    ));
  }
}
