import 'dart:async';

import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/subjects.dart';

class BleClient {
  final flutterReactiveBle = FlutterReactiveBle();
  final Permission _permission = Permission.locationWhenInUse;

  StreamSubscription _scanSubscription;
  StreamSubscription<ConnectionStateUpdate> _connectSubscription;
  final _devices = <DiscoveredDevice>[];

  final _permissionStatus = BehaviorSubject<PermissionStatus>();
  Stream<PermissionStatus> get permissionStatus => _permissionStatus.stream;
  Function(PermissionStatus) get changePermissionStatus =>
      _permissionStatus.sink.add;

  final _scanDevices = BehaviorSubject<List<DiscoveredDevice>>();
  Stream<List<DiscoveredDevice>> get scanDevices => _scanDevices.stream;
  Function(List<DiscoveredDevice>) get changeScanDevices =>
      _scanDevices.sink.add;

  final _deviceConnectionState = BehaviorSubject<DeviceConnectionState>();
  Stream<DeviceConnectionState> get deviceConnectionState =>
      _deviceConnectionState.stream;
  Function(DeviceConnectionState) get changeDeviceConnectionState =>
      _deviceConnectionState.sink.add;

  void checkPermissionStatus() async {
    var permissionStatus = await _permission.status;
    changePermissionStatus(permissionStatus);
  }

  void requestPermission() async {
    changePermissionStatus(await _permission.request());
  }

  void startScan() {
    _devices.clear();
    _scanSubscription?.cancel();
    _scanSubscription =
        flutterReactiveBle.scanForDevices(withServices: []).listen((device) {
      final knownDeviceIndex = _devices.indexWhere((d) => d.id == device.id);
      if (knownDeviceIndex >= 0) {
        _devices[knownDeviceIndex] = device;
      } else {
        _devices.add(device);
      }
      changeScanDevices(_devices);
    });
    changeScanDevices([]);
  }

  void stopScanning() async {
    await _scanSubscription?.cancel();
    _scanSubscription = null;
  }

  void connectToDevice(String deviceId) {
    _connectSubscription?.cancel();
    _connectSubscription = flutterReactiveBle
        .connectToDevice(
      id: deviceId,
      connectionTimeout: const Duration(seconds: 2),
    )
        .listen((connectionState) {
      print(connectionState.connectionState.toString());
      changeDeviceConnectionState(connectionState.connectionState);
      // Handle connection state updates
    }, onError: (Object error) {
      print(error);
      // Handle a possible error
    });
  }

  Future<int> requestMaxMTU(String deviceId) async {
    return await flutterReactiveBle.requestMtu(deviceId: deviceId, mtu: 512);
  }

  Future<List<DiscoveredService>> discoverServices(String deviceId) async {
    return await flutterReactiveBle.discoverServices(deviceId);
  }

  void disconnectFromDevice() {
    changeDeviceConnectionState(DeviceConnectionState.disconnected);
    _connectSubscription.cancel();
  }

  void dispose() {
    _permissionStatus.close();
    _scanDevices.close();
    _deviceConnectionState.close();
  }

  Future<List<int>> readCharacteristic(
      QualifiedCharacteristic characteristic) async {
    return await flutterReactiveBle.readCharacteristic(characteristic);
  }

  Future<void> writeCharacteristicWithResponse(
      QualifiedCharacteristic characteristic, List<int> value) async {
    return await flutterReactiveBle
        .writeCharacteristicWithResponse(characteristic, value: value);
  }

  Stream<List<int>> subscribeToCharacteristic(
      QualifiedCharacteristic characteristic) {
    return flutterReactiveBle.subscribeToCharacteristic(characteristic);
  }
}
