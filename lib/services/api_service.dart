import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/apps/app_config.dart';
import 'package:news_app/models/news.dart';

class APIService {
  Dio dio = Dio();
  String? nextPage;
  APIService._privateConstructor();
  static final APIService instance = APIService._privateConstructor();

  //get news
  Future<List<News>> getNews() async {
    try {
      final String path = nextPage == null
          ? '${AppConfig.endPoint}${AppConfig.apiKey}'
          : '${AppConfig.endPoint}${AppConfig.apiKey}&page=$nextPage';
      log(path);
      Response res = await dio.get(path);
      List<News> listNews =
          (res.data['results'] as List).map((e) => News.fromJson(e)).toList();
      nextPage = res.data['nextPage'];
      print(res.data['results']);
      log(path);
      return listNews;
    } catch (e) {
      rethrow;
      log(e.toString());
      return [];
    }
  }
}
