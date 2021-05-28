import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gitpodflutter/constants/global_widgets.dart';
import 'package:gitpodflutter/constants/text_styles.dart';
import 'package:gitpodflutter/models/article_model.dart';
import 'package:gitpodflutter/services/api_service.dart';

//This is the home page this is stateful widget because the data on the page is dynamically changing and not preset

class MyHomePage extends StatefulWidget {
  //boiler plate code don't need to worry
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future reponseFromApi;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Calls the api service fetch method which returns Future<List<ArticleModel>>
    reponseFromApi = SpaceFlightService.fetch();
  }

  //build method renders your widgets on to the screen
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //sets background color to hex #121212 use the OxFF{hex} format
        backgroundColor: Color(0xFF121212),
        //the app bar is the bar that displays at the top right now it set to transparent
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        //Column represents a view laid out in a vertical format
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleSection('SpaceFlight'),
              spacer(20),
              listSection(reponseFromApi),
              spacer(20),
            ],
          ),
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
          List<ArticleModel> articleList = snapshot.data;
          return Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Scrollbar(
isAlwaysShown: true,
                              child: ListView.separated(
                  itemCount: articleList.length,
                  separatorBuilder: (_, index) => spacer(20),
                  itemBuilder: (_, index) {
                    ArticleModel article = articleList[index];
                    return Card(
                      color: Colors.grey[900],
                      margin: EdgeInsets.zero,
                      child: ListTile(

                               contentPadding: EdgeInsets.all(15),
                        leading: CircleAvatar(backgroundImage: article.image,backgroundColor: Colors.grey[600],),
                        trailing: Wrap(
                              children: [
                                VerticalDivider(color: Colors.red,),Text(article.publishedAt.substring(0,4),)
                              ],
                            
                          
                        ),
                        title: Text(
                            article.title,
                            style: titleStyle.copyWith(
                              fontSize: 15,

                          ),
                        ),
                        subtitle: Text(
                          article.newsSite,
                          style: titleStyle.copyWith(fontSize: 13,color: Colors.cyan[600]),
                        ),
                        
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
