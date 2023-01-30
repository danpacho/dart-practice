import 'dart:math';

/**
 * 예시 api scheme
 */
class BoxApi {
  final int id;
  final int age;
  final int rate;
  final String title;
  final String? description;

  const BoxApi({
    required int this.id,
    required int this.age,
    required int this.rate,
    required String this.title,
    String? this.description,
  });

  @override
  String toString() {
    super.toString();
    final value =
        "{\n  title: $title\n   description: $description\n   id: $id\n   rate: $rate\n   age: $age\n }";
    return value;
  }

  @inject(
    id: 1,
    isBool: [true, false],
    res: "response",
  )
  bool getAdultContents(int id) {
    return id >= 2 ? true : false;
  }
}

/**
 * fetcher를 외부에서 주입받음
 */
typedef Fetcher<Arg, Return> = Return Function(Arg);

class ApiRequest<T> {
  Fetcher<String, T> fetcher;
  late List<T> store = [];
  late List<String> requestURLs;

  ApiRequest({
    required Fetcher<String, T> this.fetcher,
  });

  setRequestURLs(List<String> updatedRequestURLs) {
    requestURLs = [];
    requestURLs = updatedRequestURLs;
  }

  /**
  * api request using `HTTP` request module
  */
  List<T> request(List<String> requestURLs) {
    final res = requestURLs.map((link) => fetcher(link)).toList();
    store.addAll(res);

    setRequestURLs(requestURLs);

    return res;
  }

  List<T> getByCondition(bool Function(T prev) conditionFunction) =>
      store.where((element) => conditionFunction(element)).toList();

  List<T> refetch() {
    return request(requestURLs);
  }
}

class inject {
  final String res;
  final int id;
  final List<bool> isBool;

  const inject({
    required this.res,
    required this.id,
    required this.isBool,
  });
}

void main() {
  // api 응답 모델을 generic으로 끼워준 후 가공해줘야 함.
  final boxApiRequestHandler = ApiRequest<BoxApi>(
    fetcher: ((String link) {
      final JSON = {
        "id": Random.secure().nextInt(1000),
        "age": Random.secure().nextInt(100),
        "rate": Random.secure().nextInt(10),
        "title": "타이틀입니다",
        "description": "설명입니다",
      };

      final request = BoxApi(
        id: JSON["id"] as int,
        age: JSON["age"] as int,
        rate: JSON["rate"] as int,
        title: JSON["title"] as String,
        description: JSON["description"] as String,
      );

      return request;
    }),
  );

  boxApiRequestHandler.request([
    "https://1",
    "https://2",
    "https://3",
    "https://4",
    "https://5",
  ]);

  final over70 =
      boxApiRequestHandler.getByCondition(((prev) => prev.age >= 70));

  print(over70);
}
