import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/pages/home/bloc/home_bloc.dart';
import 'package:news_app/pages/home/bloc/home_event.dart';
import 'package:news_app/pages/home/bloc/home_state.dart';
import 'package:news_app/pages/home/widgets/news_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CKC NEWS'),
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<HomeBloc>(context).add(LoadNewsEvent());
        },
        child: const Icon(Icons.refresh),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<HomeBloc>(context).add(LoadNewsEvent());
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is LoadingNewsState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is LoadNewsSuccessState) {
                return ListView.separated(
                  itemCount: state.listNews.length,
                  itemBuilder: (_, index) =>
                      NewItems(news: state.listNews[index]),
                  separatorBuilder: (_, index) => const SizedBox(height: 20),
                );
              }
              return const Center(
                child: Text('Có lỗi xảy ra'),
              );
            },
          ),
        ),
      ),
    );
  }
}
