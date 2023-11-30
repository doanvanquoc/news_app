import 'package:bloc/bloc.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/pages/home/bloc/home_event.dart';
import 'package:news_app/pages/home/bloc/home_state.dart';
import 'package:news_app/services/api_service.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInital()) {
    on<HomeEvent>((event, emit) async {
      if (event is LoadNewsEvent) {
        try {
          emit(LoadingNewsState());
          List<News> listNews = await APIService.instance.getNews();
          emit(LoadNewsSuccessState(listNews: listNews));
        } catch (e) {
          emit(LoadNewsFailState());
        }
      }
    });
  }
}
