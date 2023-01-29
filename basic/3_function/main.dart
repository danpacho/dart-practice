void main() {
  optionalHello("준성");
  superHello(
    name: "준성",
    country: "한쿸!",
    customHello: "반갑다 반가워!",
  );
}

void sayHello(String name) {
  print("오 안녕하신가? $name!");
}

int getSum(List<int> numbers) =>
    numbers.reduce((value, element) => value + element);

int getSum2(List<int> numbers2) {
  return numbers2.reduce((value, element) => value + element);
}

// named parameter
void superHello({
  required String name,
  String country = "korea",
  String? customHello,
}) {
  final hello =
      "안녕하세요, $name! $country 출신이시군요!${customHello != null ? "\n$customHello" : ""}";

  print(hello);
}

// optional positional parameters
void optionalHello(String name, [int? age]) {
  print("안녕하세요, $name! ${age != null ? "나이가 $age이 네요!" : ""}");
}
