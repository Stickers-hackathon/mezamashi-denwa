import 'package:flutter/material.dart';
import '../alarm.dart';

class AlarmList extends ChangeNotifier {
  var _alarmList = <Alarm>[];

  void pushAlarmList(Alarm alarm) {
    _alarmList.add(alarm);
    notifyListeners();
  }

  void removeAlarmListItem(int index) {
    _alarmList.removeAt(index);
    notifyListeners();
  }

  void updateAlarmActivate(int index) {
    _alarmList[index].on = !_alarmList[index].on;
    notifyListeners();
  }

  int getAlarmListLength() {
    return _alarmList.length;
  }

  bool getAlarmActiveInfo(int index) {
    return _alarmList[index].on;
  }

  String getAlarmTime(int index) {
    return _alarmList[index].time;
  }

  String getAlarmName(int index) {
    return _alarmList[index].name;
  }
}
