import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/pages/home/bloc/home_bloc.dart';
import 'package:news_app/pages/home/bloc/home_event.dart';
import 'package:news_app/pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(LoadNewsEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App Đọc Báo',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amberAccent),
        ),
        home: const HomePage(),
      ),
    );
  }
}
