// ignore_for_file: unused_local_variable

void main() {
  // bool 타입은 true or false
  bool isTrue = 1 > 2;

  // String 타입은 반드시 대문자로 시작!
  String string = "이게 스트링이다";

  // number 타입은 num -> int / double로
  int integar = 1;
  double doubles = 1.1;
  num numberInt = 7;
  num numberDouble = 7.7;

  // list 타입은 generic 타입의 list
  List<int> intList = [1, 2, 3, 4, 5];

  // Object is equal as any
  List<Object> anyList = [
    {"id": 1},
    {"id": 2},
    {"id": 3},
  ];

  // nested list
  List<List<int>> listOfList = [
    [1, 2, 3],
    [1, 2],
    [1],
  ];

  // nested list 2
  List<List<List<int>>> listOfListOfList = [
    [
      [1, 2, 3],
      [1],
    ],
    [
      [1, 2, 3],
      [1, 2],
    ],
  ];

  Map<String, String> map = {
    "name": "june",
    "hobby": "😎",
  };

  Map<Map<int, int>, String> keyWithMap = {
    {
      1: 2,
      2: 3,
    }: "yes",
    {
      1: 2,
      2: 3,
    }: "of course",
  };

  Map<List<int>, int> keyWithList = {
    [1, 2, 3]: 1,
    [4, 5, 6]: 2,
  };

  Map<List<Map<int, int>>, int> keyWithComplex = {
    [
      {1: 2, 2: 3},
      {1: 2, 2: 3}
    ]: 1,
    [
      {1: 2, 2: 3},
      {1: 2, 2: 3}
    ]: 2,
  };

  // Set 자료구조는 중복을 제거
  Set<String> deduplicatedStrings = {
    "love",
    "true",
    "hoi!",
  };

  deduplicatedStrings.add("love");
  // "love"는 1개 밖에 없음

  Set<int> deduplicatedInt = Set();
  deduplicatedInt.addAll([1, 2, 3, 1, 2, 3]);
  // 1,2,3 중복제거
}

typedef FruitInfo = Map<String, Map<String, double>>;
typedef Fruit = Map<String, FruitInfo>;

final List<Fruit> fruits = [
  {
    "apple": {
      "taste": {
        "당도": 0.5,
        "신맛": 0.2,
      }
    },
    "banana": {
      "taste": {
        "당도": 0.75,
        "신맛": 0.05,
      }
    },
  },
  {
    "mango": {
      "taste": {
        "당도": 0.85,
        "신맛": 0.0,
      }
    },
  },
];
