part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitialState extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsLoadedState extends NewsState {
  final List<Article> articles;
  const NewsLoadedState({required this.articles});
  @override
  List<Object> get props => [articles];
}

class NewsHasErrorState extends NewsState {
  final String message;
  const NewsHasErrorState({required this.message});
  @override
  List<Object> get props => [message];
}
