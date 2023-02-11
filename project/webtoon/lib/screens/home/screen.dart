import 'package:flutter/material.dart';
import 'package:webtoon/common/widgets/page_scaffold.dart';
import 'package:webtoon/common/widgets/webtoon_card.dart';
import 'package:webtoon/model/model_factory.dart';
import 'package:webtoon/model/webtoon_model.dart';
import 'package:webtoon/router/app_router.dart';
import 'package:webtoon/services/webtoon_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final todayWebtoon = ModelFactory(WebtoonModel());

  ListView renderWebtoonList(
    AsyncSnapshot<List<WebtoonModel>> snapshot,
  ) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(width: 20),
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      itemBuilder: (context, index) {
        final webtoon = snapshot.data![index];

        return WebtoonCard(
          size: 300,
          webtoon: webtoon,
          onTap: () {
            AppRouter.move(
              context: context,
              to: AppRoutePath.detail,
              routingProps: webtoon,
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      pageTitle: "웹툰보구",
      body: FutureBuilder(
        future: (() async {
          todayWebtoon.transformJsonList(
            await WebtoonService.getTodayWebtoon(),
          );
          return todayWebtoon.dataList;
        })(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const Text("오늘의 웹툰"),
                Expanded(
                    child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  itemBuilder: (context, index) {
                    final webtoon = snapshot.data![index];

                    return WebtoonCard(
                      size: 300,
                      webtoon: webtoon,
                      onTap: () {
                        AppRouter.move(
                          context: context,
                          to: AppRoutePath.detail,
                          routingProps: webtoon,
                        );
                      },
                    );
                  },
                )),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
