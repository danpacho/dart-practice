void main() {
  // dynamic 변수
  // 타입이 계속 변경되어도 상관 없음
  dynamic dangerous = "super";
  dangerous = 2;
  dangerous = {};

  // var 변수 = js "let"
  // 타입은 고정 되어야 함
  var number = 1;
  var string = "string";
  var object = {
    "yes": true,
  };

  // var 수정하기
  // 타입은 그대로 유지, 값만 변경;
  number++;
  number = number + 1;
  string = "string2";
  // object는 js 주소처럼 동작하는 것 같음
  object = {};

  // final 정적인 변수 만들기 = js "const"
  // 런타임 수정 불가!
  final staticNumber = 0;
  // 런타임 업데이트 불가. staticNumber++;

  // const 컴파일 타임에 아는 정적인 값
  // 얘는 key가 유추가 안된다, Map타입의 고질적인 문제점...
  const Map<String, Object> OPTION = {
    "rate": 1,
    "ratio": "love",
  };
  const NAME = "준성의 즐거운 플러터 공부";

  // null safety = null들어가면 프로그램 사망함, 미리 방지
  final String? nameFinal = "final";
  // var String nameVarCant = "var은 타입 지정 불가, 유추만...";
  String? nameVar = "final";
  nameVar = null;

  if (nameVar is String) {
    print(nameVar);
    print(nameVar.isEmpty);
  } else if (nameVar == null) {
    print("텅~ 비었네요!");
  }

  // 변수의 느린 초기화
  // class 초기 생성자에서 유용하게 사용
  late final String slowString;
  late var slowVar;

  slowVar = 1;
  slowString = "느린 초기화...";
}
