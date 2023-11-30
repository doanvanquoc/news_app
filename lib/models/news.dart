class News {
  final String id;
  final String title;
  final String description;
  final String content;
  final String pubDate;
  final String imageUrl;

  News.fromJson(Map<String, dynamic> json)
      : id = json['article_id'],
        title = json['title'],
        description = json['description'],
        content = json['content'] ?? json['description'],
        pubDate = json['pubDate'],
        imageUrl = json['image_url'] ??
            'https://guwahatiplus.com/public/web/images/default-news.png';
}
