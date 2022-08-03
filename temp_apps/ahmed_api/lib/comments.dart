class Comments {
  int id;

  String name;

  String email;

  Comments({required this.id, required this.name, required this.email});

  Map<String, dynamic> toMap() {
    return {
      "id": this.id,
      "name": this.name,
      "email": this.email,
    };
  }
//
  factory Comments.fromMap(Map<String, dynamic> map) {
    return Comments(
      id: map['id']?.toInt()??0,
      name: map["name"]??'',
      email: map["email"]??'',
    );
  }





}
