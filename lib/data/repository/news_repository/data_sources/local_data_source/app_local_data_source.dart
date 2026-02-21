import 'package:news_7/models/source.dart';

class AppLocalDataSource {
  Future<List<Source>> loadSources(String categoryName) async {
    return [];
  }

  Future<List<Source>> saveSources(List<Source> sources) async {
    return sources;
  }
}
