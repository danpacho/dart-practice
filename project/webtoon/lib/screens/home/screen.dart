import 'package:flutter/material.dart';
import 'package:webtoon/model/model_factory.dart';
import 'package:webtoon/model/webtoon_model.dart';
import 'package:webtoon/services/api_service.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final webtoonService = ApiService(
    baseUrl: "https://webtoon-crawler.nomadcoders.workers.dev",
  );

  final todayWebtoon = ModelFactory(WebtoonModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "툰보고",
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              final resList = await webtoonService.fetch(
                endpoint: "today",
              );
              todayWebtoon.transform(resList);
            },
            child: Text(
              todayWebtoon.status == Status.filled
                  ? todayWebtoon.data[2].id
                  : "unfilled",
            ),
          ),
        ],
      ),
    );
  }
}
