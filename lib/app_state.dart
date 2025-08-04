import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<String> _test = [
    'Hello World',
    'Hello World1',
    'Hello World2',
    'Hello World',
    'Hello World'
  ];
  List<String> get test => _test;
  set test(List<String> value) {
    _test = value;
  }

  void addToTest(String value) {
    test.add(value);
  }

  void removeFromTest(String value) {
    test.remove(value);
  }

  void removeAtIndexFromTest(int index) {
    test.removeAt(index);
  }

  void updateTestAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    test[index] = updateFn(_test[index]);
  }

  void insertAtIndexInTest(int index, String value) {
    test.insert(index, value);
  }
}
