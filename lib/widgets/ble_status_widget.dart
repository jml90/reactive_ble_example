import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:permission_handler/permission_handler.dart';

class BleStatusWidget extends StatelessWidget {
  const BleStatusWidget({@required this.status, Key key})
      : assert(status != null),
        super(key: key);

  final BleStatus status;
  final Permission _permission = Permission.locationWhenInUse;

  @override
  Widget build(BuildContext context) => Scaffold(body: buildStatusUI(status));

  Widget buildStatusUI(BleStatus status) {
    switch (status) {
      case BleStatus.unsupported:
        return Center(
          child: Text('This device does not support Bluetooth'),
        );
      case BleStatus.unauthorized:
        return askPermissionsWidget();
      case BleStatus.poweredOff:
        return Center(
          child: Text('Bluetooth is powered off on your device turn it on'),
        );

      case BleStatus.locationServicesDisabled:
        return Text('Enable location services');
      case BleStatus.ready:
        return Center(
          child: Text('Bluetooth is up and running'),
        );

      default:
        return Center(
          child: Text('Waiting to fetch Bluetooth status $status'),
        );
    }
  }

  Widget askPermissionsWidget() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Authorize the Sdk App to use Bluetooth and location'),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {
              await _permission.request();
            },
            child: Text('Enable Bluetooth and Location'),
          ),
        ],
      ),
    );
  }
}
