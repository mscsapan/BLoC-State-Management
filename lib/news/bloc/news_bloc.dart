import 'package:bloc/bloc.dart';
import 'package:bloc_library/news/model/news_model.dart';
import 'package:bloc_library/news/news_network.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'news_event.dart';

part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitialState()) {
    on<NewsEvent>((event, emit) async {
      if (event is GetNewsEvent) {
        emit(NewsLoadingState());
        try {
          final List<Article>? articles = await NewsNetwork().getNewsArticle();
          debugPrint('Total Length is : ${articles!.length}');
          emit(NewsLoadedState(articles: articles));
        } catch (e) {
          emit(NewsHasErrorState(message: e.toString()));
        }
      }
    });
  }
}
