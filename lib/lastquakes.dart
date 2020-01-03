import 'package:flutter/material.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' as DOM;
import 'package:http/http.dart' as http;
class LastQuakesPage extends StatefulWidget {
  @override
  _LastQuakesPageState createState() => _LastQuakesPageState();
}

class _LastQuakesPageState extends State<LastQuakesPage> {

  Future<List<Quake>> getLastQuakes()async{
    http.Response res=await http.get("http://www.koeri.boun.edu.tr/scripts/lst9.asp");
    DOM.Document doc=parse(res.body);
    DOM.Element pre=doc.getElementsByTagName("pre")[0];
    String mData=pre.innerHtml;
    RegExp regExp=RegExp(r"([\w\.\:\-\(\)]+\ )+",caseSensitive: false,multiLine: false);
     for (var data in mData.split("\n")) {
       if(regExp.hasMatch(data))
       //group ile istediğin değerleri çek yazdır
       print(regExp.allMatches(data).toList().first.group(1));
     }
    return [];
  }

  @override
  void initState() {
    getLastQuakes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

class Quake{
  DateTime dateTime;
  double lat,lng;
  double depth;
  double power;
  String location;
  Quake(this.dateTime,this.lat,this.lng,this.depth,this.power,this.location);
}
