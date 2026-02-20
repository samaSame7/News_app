import 'package:dio/dio.dart';
import 'package:news_7/models/source.dart';
import 'package:news_7/models/article.dart';
import 'package:news_7/models/articles_response.dart';
import 'package:news_7/models/sources_response.dart';

abstract final class ApiManager {
  static const baseUrl = "https://newsapi.org";
  static const apiKey = "b98d2ff2bcf14bc6bb8ab77b9fa82134";
 //  static const apiKey = "b98d2ff2bcf14bc6bb8ab77b9fa8213";
  static const sourcesApi = "/v2/top-headlines/sources";
  static const articleApi = "/v2/everything";

  static Future<List<Source>> loadSources(String categoryName) async {
    Dio dio = Dio();
    Response response = await dio.get(
      "$baseUrl$sourcesApi",
      queryParameters: {"apiKey": apiKey, "category": categoryName},
    );

    if (response.statusCode == 200) {
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(response.data);
      return sourcesResponse.sources!;
    }
    throw "Something went wrong please try again later";
  }

  static Future<List<Article>> loadArticles(String sourceId) async {
    Dio dio = Dio();
    Response response = await dio.get(
      "$baseUrl$articleApi?apiKey=$apiKey&sources=$sourceId",
    );
    if (response.statusCode == 200) {
      ArticlesResponse articlesResponse = ArticlesResponse.fromJson(
        response.data,
      );
      return articlesResponse.articles!;
    }
    throw "Something went wrong please try again later";
  }
}
