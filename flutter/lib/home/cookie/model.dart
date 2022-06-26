class Cookie {
  late String text;
  late String author;

  Cookie({required this.text, required this.author});

  Cookie.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    author = json['author'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['author'] = author;
    return data;
  }
}
