import 'package:webtoon/model/model_factory.dart';

class WebtoonModel implements ModelSetter {
  String title = "", thumb = "", id = "";

  @override
  set(data) {
    title = data["title"];
    thumb = data["thumb"];
    id = data["id"];
  }
}
