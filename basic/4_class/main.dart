enum Team {
  red,
  blue,
}

class Player {
  final WIN = "win";
  final String name;
  late final int exp;
  late final Team team;

  void sayHello() {
    print("안녕, $name! ");
  }

  Player({
    required this.name,
    required this.exp,
  }) : team = Team.blue;

  // named constructor - { 괄호로 생성자 초기화 }
  Player.createRedTeamPlayer({
    required this.name,
    int exp = 1000,
  }) {
    this.exp = exp;
    team = Team.red;
  }

  // named constructor - : 콜론으로 생성자 초기화!
  Player.createBlueTeamPlayer({
    required this.name,
    int exp = 1000,
  })  : team = Team.blue,
        this.exp = exp;
}

enum Goat { sm, md, lg }

class GoatPlayer extends Player {
  Goat goatLevel;

  GoatPlayer.createBlueTeamGoatPlayer({
    required String name,
    required this.goatLevel,
  }) : super.createBlueTeamPlayer(
          name: name,
        );

  GoatPlayer.createRedTeamGoatPlayer({
    required String name,
    required this.goatLevel,
  }) : super.createBlueTeamPlayer(
          name: name,
        );
}

enum SuperAbility {
  fighter,
  singer,
  cute,
}

// 추상 클래스는 구현체를 작성해놓은 곳.
abstract class SuperAbilityFactory {
  SuperAbility superAbility;

  void extractSuper();

  SuperAbilityFactory({
    required this.superAbility,
  });
}

// abstract class 구현할 때 implements 키워드 사용
class SuperMan extends GoatPlayer
    with StrengthAbility, FastAbility
    implements SuperAbilityFactory {
  String name;
  SuperAbility superAbility;

  void extractSuper() {
    print("나는 $name, $superAbility 가지고 있음");
  }

  /**
   * `super man`을 **태어나게 만듭니다.**
   * 
   * ```dart
   * final superMan = SuperMan.bornToBeHero(
   *    name: "슈퍼맨 이름",
   *    superAbility: SuperAbility.cute,
   *    goatLevel: Goat.md,
   * );
   * ```
   * 이제 `super man`은 엄청납니다...
   */
  SuperMan.bornToBeHero({
    required this.name,
    required this.superAbility,
    required Goat goatLevel,
  }) : super.createBlueTeamGoatPlayer(name: name, goatLevel: goatLevel);
}

// mixin class 는 생성자가 없어야 함.
class FastAbility {
  int fast = 1000;

  void fastAbility() {
    print("Im fast as $fast");
  }
}

// mixin class 는 생성자가 없어야 함.
class StrengthAbility {
  int strength = 1000;

  void strengthAbility() {
    print("Im solid as $strength");
  }
}

// with는 mixin class를 조합할 때 사용함
class SuperGoat extends GoatPlayer with StrengthAbility, FastAbility {
  SuperGoat.createRedTeam({required String name, required Goat goatLevel})
      : super.createBlueTeamGoatPlayer(
          name: name,
          goatLevel: goatLevel,
        );

  SuperGoat.createBlueTeam({required String name, required Goat goatLevel})
      : super.createBlueTeamGoatPlayer(
          name: name,
          goatLevel: goatLevel,
        );
}

void main() {
  final bluePlayer = Player.createBlueTeamPlayer(
    name: "june",
  );

  final redPlayer = Player.createRedTeamPlayer(
    name: "ho",
    exp: 10000,
  );

  final justPlayer = Player(
    name: "justhis",
    exp: 1000,
  );

  bluePlayer.sayHello();
  redPlayer.sayHello();

  final superMan = SuperMan.bornToBeHero(
    name: "june",
    superAbility: SuperAbility.cute,
    goatLevel: Goat.lg,
  )
    // cascade operator <.>은 바로 직전의 class instance를 의미함
    ..extractSuper()
    ..fastAbility()
    ..sayHello()
    ..strengthAbility()
    ..toString();

  print(superMan);
}

enum Fruits {
  apple,
  banana,
  kiwi,
  orange,
  strawberry,
}

const Map<Fruits, Map<String, double>> fruits = {
  Fruits.apple: {
    "taste": 1.5,
  },
  Fruits.banana: {
    "taste": 1.25,
  },
  Fruits.kiwi: {
    "taste": 1.15,
  },
  Fruits.orange: {
    "taste": 1.05,
  },
  Fruits.strawberry: {
    "taste": 0.95,
  },
};

enum Sex {
  male,
  female,
}

class Human {
  String name;
  int age;
  double? height;
  double? weight;

  Human({
    required this.name,
    required this.age,
    this.height,
    this.weight,
  });
}

class Female extends Human {
  // 특정 property
  // 특정 method 선언
  Sex sex = Sex.male;

  int getSpeed() {
    return age * 10;
  }

  Female({
    required String name,
    required int age,
    double? weight,
    double? height,
  }) : super(
          name: name,
          age: age,
          weight: weight,
          height: height,
        );
}
