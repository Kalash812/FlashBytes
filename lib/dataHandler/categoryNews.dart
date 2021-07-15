import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/models/newsData.dart';
import 'package:news_app/services/newsData.dart';

class CategoryNewsData {
  List<News> newsData = [];
  Future<void> getData(String category) async {
    http.Response response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=$apiKey'));

    var jsonData = jsonDecode(response.body);

    List news = jsonData['articles'];

    for (var i in news) {
      if (i['urlToImage'] != null &&
          i['description'] != null &&
          i['title'] != null) {
        News newsElement = News(
          url: i['url'],
          date: i['publishedAt'],
          description: i['description'],
          title: i['title'],
          urlToImage: i['urlToImage'],
        );
        newsData.add(newsElement);
      }
    }
  }
}
