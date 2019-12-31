import 'package:flutter/material.dart';
import 'main_page.dart';
import 'firstaid.dart';
import 'lastquakes.dart';
import 'settings.dart';
import 'socialPage.dart';
import 'testpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deprem',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: {
        '/':(context)=>MainPage(),
        '/firstaid':(context)=>FirstAidPage(),
        '/lastquakes':(context)=>LastQuakesPage(),
        '/social':(context)=>SocialPage(),
        '/settings':(context)=>SettingsPage(),
        '/test':(context)=>TestPage()
      },
    );
  }
}