import 'package:flutter/material.dart';
import 'package:state_notifier/state_notifier.dart';
import '../alarm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'alarm_list.freezed.dart';

@freezed
class AlarmList with _$AlarmList {
  const factory AlarmList({@Default([]) List<Alarm> alarmList}) = _AlarmList;
}

class AlarmListStateNotifier extends StateNotifier<AlarmList> {
  AlarmListStateNotifier() : super(AlarmList());

  void addAlarmList(Alarm alarm) {
    final newAlarmList = List<Alarm>.from(state.alarmList);
    newAlarmList.add(alarm);
    state = state.copyWith(alarmList: newAlarmList);
  }

  void removeAlarmListItem(int index) {
    final newAlarmList = List<Alarm>.from(state.alarmList);
    newAlarmList.removeAt(index);
    state = state.copyWith(alarmList: newAlarmList);
  }

  void updateAlarmActivate(int index) {
    final newAlarmList = List<Alarm>.from(state.alarmList);
    newAlarmList[index].on = !newAlarmList[index].on;
    state = state.copyWith(alarmList: newAlarmList);
  }
}
