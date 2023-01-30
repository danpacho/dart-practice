void main() {
  final state = GState<int>.init(
    initial: 0,
    getter: ((int id) => id),
    setter: (int prev) => prev,
  );

  final value = state.get(1);
  final list = [
    1,
    2,
    3,
    4,
  ];

  var isTrue = true;
  final collectionList = [
    1,
    2,
    3,
    if (isTrue) 4,
    for (final nums in list) "$nums+1",
  ];

  print(value);
  print(collectionList);
}

/**
 * add numbers
 */
int add(int num1, int num2) => num1 + num2;

typedef FruitsSet = List<Map<String, int>>;

typedef Setter<Return> = Return Function(Return prev);
typedef Getter<T> = T Function(int id);
typedef StoreValue<T> = Map<int, T>;
typedef Store<T> = List<StoreValue<T>>;

class GState<T> {
  final T initial;
  final Getter<T> getter;
  final Setter<T> setter;

  Store<T> store = [];
  int currentId = 0;

  GState.init(
      {required T this.initial,
      required Getter<T> this.getter,
      required Setter<T> this.setter});

  void set(T state) {
    currentId++;
    final T update = setter(state);
    final StoreValue<T> updateStoreValue = {currentId: update};

    store.add(updateStoreValue);
  }

  T get(int id) {
    final T inquired = getter(id);
    return inquired;
  }

  int $id() {
    return currentId;
  }
}

final get = GState.init(
  initial: 1,
  getter: (id) {
    return id++;
  },
  setter: (prev) {
    return prev;
  },
);

int getNumber(List<int> numbers) {
  return numbers.reduce((value, element) => value + element);
}

typedef GetNumber = int Function(List<int> numbers);
