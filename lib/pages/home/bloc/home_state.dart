// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:news_app/models/news.dart';

abstract class HomeState {}

class HomeInital extends HomeState {}

class LoadingNewsState extends HomeState {}

class LoadNewsSuccessState extends HomeState {
  final List<News> listNews;
  LoadNewsSuccessState({
    required this.listNews,
  });
}

class LoadNewsFailState extends HomeState {}
