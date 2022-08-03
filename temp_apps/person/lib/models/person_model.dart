class Person{
 int? albumId ;
 int? userId ;
 String? name;
 String? url;
 String? thumbnailUrl;

//<editor-fold desc="Data Methods">

 Person({
    this.albumId,
    this.userId,
    this.name,
    this.url,
    this.thumbnailUrl,
  });

 Map<String, dynamic> toMap() {
    return {
      'albumId': this.albumId,
      'userId': this.userId,
      'name': this.name,
      'url': this.url,
      'thumbnailUrl': this.thumbnailUrl,
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      albumId: map['albumId'] as int,
      userId: map['userId'] as int,
      name: map['name'] as String,
      url: map['url'] as String,
      thumbnailUrl: map['thumbnailUrl'] as String,
    );
  }

//</editor-fold>
}