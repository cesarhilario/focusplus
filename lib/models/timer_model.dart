import "package:flutter/material.dart";

enum SessionType { pomo, relaxed, long_relaxed }

class TimerModel extends ChangeNotifier {
  final pomoTime = 1500;
  final relaxedTime = 300;
  final longTime = 1800;

  SessionType _sessionType = SessionType.pomo;
  int _pomoQuantity = 0;
  int _relaxedQuantity = 0;

  set sessionType(SessionType newSessionType) {
    _sessionType = newSessionType;
    notifyListeners();
  }

  SessionType get sessionType {
    return _sessionType;
  }

  set pomoQuantity(int newPomoQuantity) {
    if (newPomoQuantity != _pomoQuantity) {
      _pomoQuantity = newPomoQuantity;
      notifyListeners();
    }
  }

  int get pomoQuantity {
    return _pomoQuantity;
  }

  set relaxedQuantity(int newRelaxedQuantity) {
    if (newRelaxedQuantity != _relaxedQuantity) {
      _relaxedQuantity = newRelaxedQuantity;
      notifyListeners();
    }
  }

  int get relaxedQuantity {
    return _relaxedQuantity;
  }
}