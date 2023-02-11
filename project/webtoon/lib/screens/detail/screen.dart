import 'package:flutter/material.dart';
import 'package:webtoon/common/widgets/screen_layout.dart';
import 'package:webtoon/common/widgets/webtoon_card.dart';
import 'package:webtoon/model/model_factory.dart';
import 'package:webtoon/model/webtoon_model.dart';
import 'package:webtoon/screens/detail/widgets/episode_card.dart';
import 'package:webtoon/services/webtoon_service.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({super.key});

  final webtoonInfo = ModelFactory(WebtoonInfoModel());
  final webtoonEpisodes = ModelFactory(WebtoonEpisodesModel());

  @override
  Widget build(BuildContext context) {
    final webtoon = ModalRoute.of(context)!.settings.arguments as WebtoonModel;

    return ScreenLayout(
      pageTitle: webtoon.title,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: WebtoonCard(
                webtoon: webtoon,
                onTap: () {},
                size: 400,
              ),
            ),
            FutureBuilder(
              future: (() async {
                webtoonInfo.transformJson(
                  await WebtoonService.getWebtoonInfoById(webtoon.id),
                );
                webtoonEpisodes.transformJsonList(
                  await WebtoonService.getWebtoonEpisodesById(webtoon.id),
                );
                return {
                  "info": webtoonInfo.data,
                  "episodes": webtoonEpisodes.dataList,
                };
              })(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final webtoonInfo =
                      snapshot.data!["info"] as WebtoonInfoModel;
                  final webtoonEpisodes =
                      snapshot.data!["episodes"] as List<WebtoonEpisodesModel>;

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Text(
                            webtoonInfo.about,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black.withOpacity(0.5),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Text(
                            webtoonInfo.genre,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.green,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 300,
                          child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 10),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: 20,
                            ),
                            scrollDirection: Axis.vertical,
                            itemCount: webtoonEpisodes.length,
                            itemBuilder: (context, index) {
                              final episode = webtoonEpisodes[index];

                              return index == 0
                                  ? Stack(
                                      children: <Widget>[
                                        EpisodeCard(
                                          episode: episode,
                                        ),
                                        Positioned(
                                          top: 5,
                                          right: 5,
                                          child: Container(
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 5,
                                              vertical: 1,
                                            ),
                                            decoration: const BoxDecoration(
                                              color: Colors.green,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(4),
                                              ),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                "Latest",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : EpisodeCard(
                                      episode: episode,
                                    );
                            },
                          ),
                        )
                      ],
                    ),
                  );
                }

                return const SizedBox(
                  width: 0,
                  height: 0,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
