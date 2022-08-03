class Article{
  String title;
  String url;
  String urlToImage;


  Article({required this.title, required this.url, required this.urlToImage});

  Map<String, dynamic> toMap() {
    return {
      "title": this.title,
      "url": this.url,
      "urlToImage": this.urlToImage,
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      title: map["title"],
      url: map["url"],
      urlToImage: map["urlToImage"],
    );
  }
//

}
