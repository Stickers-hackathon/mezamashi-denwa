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

/// @nodoc
class _$AlarmTearOff {
  const _$AlarmTearOff();

  _Alarm call(
      {String time = "",
      String name = "",
      String phoneNumber = "",
      bool on = false}) {
    return _Alarm(
      time: time,
      name: name,
      phoneNumber: phoneNumber,
      on: on,
    );
  }
}

/// @nodoc
const $Alarm = _$AlarmTearOff();

/// @nodoc
mixin _$Alarm {
  String get time => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  bool get on => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AlarmCopyWith<Alarm> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlarmCopyWith<$Res> {
  factory $AlarmCopyWith(Alarm value, $Res Function(Alarm) then) =
      _$AlarmCopyWithImpl<$Res>;
  $Res call({String time, String name, String phoneNumber, bool on});
}

/// @nodoc
class _$AlarmCopyWithImpl<$Res> implements $AlarmCopyWith<$Res> {
  _$AlarmCopyWithImpl(this._value, this._then);

  final Alarm _value;
  // ignore: unused_field
  final $Res Function(Alarm) _then;

  @override
  $Res call({
    Object? time = freezed,
    Object? name = freezed,
    Object? phoneNumber = freezed,
    Object? on = freezed,
  }) {
    return _then(_value.copyWith(
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
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
  $Res call({String time, String name, String phoneNumber, bool on});
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
    Object? time = freezed,
    Object? name = freezed,
    Object? phoneNumber = freezed,
    Object? on = freezed,
  }) {
    return _then(_Alarm(
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      on: on == freezed
          ? _value.on
          : on // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Alarm with DiagnosticableTreeMixin implements _Alarm {
  const _$_Alarm(
      {this.time = "", this.name = "", this.phoneNumber = "", this.on = false});

  @JsonKey(defaultValue: "")
  @override
  final String time;
  @JsonKey(defaultValue: "")
  @override
  final String name;
  @JsonKey(defaultValue: "")
  @override
  final String phoneNumber;
  @JsonKey(defaultValue: false)
  @override
  final bool on;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Alarm(time: $time, name: $name, phoneNumber: $phoneNumber, on: $on)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Alarm'))
      ..add(DiagnosticsProperty('time', time))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('phoneNumber', phoneNumber))
      ..add(DiagnosticsProperty('on', on));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Alarm &&
            (identical(other.time, time) ||
                const DeepCollectionEquality().equals(other.time, time)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.on, on) ||
                const DeepCollectionEquality().equals(other.on, on)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(time) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(on);

  @JsonKey(ignore: true)
  @override
  _$AlarmCopyWith<_Alarm> get copyWith =>
      __$AlarmCopyWithImpl<_Alarm>(this, _$identity);
}

abstract class _Alarm implements Alarm {
  const factory _Alarm(
      {String time, String name, String phoneNumber, bool on}) = _$_Alarm;

  @override
  String get time => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get phoneNumber => throw _privateConstructorUsedError;
  @override
  bool get on => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AlarmCopyWith<_Alarm> get copyWith => throw _privateConstructorUsedError;
}
