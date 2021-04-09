import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

class BleConnectionStatusBarWidget extends StatelessWidget {
  final DeviceConnectionState deviceConnectionState;

  BleConnectionStatusBarWidget(this.deviceConnectionState);

  @override
  Widget build(BuildContext context) {
    switch (deviceConnectionState) {
      case DeviceConnectionState.disconnected:
        return Container(
          padding: EdgeInsets.all(16),
          color: Colors.red,
          child: Text(deviceConnectionState.toString()),
        );
      case DeviceConnectionState.connecting:
        return Container(
          padding: EdgeInsets.all(16),
          color: Colors.yellow,
          child: Text(deviceConnectionState.toString()),
        );
      case DeviceConnectionState.connected:
        return Container(
          padding: EdgeInsets.all(16),
          color: Colors.green,
          child: Text(deviceConnectionState.toString()),
        );

      default:
        return Container(
          color: Colors.red,
          child: Text(deviceConnectionState.toString()),
        );
    }
  }
}
