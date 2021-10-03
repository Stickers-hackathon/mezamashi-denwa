// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Alarm _$_$_AlarmFromJson(Map<String, dynamic> json) {
  return _$_Alarm(
    id: json['id'] as int,
    time: json['time'] as String,
    name: json['name'] as String,
    phoneNumber: json['phoneNumber'] as String,
    on: json['on'] as bool,
  );
}

Map<String, dynamic> _$_$_AlarmToJson(_$_Alarm instance) => <String, dynamic>{
      'id': instance.id,
      'time': instance.time,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'on': instance.on,
    };
