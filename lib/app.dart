import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:reactive_ble/app/scan_devices/screens/scan_devices_screen.dart';
import 'package:reactive_ble/widgets/ble_status_widget.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final FlutterReactiveBle _flutterReactiveBle = FlutterReactiveBle();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SDK App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder<BleStatus>(
        initialData: BleStatus.unknown,
        stream: _flutterReactiveBle.statusStream,
        builder: (context, snapshot) {
          if (snapshot.data == BleStatus.ready) {
            return ScanDevicesScreen();
          } else {
            return BleStatusWidget(status: snapshot.data);
          }
        },
      ),
    );
  }
}
