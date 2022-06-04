class Quote {
  String body;
  String category;
  String author;

  Quote({required this.author, required this.category, required this.body});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      author: json['author'],
      category: json['category'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "body": body,
      "category": category,
      "author": author,
    };
  }
}
