import 'dart:async';
import 'package:flutter/material.dart';
class TestPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>TestPageState();
}

class TestPageState extends State<TestPage>{



  List<StreamSubscription<dynamic>> _streamSubscriptions = <StreamSubscription<dynamic>>[];
  List<double> gyroValues=[];
  bool quake=false;
  bool hasInternet=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(
      children: [
        Spacer(),
        Text(quake?"Deprem olüü be hey":"Raad ol sıkıntı yok."),
        Text("İnternet bağlantın "+ (hasInternet?"var":"yok")),
        Text(gyroValues.map((double v)=>v.toStringAsFixed(3)).join(",")),
        Spacer()
      ]
    ));
  }
  @override
  void dispose() {
    super.dispose();
    for (StreamSubscription<dynamic> subscription in _streamSubscriptions) {
      subscription.cancel();
    }
  }
  @override
  void initState() {
    super.initState();
    //WifiFeatures.getSSIDList();
   // ServerHandler s=new ServerHandler();
    // if(ServerHandler.server==null) s.bindServer();
    // _streamSubscriptions.add(gyroscopeEvents.listen((GyroscopeEvent e){
    //   setState(() {
    //     gyroValues=<double>[e.x,e.y,e.z];
    //     quake=(e.x.abs()+e.y.abs()+e.z.abs()>0.005);
    //   });
    // }));
    // WifiFeatures.hasInternet().then((val){
      // setState(() {
      //   hasInternet=val;
      // });
    //});
  }


}