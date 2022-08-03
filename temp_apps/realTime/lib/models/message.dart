import 'dart:io';

class Massege {

  String massegeText;

//<editor-fold desc="Data Methods">

  Massege({
    required this.massegeText,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': this.massegeText,
    };
  }

  factory Massege.fromMap(Map<dynamic, dynamic> map) {
    return Massege(
        massegeText: map['message'] as String,
    );
  }

//</editor-fold>
}