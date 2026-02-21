import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_7/data/repository/news_repository/news_repository.dart';
import 'package:news_7/models/source.dart';
import 'package:news_7/ui/utils/app_resource.dart';

class NewsViewModel extends Cubit<NewsState> {
  // AppResource<List<Source>> sourceApi = AppResource.initial();
  NewsViewModel() : super(NewsState(AppResource.initial()));
NewsRepository repository = NewsRepository();
  Future<void> loadSources(String category) async {
    try {
      // sourceApi = AppResource.loading();
      // notifyListeners();
      emit(NewsState(AppResource.loading()));
      var sources = await repository.loadSources(category);
      // sourceApi = AppResource.success(sources);
      emit(NewsState(AppResource.success(sources)));
    } catch (e) {
      // sourceApi = AppResource.error(e.toString());
      emit(NewsState(AppResource.error(e.toString())));
    }
    // notifyListeners();
  }
}

class NewsState {
  AppResource<List<Source>> sourceApi = AppResource.initial();
  NewsState(this.sourceApi);
}
