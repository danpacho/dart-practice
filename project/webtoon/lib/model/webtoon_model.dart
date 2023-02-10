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
