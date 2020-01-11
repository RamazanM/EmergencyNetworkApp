import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
AppBar appBar(text){
  return AppBar(
    title: Text(text),
    leading: Image.asset("assets/logo.png"),
    actions: <Widget>[IconButton(
      icon:Icon(Icons.phone),
      onPressed: (){launch("tel://112");},
    )],
  );
}