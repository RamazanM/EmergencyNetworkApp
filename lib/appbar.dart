import 'package:flutter/material.dart';
AppBar appBar(text){
  return AppBar(
    title: Text(text),
    leading: Image.asset("assets/logo.png"),
  );
}