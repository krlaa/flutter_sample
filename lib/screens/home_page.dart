//This is the home page this is stateful widget because the data on the page is dynamically changing and not preset
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gitpodflutter/constants/globals.dart';
import 'package:gitpodflutter/models/article_model.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  //boiler plate code don't need to worry
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future reponseFromApi;
  Future<List<ArticleModel>> fetch() async {
    var response = await http.get(
        Uri.parse('https://api.spaceflightnewsapi.net/v3/articles?_limit=50'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      List list = [];

      jsonDecode(response.body).
      print(list);
      return list;
    } else {
      return [];
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reponseFromApi = fetch();
  }

  //build method renders your widgets on to the screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //sets background color to hex #121212
      backgroundColor: Color(0xFF121212),
      //the app bar is the bar that displays at the top right now it set to transparent but it is needed to show the back button if needed
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      //Column represents a view laid out in a vertical format
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [titleSection('SpaceFlight'), listSection(reponseFromApi)],
        ),
      ),
    );
  }

  // seperating into methods like this makes different section more manageable and the above code more readable
  Widget titleSection(String title) {
    return Text(
      title,
      //Extract styles to constants file that you know you will use in later parts of the app to save time
      style: titleStyle,
    );
  }

  Widget listSection(Future future) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          List articleList = snapshot.data;

          return ListView.builder(
            itemCount: articleList.length,
            itemBuilder: (context, index) {
              return Text(articleList[index]);
            },
          );
        }
      },
    );
  }
}
