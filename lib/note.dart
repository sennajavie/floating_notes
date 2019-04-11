class Note {

  String text;

  String title;

  Note(this.title, this.text);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "title": title,
      "text": text
    };
    return map;
  }

  Note.fromMap(Map<String, dynamic> map) {
    text = map["text"];
    title = map["title"];
  }
}