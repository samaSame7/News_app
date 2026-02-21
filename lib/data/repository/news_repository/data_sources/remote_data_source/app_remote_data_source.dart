import 'package:news_7/apis/api_manager.dart';
import 'package:news_7/models/source.dart';

class AppRemoteDataSource {
  Future<List<Source>> loadSources(String categoryName) async {
    return ApiManager.loadSources(categoryName);
  }
}
