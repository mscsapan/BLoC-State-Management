import 'dart:convert';

import 'package:bloc_library/news/model/news_model.dart';
import 'package:http/http.dart' as http;

class NewsNetwork {
  //final String url = 'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=ade50868159a4cd1a43834dc081e1209';
  final String url =
      'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=ade50868159a4cd1a43834dc081e1209';
  Future<List<Article>?> getNewsArticle() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      final List<Article>? articles = NewsModel.fromJson(data).articles;
      return articles;
    } else {
      throw Exception('Something is Wrong');
    }
  }
}
