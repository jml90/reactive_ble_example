import 'dart:async';

import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:reactive_ble/ble/ble_client.dart';
import 'package:rxdart/subjects.dart';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'scan_devices_bloc.freezed.dart';

class ScannDevicesBloc {
  BleClient bleClient = BleClient();
  StreamSubscription _devicesSubscription;

  final _scanDevicesState = BehaviorSubject<ScannDevicesState>();
  Stream<ScannDevicesState> get scanDevices => _scanDevicesState.stream;
  Function(ScannDevicesState) get changeScanDevices =>
      _scanDevicesState.sink.add;

  void dispose() {
    bleClient.dispose();
    _scanDevicesState.close();
  }

  void requestPermission() async {
    bleClient.requestPermission();
  }

  void startScan() {
    changeScanDevices(ScannDevicesScanning([]));
    _devicesSubscription?.cancel();
    _devicesSubscription = bleClient.scanDevices.listen((devices) {
      changeScanDevices(ScannDevicesScanning(devices));
    });
    bleClient.startScan();
  }

  void stopScanning() async {
    changeScanDevices(ScannDevicesStoped());
    await _devicesSubscription?.cancel();
    _devicesSubscription = null;
    bleClient.stopScanning();
  }
}

@freezed
abstract class ScannDevicesState with _$ScannDevicesState {
  const factory ScannDevicesState.stoped() = ScannDevicesStoped;
  const factory ScannDevicesState.scanning(
      List<DiscoveredDevice> discoveredDevices) = ScannDevicesScanning;
}
