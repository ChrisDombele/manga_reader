import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';

class CollectionPage extends StatefulWidget {
  @override
  _CollectionPageState createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  final String url =
      "https://jikan1.p.rapidapi.com/search/manga?q=Attack on Titan";
  List data;

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async {
    var response = await http.get(
        // encode url incase of spaces
        Uri.encodeFull(url),
        // only accept json response
        headers: {"Accept": "application/json", "X-RapidAPI-Key": ""});

    print(response.body);
    print("text");

    setState(() {
      var convertDataToJson = json.decode(response.body);
      data = convertDataToJson['results'];
    });

    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Collection"),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Search pressed"),
                  ),
                );
              },
              child: Icon(
                Icons.search,
                size: 26.0,
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Bars pressed!"),
                    ),
                  );
                },
                child: Icon(Icons.menu),
              )),
        ],
      ),
      body: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 130,
                    child: Card(
                      margin: EdgeInsets.all(10),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Image.network(
                              data[index]["image_url"],
                              width: 60,
                            ),
                            SizedBox(width: 16),
                            Flexible(
                              child: Text(data[index]['title']),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
