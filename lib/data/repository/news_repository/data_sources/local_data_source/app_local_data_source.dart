import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_7/models/source.dart';

class AppLocalDataSource {
  Future<List<Source>?> loadSources(String categoryName) async {
    var box = await Hive.openBox("news");
    List<Source>? sources = box.get(categoryName);
    return sources;
  }

  Future<List<Source>> saveSources(String category, List<Source> sources) async {
    var box = await Hive.openBox("news");
    box.put(category, sources);
    return sources;
  }
}

class SourceAdapter extends TypeAdapter<Source> {
  @override
  Source read(BinaryReader reader) {
    return Source.fromJson(reader.read());
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, Source obj) {
    writer.write(obj.toJson());
  }
}
