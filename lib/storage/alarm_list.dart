import 'dart:math';

import 'package:mezamashi_denwa/state/alarm_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

enum PreferenceKeys {
  alarmList,
  alarmId,
}

class Storage {
  Storage();

  String _getKey(PreferenceKeys key) {
    switch (key) {
      case PreferenceKeys.alarmList:
        return "alarm_list";
      case PreferenceKeys.alarmId:
        return "alarm_id";
      default:
        return "";
    }
  }

  Future<int> getNextAlarmId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? jsonData =
        prefs.getStringList(_getKey(PreferenceKeys.alarmList));
    if (jsonData != null && jsonData.isNotEmpty) {
      List<Alarm> alarmList =
          jsonData.map((e) => Alarm.fromJson(json.decode(e))).toList();
      Iterable<int> alarmIds = alarmList.map((e) => e.id);
      return alarmIds.reduce(max) + 1;
    } else {
      return 1;
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
    List<Alarm> alarmList =
        jsonData!.map((e) => Alarm.fromJson(json.decode(e))).toList();
    alarmList.removeWhere((element) => element.id == id);
    final newAlarmListJson =
        alarmList.map((e) => json.encode(e.toJson())).toList();
    return await prefs.setStringList(
        _getKey(PreferenceKeys.alarmList), newAlarmListJson);
  }

  Future<bool> updateAlarm(Alarm alarm) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? jsonData =
        prefs.getStringList(_getKey(PreferenceKeys.alarmList));
    List<Alarm> alarmList =
        jsonData!.map((e) => Alarm.fromJson(json.decode(e))).toList();
    int alarmIndex = alarmList.indexWhere((element) => element.id == alarm.id);
    // idが等しいアラームを一度削除
    alarmList.removeAt(alarmIndex);
    // 削除したのちに更新されたアラームを挿入
    alarmList.insert(alarmIndex, alarm);
    final newAlarmListJson =
        alarmList.map((e) => json.encode(e.toJson())).toList();
    return await prefs.setStringList(
        _getKey(PreferenceKeys.alarmList), newAlarmListJson);
  }

  Future<List<Alarm>> getAlarmList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? jsonData =
        prefs.getStringList(_getKey(PreferenceKeys.alarmList));
    if (jsonData != null) {
      return jsonData.map((e) => Alarm.fromJson(json.decode(e))).toList();
    } else {
      return [];
    }
  }
}
