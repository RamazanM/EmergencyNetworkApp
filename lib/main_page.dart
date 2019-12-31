import 'package:deprem_mobil/appbar.dart';
import 'package:flutter/material.dart';
import 'appbar.dart';

class MainPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Deprem Uygulaması"),
      body: Column(
        children: [
          Button("Sosyal",(){Navigator.pushNamed(context, "/social");}),
          Button("İlkyardım",(){Navigator.pushNamed(context, "/firstaid");}),
          Button("Son Depremler",(){Navigator.pushNamed(context, "/lastquakes");}),
          Button("Ayarlar", (){Navigator.pushNamed(context, "/settings");}),
          Button("Test", (){Navigator.pushNamed(context, "/test");}),

        ],
      ),
    );
  }

  Widget Button(text,onpress){
    return Expanded(child: Row(children: <Widget>[Expanded(child: RaisedButton(child: Text(text),onPressed:onpress))]));

  }

}