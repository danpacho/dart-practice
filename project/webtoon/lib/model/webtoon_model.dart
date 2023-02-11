import 'package:webtoon/model/model_factory.dart';

class WebtoonModel implements Model<WebtoonModel> {
  String title = "", thumb = "", id = "";

  @override
  set(jsonMap) {
    title = jsonMap["title"];
    thumb = jsonMap["thumb"];
    id = jsonMap["id"];
  }

  @override
  create() {
    return WebtoonModel();
  }
}

class WebtoonInfoModel implements Model<WebtoonInfoModel> {
  String title = "", about = "", genre = "", age = "", thumb = "";

  @override
  void set(JsonMap jsonMap) {
    age = jsonMap["age"];
    title = jsonMap["title"];
    about = jsonMap["about"];
    genre = jsonMap["genre"];
    thumb = jsonMap["thumb"];
  }

  @override
  WebtoonInfoModel create() {
    return WebtoonInfoModel();
  }
}

class WebtoonEpisodesModel implements Model<WebtoonEpisodesModel> {
  String id = "", title = "", thumb = "";
  double rating = 0;
  DateTime date = DateTime.parse("2000-01-01");

  @override
  void set(JsonMap jsonMap) {
    id = jsonMap["id"];
    title = jsonMap["title"];
    thumb = jsonMap["thumb"];
    final dated = DateTime.parse(
      (jsonMap["date"] as String).split(".").join("-"),
    );
    if (dated.runtimeType is DateTime) {
      date = dated;
    }
    rating = double.parse(jsonMap["rating"] as String);
  }

  @override
  WebtoonEpisodesModel create() {
    return WebtoonEpisodesModel();
  }
}
