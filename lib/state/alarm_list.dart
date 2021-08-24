import 'package:flutter/material.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'alarm_list.freezed.dart';

@freezed
class AlarmList with _$AlarmList {
  const factory AlarmList({@Default([]) List<Alarm> alarmList}) = _AlarmList;
}

@freezed
class Alarm with _$Alarm {
  const factory Alarm(
      {@Default(TimeOfDay(hour: 0, minute: 0)) TimeOfDay time,
      @Default("") String name,
      @Default(false) bool on}) = _Alarm;
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
    final alarm = newAlarmList[index].copyWith(on: !newAlarmList[index].on);
    newAlarmList.replaceRange(index, index + 1, [alarm]);
    state = state.copyWith(alarmList: newAlarmList);
  }
}
