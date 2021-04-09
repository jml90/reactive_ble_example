import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:reactive_ble/ble/ble_client.dart';
import 'package:rxdart/subjects.dart';

class DeviceDetailsBloc {
  BleClient bleClient = BleClient();

  final _discoveredServices = BehaviorSubject<List<DiscoveredService>>();
  Stream<List<DiscoveredService>> get discoveredServices =>
      _discoveredServices.stream;
  Function(List<DiscoveredService>) get changeDiscoveredServices =>
      _discoveredServices.sink.add;

  Stream<DeviceConnectionState> getConnectionState() {
    return bleClient.deviceConnectionState;
  }

  void connectToDevice(String deviceId) {
    bleClient.connectToDevice(deviceId);
  }

  void disconnectFromDevice() {
    bleClient.disconnectFromDevice();
  }

  void requestMaxMTU(String deviceId) {
    bleClient.requestMaxMTU(deviceId);
  }

  void discoverServices(String deviceId) async {
    try {
      changeDiscoveredServices(await bleClient.discoverServices(deviceId));
    } catch (e) {
      print(e);
    }
  }

  void readCharacteristic(
      Uuid serviceUuid, Uuid characteristicUuid, String deviceId) async {
    final characteristic = QualifiedCharacteristic(
        serviceId: serviceUuid,
        characteristicId: characteristicUuid,
        deviceId: deviceId);
    final response = await bleClient.readCharacteristic(characteristic);
    print(String.fromCharCodes(response));
  }

  void writeCharacteristic(
      Uuid serviceUuid, Uuid characteristicUuid, String deviceId) async {
    final characteristic = QualifiedCharacteristic(
        serviceId: serviceUuid,
        characteristicId: characteristicUuid,
        deviceId: deviceId);

    try {
      await bleClient.writeCharacteristicWithResponse(characteristic, [0x00]);
    } catch (e) {
      print(e);
    }
  }

  void dispose() {
    _discoveredServices.close();
  }
}
