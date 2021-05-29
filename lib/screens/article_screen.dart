import 'package:flutter/material.dart';
import 'package:gitpodflutter/constants/global_widgets.dart';
import 'package:gitpodflutter/constants/text_styles.dart';
import 'package:gitpodflutter/models/article_model.dart';

class ArticleScreen extends StatelessWidget {
  final ArticleModel article;

  ArticleScreen({this.article});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgMain,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: OrientationBuilder(builder: (context, orientation) {
          return SafeArea(
            minimum: EdgeInsets.symmetric(
                horizontal: orientation == Orientation.landscape ? 50 : 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                spacer(height: 40),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                        tag: article.id,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image(
                                height: 170,
                                width: 130,
                                fit: BoxFit.cover,
                                image: article.image))),
                    spacer(width: 20),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            article.title,
                            style: titleStyle.copyWith(
                                fontSize: titleStyle.fontSize - 6,
                                fontWeight: FontWeight.bold),
                            maxLines: 5,
                          ),
                          spacer(height: 8),
                          Text(
                            'Source: ${article.newsSite}',
                            style: titleStyle.copyWith(
                                decoration: TextDecoration.underline,
                                fontSize: 13,
                                color: Colors.cyan[500]),
                          ),
                          spacer(height: 4),
                          Text(
                            'Published: ${article.publishedAt.substring(0, 10)}',
                            style: titleStyle.copyWith(
                                fontSize: 13, color: Colors.deepOrange[300]),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                spacer(height: 20),
                Flexible(
                    child: Text(
                  article.summary,
                  style:
                      titleStyle.copyWith(fontSize: titleStyle.fontSize - 12),
                ))
              ],
            ),
          );
        }));
  }
}
