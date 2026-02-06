// Aquí en real poirdia ser SharedPreferece/ drift /hive
class CounterLocalDatasource {
  int _value = 0;

  Future<int> getValue() async => _value;

  Future<int> increment() async {
    _value++;
    return _value;
  }

  Future<int> decrement() async {
    _value--;
    return _value;
  }
}
