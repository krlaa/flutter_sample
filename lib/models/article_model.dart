class ArticleModel {
  String id;
  String title;
  String url;
  String imageUrl;
  String newsSite;
  String summary;
  String publishedAt;
  String updatedAt;

//This is the default constructor this is equivelent to :

/**
 * ArticleModel({  String id,
  String title,String url,String imageurl,String newsSite,String summary,String publishedAt,String updatedAt,}){
  this.id = id
  this.title = title
  this.url = url
  this.imageurl = imageurl
  this.newsSite = newsSite
  this.summary = summary
  this.publishedAt = publishedAt
  this.updatedAt = updatedAt
  }
 */
  ArticleModel({
    String id,
    String title,
    String url,
    String imageUrl,
    String newsSite,
    String summary,
    String publishedAt,
    String updatedAt,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    print(json);  
    return ArticleModel(
      id: json['id'],
      title: json['title'],
      url: json['url'],
      imageUrl: json['imageUrl'],
      newsSite: json['newsSite'],
      summary: json['summary'],
      publishedAt: json['publishedAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
