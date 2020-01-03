import 'package:deprem_mobil/appbar.dart';
import 'package:flutter/material.dart';
import 'appbar.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar("Deprem Uygulaması"),
        body: Column(children: [
          Expanded(
            child:
          GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: [
              Button("Sosyal", Icons.message, Colors.red[500], () {
                Navigator.pushNamed(context, "/social");
              }),
              Button("İlkyardım", Icons.add_box, Colors.red[600], () {
                Navigator.pushNamed(context, "/firstaid");
              }),
              Button("Son Depremler", Icons.new_releases, Colors.red[700], () {
                Navigator.pushNamed(context, "/lastquakes");
              }),
              Button("Ayarlar", Icons.settings_applications, Colors.red[800],
                  () {
                Navigator.pushNamed(context, "/settings");
              }),
            ],
          )),
          Placeholder(fallbackHeight: 250,)
        ]));
  }

  Widget Button(text, icon, color, onpress) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(
              icon,
              size: 70,
              color: Colors.white,
            ),
            Text(text,
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
        alignment: Alignment(0, 0),
        color: color,
      ),
      onTap: onpress,
    );
  }
}
