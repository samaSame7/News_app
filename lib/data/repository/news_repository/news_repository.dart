import 'package:news_7/data/repository/news_repository/data_sources/local_data_source/app_local_data_source.dart';
import 'package:news_7/data/repository/news_repository/data_sources/remote_data_source/app_remote_data_source.dart';
import 'package:news_7/models/source.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NewsRepository {
  AppLocalDataSource localDataSource = AppLocalDataSource();
  AppRemoteDataSource remoteDataSource = AppRemoteDataSource();
  Future<List<Source>> loadSources(String categoryName) async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var sources = await remoteDataSource.loadSources(categoryName);
      localDataSource.saveSources(sources);
      return sources;
    } else {
      return localDataSource.loadSources(categoryName);
    }
  }
}
