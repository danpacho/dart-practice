import 'package:webtoon/services/api_service.dart';

typedef FetchedJson = Future<List<dynamic>?>;

class WebtoonService {
  static const baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  static final ApiService service = ApiService(
    baseUrl: baseUrl,
  );

  static FetchedJson getTodayWebtoon() async {
    final todayWebtoons = await service.fetch(
      endpoint: "today",
    );
    return todayWebtoons;
  }

  static Future<dynamic> getWebtoonInfoById(String id) async {
    final webtoonInfo = await service.fetch(
      endpoint: id,
    );
    return webtoonInfo;
  }

  static FetchedJson getWebtoonEpisodesById(String id) async {
    final webtoonList = await service.fetch(
      endpoint: [id, "episodes"],
    );
    return webtoonList;
  }
}
