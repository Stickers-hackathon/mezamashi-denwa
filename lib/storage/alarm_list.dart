import 'package:mezamashi_denwa/state/alarm_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

enum PreferenceKeys {
  alarmList,
}

class Storage {
  String _getKey(PreferenceKeys key) {
    switch (key) {
      case PreferenceKeys.alarmList:
        return "alarm_list";
      default:
        return "";
    }
  }

  Future<bool> addAlarm(Alarm alarm) async {
    final jsonAlarm = json.encode(alarm.toJson());
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? jsonData =
        prefs.getStringList(_getKey(PreferenceKeys.alarmList));
    if (jsonData != null) {
      jsonData.add(jsonAlarm);
    } else {
      jsonData = [jsonAlarm];
    }
    return await prefs.setStringList(
        _getKey(PreferenceKeys.alarmList), jsonData);
  }

  Future<bool> deleteAlarm(int id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? jsonData =
        prefs.getStringList(_getKey(PreferenceKeys.alarmList));
    List<Alarm> alarmList = jsonData!.map((e) => Alarm.fromJson(json.decode(e))).toList();
    alarmList.removeWhere((element) => element.id == id);
    final newAlarmListJson = alarmList.map((e) => json.encode(e.toJson())).toList();
    return await prefs.setStringList(_getKey(PreferenceKeys.alarmList), newAlarmListJson);
  }
}
