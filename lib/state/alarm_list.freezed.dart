// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'alarm_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AlarmListTearOff {
  const _$AlarmListTearOff();

  _AlarmList call({List<Alarm> alarmList = const []}) {
    return _AlarmList(
      alarmList: alarmList,
    );
  }
}

/// @nodoc
const $AlarmList = _$AlarmListTearOff();

/// @nodoc
mixin _$AlarmList {
  List<Alarm> get alarmList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AlarmListCopyWith<AlarmList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlarmListCopyWith<$Res> {
  factory $AlarmListCopyWith(AlarmList value, $Res Function(AlarmList) then) =
      _$AlarmListCopyWithImpl<$Res>;
  $Res call({List<Alarm> alarmList});
}

/// @nodoc
class _$AlarmListCopyWithImpl<$Res> implements $AlarmListCopyWith<$Res> {
  _$AlarmListCopyWithImpl(this._value, this._then);

  final AlarmList _value;
  // ignore: unused_field
  final $Res Function(AlarmList) _then;

  @override
  $Res call({
    Object? alarmList = freezed,
  }) {
    return _then(_value.copyWith(
      alarmList: alarmList == freezed
          ? _value.alarmList
          : alarmList // ignore: cast_nullable_to_non_nullable
              as List<Alarm>,
    ));
  }
}

/// @nodoc
abstract class _$AlarmListCopyWith<$Res> implements $AlarmListCopyWith<$Res> {
  factory _$AlarmListCopyWith(
          _AlarmList value, $Res Function(_AlarmList) then) =
      __$AlarmListCopyWithImpl<$Res>;
  @override
  $Res call({List<Alarm> alarmList});
}

/// @nodoc
class __$AlarmListCopyWithImpl<$Res> extends _$AlarmListCopyWithImpl<$Res>
    implements _$AlarmListCopyWith<$Res> {
  __$AlarmListCopyWithImpl(_AlarmList _value, $Res Function(_AlarmList) _then)
      : super(_value, (v) => _then(v as _AlarmList));

  @override
  _AlarmList get _value => super._value as _AlarmList;

  @override
  $Res call({
    Object? alarmList = freezed,
  }) {
    return _then(_AlarmList(
      alarmList: alarmList == freezed
          ? _value.alarmList
          : alarmList // ignore: cast_nullable_to_non_nullable
              as List<Alarm>,
    ));
  }
}

/// @nodoc

class _$_AlarmList with DiagnosticableTreeMixin implements _AlarmList {
  const _$_AlarmList({this.alarmList = const []});

  @JsonKey(defaultValue: const [])
  @override
  final List<Alarm> alarmList;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AlarmList(alarmList: $alarmList)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AlarmList'))
      ..add(DiagnosticsProperty('alarmList', alarmList));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AlarmList &&
            (identical(other.alarmList, alarmList) ||
                const DeepCollectionEquality()
                    .equals(other.alarmList, alarmList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(alarmList);

  @JsonKey(ignore: true)
  @override
  _$AlarmListCopyWith<_AlarmList> get copyWith =>
      __$AlarmListCopyWithImpl<_AlarmList>(this, _$identity);
}

abstract class _AlarmList implements AlarmList {
  const factory _AlarmList({List<Alarm> alarmList}) = _$_AlarmList;

  @override
  List<Alarm> get alarmList => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AlarmListCopyWith<_AlarmList> get copyWith =>
      throw _privateConstructorUsedError;
}

Alarm _$AlarmFromJson(Map<String, dynamic> json) {
  return _Alarm.fromJson(json);
}

/// @nodoc
class _$AlarmTearOff {
  const _$AlarmTearOff();

  _Alarm call(
      {@JsonKey(name: "id") int id = 0,
      @JsonKey(name: "time") String time = "",
      @JsonKey(name: "name") String name = "",
      @JsonKey(name: "on") bool on = false}) {
    return _Alarm(
      id: id,
      time: time,
      name: name,
      on: on,
    );
  }

  Alarm fromJson(Map<String, Object> json) {
    return Alarm.fromJson(json);
  }
}

/// @nodoc
const $Alarm = _$AlarmTearOff();

/// @nodoc
mixin _$Alarm {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "time")
  String get time => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "on")
  bool get on => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlarmCopyWith<Alarm> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlarmCopyWith<$Res> {
  factory $AlarmCopyWith(Alarm value, $Res Function(Alarm) then) =
      _$AlarmCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "time") String time,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "on") bool on});
}

/// @nodoc
class _$AlarmCopyWithImpl<$Res> implements $AlarmCopyWith<$Res> {
  _$AlarmCopyWithImpl(this._value, this._then);

  final Alarm _value;
  // ignore: unused_field
  final $Res Function(Alarm) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? time = freezed,
    Object? name = freezed,
    Object? on = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      on: on == freezed
          ? _value.on
          : on // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$AlarmCopyWith<$Res> implements $AlarmCopyWith<$Res> {
  factory _$AlarmCopyWith(_Alarm value, $Res Function(_Alarm) then) =
      __$AlarmCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "time") String time,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "on") bool on});
}

/// @nodoc
class __$AlarmCopyWithImpl<$Res> extends _$AlarmCopyWithImpl<$Res>
    implements _$AlarmCopyWith<$Res> {
  __$AlarmCopyWithImpl(_Alarm _value, $Res Function(_Alarm) _then)
      : super(_value, (v) => _then(v as _Alarm));

  @override
  _Alarm get _value => super._value as _Alarm;

  @override
  $Res call({
    Object? id = freezed,
    Object? time = freezed,
    Object? name = freezed,
    Object? on = freezed,
  }) {
    return _then(_Alarm(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      on: on == freezed
          ? _value.on
          : on // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Alarm with DiagnosticableTreeMixin implements _Alarm {
  const _$_Alarm(
      {@JsonKey(name: "id") this.id = 0,
      @JsonKey(name: "time") this.time = "",
      @JsonKey(name: "name") this.name = "",
      @JsonKey(name: "on") this.on = false});

  factory _$_Alarm.fromJson(Map<String, dynamic> json) =>
      _$_$_AlarmFromJson(json);

  @override
  @JsonKey(name: "id")
  final int id;
  @override
  @JsonKey(name: "time")
  final String time;
  @override
  @JsonKey(name: "name")
  final String name;
  @override
  @JsonKey(name: "on")
  final bool on;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Alarm(id: $id, time: $time, name: $name, on: $on)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Alarm'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('time', time))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('on', on));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Alarm &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.time, time) ||
                const DeepCollectionEquality().equals(other.time, time)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.on, on) ||
                const DeepCollectionEquality().equals(other.on, on)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(time) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(on);

  @JsonKey(ignore: true)
  @override
  _$AlarmCopyWith<_Alarm> get copyWith =>
      __$AlarmCopyWithImpl<_Alarm>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AlarmToJson(this);
  }
}

abstract class _Alarm implements Alarm {
  const factory _Alarm(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "time") String time,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "on") bool on}) = _$_Alarm;

  factory _Alarm.fromJson(Map<String, dynamic> json) = _$_Alarm.fromJson;

  @override
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "time")
  String get time => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "on")
  bool get on => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AlarmCopyWith<_Alarm> get copyWith => throw _privateConstructorUsedError;
}
