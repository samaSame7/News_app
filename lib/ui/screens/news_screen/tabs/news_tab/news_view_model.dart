import 'package:flutter/material.dart';
import 'package:news_7/apis/api_manager.dart';
import 'package:news_7/models/source.dart';
import 'package:news_7/ui/utils/app_resource.dart';

class NewsViewModel extends ChangeNotifier {
  AppResource<List<Source>> sourceApi = AppResource.initial();

  Future<void> loadSources(String category) async {
    try {
      sourceApi = AppResource.loading();
      notifyListeners();
      var sources = await ApiManager.loadSources(category);
      sourceApi = AppResource.success(sources);
    } catch (e) {
      sourceApi = AppResource.error(e.toString());
    }
    notifyListeners();
  }
}
