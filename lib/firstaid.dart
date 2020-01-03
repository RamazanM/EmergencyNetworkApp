import 'package:flutter/material.dart';
import 'appbar.dart';
import 'dart:convert';

class FirstAidPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirstAidPageState();
  }
}

class FirstAidPageState extends State {
  var json = [];

  void getJson() {
    DefaultAssetBundle.of(context)
        .loadString("assets/firstAid.json")
        .then((data) {
      setState(() {
        json = jsonDecode(data);
      });
    });
  }

  @override
  void initState() {
    getJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar("İlkyardım"),
        body: ListView.builder(
          itemCount: json.length,
          itemBuilder: (BuildContext context, int id) {
            return ExpansionTile(
              title: Text(json[id]["title"]),
              children: _buildExpandableContent(json[id]),
            );
            //return containerBuilder(json[id]["title"]);
          },
        ));
  }

  List<Widget> _buildExpandableContent(dynamic json) {
    List<Widget> columnContent = [];

    for (var content in json["subtitles"])
      columnContent.add(
        new ListTile(
          title: new Text(
            content["title"],
            style: new TextStyle(fontSize: 18.0),
          ),
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Form(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              content["title"],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            )),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(content["content"]),
                        )
                      ],
                    )),
                  );
                });
          },
        ),
      );

    return columnContent;
  }
}
