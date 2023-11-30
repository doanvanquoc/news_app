import 'package:flutter/material.dart';
import 'package:news_app/models/news.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key, required this.news});
  final News news;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        title: const Text('CKC NEWS'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              news.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Image.network(
              news.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            const SizedBox(height: 10),
            Text(news.content),
            Align(
              alignment: Alignment.bottomRight,
              child: Text('Upload: ${news.pubDate}'),
            ),
          ],
        ),
      ),
    );
  }
}
