import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:reactive_ble/app/device_details/device_details_screen.dart';
import 'package:reactive_ble/app/scan_devices/logic/scan_devices_bloc.dart';

class ScanDevicesScreen extends StatefulWidget {
  @override
  _ScanDevicesScreenState createState() => _ScanDevicesScreenState();
}

class _ScanDevicesScreenState extends State<ScanDevicesScreen> {
  ScannDevicesBloc scannDevicesBloc = ScannDevicesBloc();

  @override
  void dispose() {
    scannDevicesBloc.stopScanning();
    scannDevicesBloc.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    scannDevicesBloc.bleClient.checkPermissionStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Device searcher'),
        actions: [],
      ),
      body: SafeArea(
        child: StreamBuilder<ScannDevicesState>(
          initialData: ScannDevicesStoped(),
          stream: scannDevicesBloc.scanDevices,
          builder: (context, AsyncSnapshot<ScannDevicesState> snapshot) {
            return snapshot.data.when(
              stoped: () {
                return initialUi();
              },
              scanning: (discoveredDevices) {
                if (discoveredDevices.isEmpty) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return discoveredDevicesList(discoveredDevices);
              },
            );
          },
        ),
      ),
    );
  }

  Widget discoveredDevicesList(List<DiscoveredDevice> discoveredDevices) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: discoveredDevices.length,
            itemBuilder: (context, index) {
              var discoveredDevice = discoveredDevices[index];

              return ListTile(
                title: Text(discoveredDevice.id ?? '-'),
                leading: Text(discoveredDevice.name ?? ''),
                subtitle: Text(discoveredDevice.rssi.toString() ?? '-'),
                trailing: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return DeviceDetailsScreen(discoveredDevice);
                        },
                      ));
                    },
                    child: Text('Connect')),
              );
            },
          ),
        ),
        Container(
          width: double.infinity,
          child: ElevatedButton(
            child: Text("Stop Scanning"),
            onPressed: () {
              scannDevicesBloc.stopScanning();
            },
          ),
        )
      ],
    );
  }

  Widget initialUi() {
    return StreamBuilder<PermissionStatus>(
        stream: scannDevicesBloc.bleClient.permissionStatus,
        builder: (context, snapshot) {
          return Center(
            child: OutlinedButton(
              onPressed: () async {
                if (snapshot.hasData && snapshot.data.isGranted) {
                  scannDevicesBloc.startScan();
                } else {
                  scannDevicesBloc.requestPermission();
                }
              },
              child: Text('Start searching'),
            ),
          );
        });
  }
}
