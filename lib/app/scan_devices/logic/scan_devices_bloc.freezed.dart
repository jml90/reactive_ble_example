// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'scan_devices_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ScannDevicesStateTearOff {
  const _$ScannDevicesStateTearOff();

// ignore: unused_element
  ScannDevicesStoped stoped() {
    return const ScannDevicesStoped();
  }

// ignore: unused_element
  ScannDevicesScanning scanning(List<DiscoveredDevice> discoveredDevices) {
    return ScannDevicesScanning(
      discoveredDevices,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ScannDevicesState = _$ScannDevicesStateTearOff();

/// @nodoc
mixin _$ScannDevicesState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult stoped(),
    @required TResult scanning(List<DiscoveredDevice> discoveredDevices),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult stoped(),
    TResult scanning(List<DiscoveredDevice> discoveredDevices),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult stoped(ScannDevicesStoped value),
    @required TResult scanning(ScannDevicesScanning value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult stoped(ScannDevicesStoped value),
    TResult scanning(ScannDevicesScanning value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $ScannDevicesStateCopyWith<$Res> {
  factory $ScannDevicesStateCopyWith(
          ScannDevicesState value, $Res Function(ScannDevicesState) then) =
      _$ScannDevicesStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ScannDevicesStateCopyWithImpl<$Res>
    implements $ScannDevicesStateCopyWith<$Res> {
  _$ScannDevicesStateCopyWithImpl(this._value, this._then);

  final ScannDevicesState _value;
  // ignore: unused_field
  final $Res Function(ScannDevicesState) _then;
}

/// @nodoc
abstract class $ScannDevicesStopedCopyWith<$Res> {
  factory $ScannDevicesStopedCopyWith(
          ScannDevicesStoped value, $Res Function(ScannDevicesStoped) then) =
      _$ScannDevicesStopedCopyWithImpl<$Res>;
}

/// @nodoc
class _$ScannDevicesStopedCopyWithImpl<$Res>
    extends _$ScannDevicesStateCopyWithImpl<$Res>
    implements $ScannDevicesStopedCopyWith<$Res> {
  _$ScannDevicesStopedCopyWithImpl(
      ScannDevicesStoped _value, $Res Function(ScannDevicesStoped) _then)
      : super(_value, (v) => _then(v as ScannDevicesStoped));

  @override
  ScannDevicesStoped get _value => super._value as ScannDevicesStoped;
}

/// @nodoc
class _$ScannDevicesStoped
    with DiagnosticableTreeMixin
    implements ScannDevicesStoped {
  const _$ScannDevicesStoped();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ScannDevicesState.stoped()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'ScannDevicesState.stoped'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ScannDevicesStoped);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult stoped(),
    @required TResult scanning(List<DiscoveredDevice> discoveredDevices),
  }) {
    assert(stoped != null);
    assert(scanning != null);
    return stoped();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult stoped(),
    TResult scanning(List<DiscoveredDevice> discoveredDevices),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (stoped != null) {
      return stoped();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult stoped(ScannDevicesStoped value),
    @required TResult scanning(ScannDevicesScanning value),
  }) {
    assert(stoped != null);
    assert(scanning != null);
    return stoped(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult stoped(ScannDevicesStoped value),
    TResult scanning(ScannDevicesScanning value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (stoped != null) {
      return stoped(this);
    }
    return orElse();
  }
}

abstract class ScannDevicesStoped implements ScannDevicesState {
  const factory ScannDevicesStoped() = _$ScannDevicesStoped;
}

/// @nodoc
abstract class $ScannDevicesScanningCopyWith<$Res> {
  factory $ScannDevicesScanningCopyWith(ScannDevicesScanning value,
          $Res Function(ScannDevicesScanning) then) =
      _$ScannDevicesScanningCopyWithImpl<$Res>;
  $Res call({List<DiscoveredDevice> discoveredDevices});
}

/// @nodoc
class _$ScannDevicesScanningCopyWithImpl<$Res>
    extends _$ScannDevicesStateCopyWithImpl<$Res>
    implements $ScannDevicesScanningCopyWith<$Res> {
  _$ScannDevicesScanningCopyWithImpl(
      ScannDevicesScanning _value, $Res Function(ScannDevicesScanning) _then)
      : super(_value, (v) => _then(v as ScannDevicesScanning));

  @override
  ScannDevicesScanning get _value => super._value as ScannDevicesScanning;

  @override
  $Res call({
    Object discoveredDevices = freezed,
  }) {
    return _then(ScannDevicesScanning(
      discoveredDevices == freezed
          ? _value.discoveredDevices
          : discoveredDevices as List<DiscoveredDevice>,
    ));
  }
}

/// @nodoc
class _$ScannDevicesScanning
    with DiagnosticableTreeMixin
    implements ScannDevicesScanning {
  const _$ScannDevicesScanning(this.discoveredDevices)
      : assert(discoveredDevices != null);

  @override
  final List<DiscoveredDevice> discoveredDevices;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ScannDevicesState.scanning(discoveredDevices: $discoveredDevices)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ScannDevicesState.scanning'))
      ..add(DiagnosticsProperty('discoveredDevices', discoveredDevices));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ScannDevicesScanning &&
            (identical(other.discoveredDevices, discoveredDevices) ||
                const DeepCollectionEquality()
                    .equals(other.discoveredDevices, discoveredDevices)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(discoveredDevices);

  @JsonKey(ignore: true)
  @override
  $ScannDevicesScanningCopyWith<ScannDevicesScanning> get copyWith =>
      _$ScannDevicesScanningCopyWithImpl<ScannDevicesScanning>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult stoped(),
    @required TResult scanning(List<DiscoveredDevice> discoveredDevices),
  }) {
    assert(stoped != null);
    assert(scanning != null);
    return scanning(discoveredDevices);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult stoped(),
    TResult scanning(List<DiscoveredDevice> discoveredDevices),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (scanning != null) {
      return scanning(discoveredDevices);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult stoped(ScannDevicesStoped value),
    @required TResult scanning(ScannDevicesScanning value),
  }) {
    assert(stoped != null);
    assert(scanning != null);
    return scanning(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult stoped(ScannDevicesStoped value),
    TResult scanning(ScannDevicesScanning value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (scanning != null) {
      return scanning(this);
    }
    return orElse();
  }
}

abstract class ScannDevicesScanning implements ScannDevicesState {
  const factory ScannDevicesScanning(List<DiscoveredDevice> discoveredDevices) =
      _$ScannDevicesScanning;

  List<DiscoveredDevice> get discoveredDevices;
  @JsonKey(ignore: true)
  $ScannDevicesScanningCopyWith<ScannDevicesScanning> get copyWith;
}
