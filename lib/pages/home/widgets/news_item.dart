import 'package:flutter/material.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/pages/news/news_page.dart';

class NewItems extends StatelessWidget {
  const NewItems({super.key, required this.news});
  final News news;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => NewsPage(news: news),
        ),
      ),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              news.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(news.title,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                news.description,
                style: const TextStyle(color: Colors.black54),
              ),
            )
          ],
        ),
      ),
    );
  }
}
