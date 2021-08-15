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
