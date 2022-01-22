import 'package:bloc_library/news/bloc/news_bloc.dart';
import 'package:bloc_library/news/model/news_model.dart';
import 'package:bloc_library/news/news_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);
  final String image =
      'https://afrikaleaks.com/wp-content/uploads/2021/02/Capture-de%CC%81cran-2021-02-22-a%CC%80-09.32.08.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state is NewsInitialState) {
              return const Text('Loading...');
            } else if (state is NewsLoadingState) {
              return const Text('Loading...');
            }
            return const Text('Top News Headlines');
          },
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
        if (state is NewsInitialState) {
          return loading();
        } else if (state is NewsLoadingState) {
          return loading();
        } else if (state is NewsLoadedState) {
          return getNewsData(state.articles);
        } else if (state is NewsHasErrorState) {
          return Text(state.message);
        }
        return const Center(child: Text('Nothing'));
      }),
    );
  }

  Widget loading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget getNewsData(List<Article> articles) {
    return ListView.builder(
      itemCount: articles.length,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        var news = articles[index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewsDetails(
                name: news.source!.name,
                image: news.urlToImage,
                title: news.title,
                description: news.description,
                author: news.author,
                publishAt: news.publishedAt,
              ),
            ),
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 6.0),
            child: Card(
              elevation: 5.0,
              margin: EdgeInsets.zero,
              child: Column(
                children: [
                  Hero(
                    tag: '${news.urlToImage}',
                    child: Image.network(news.urlToImage != null
                        ? news.urlToImage.toString()
                        : image),
                  ),
                  //const SizedBox(height: 5.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Text(
                      news.source!.name.toString(),
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontSize: 18.0,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
