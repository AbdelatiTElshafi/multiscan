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

  List<String> _scannedCodes1 = [];
  List<String> get scannedCodes1 => _scannedCodes1;
  set scannedCodes1(List<String> value) {
    _scannedCodes1 = value;
  }

  void addToScannedCodes1(String value) {
    scannedCodes1.add(value);
  }

  void removeFromScannedCodes1(String value) {
    scannedCodes1.remove(value);
  }

  void removeAtIndexFromScannedCodes1(int index) {
    scannedCodes1.removeAt(index);
  }

  void updateScannedCodes1AtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    scannedCodes1[index] = updateFn(_scannedCodes1[index]);
  }

  void insertAtIndexInScannedCodes1(int index, String value) {
    scannedCodes1.insert(index, value);
  }
}
