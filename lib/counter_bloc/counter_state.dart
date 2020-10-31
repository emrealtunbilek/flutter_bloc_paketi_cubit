class CounterState {
  final int _sayac;

  CounterState(this._sayac);

  int get sayac => _sayac;

  @override
  String toString() {
    // TODO: implement toString
    return "counter state:$_sayac";
  }
}
