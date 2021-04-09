import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:reactive_ble/app/device_details/logic/device_details_bloc.dart';
import 'package:reactive_ble/widgets/ble_connection_status_bar_widget.dart';

class DeviceDetailsScreen extends StatefulWidget {
  final DiscoveredDevice discoveredDevice;

  DeviceDetailsScreen(this.discoveredDevice);

  @override
  _DeviceDetailsScreenState createState() => _DeviceDetailsScreenState();
}

class _DeviceDetailsScreenState extends State<DeviceDetailsScreen> {
  DeviceDetailsBloc deviceDetailsBloc = DeviceDetailsBloc();

  @override
  void initState() {
    super.initState();
    deviceDetailsBloc.connectToDevice(widget.discoveredDevice.id);
  }

  @override
  void dispose() {
    deviceDetailsBloc.disconnectFromDevice();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DeviceConnectionState>(
      stream: deviceDetailsBloc.getConnectionState(),
      initialData: DeviceConnectionState.disconnected,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.discoveredDevice.id),
            actions: [
              IconButton(
                icon: Icon(snapshot.data == DeviceConnectionState.connected
                    ? Icons.cast_connected
                    : Icons.cast_connected_outlined),
                onPressed: () {
                  if (snapshot.data == DeviceConnectionState.disconnected) {
                    deviceDetailsBloc
                        .connectToDevice(widget.discoveredDevice.id);
                  } else {
                    deviceDetailsBloc.disconnectFromDevice();
                  }
                },
              ),
            ],
          ),
          body: SafeArea(
            child: ListView(
              children: [
                BleConnectionStatusBarWidget(snapshot.data),
                buildBody(snapshot.data),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildBody(DeviceConnectionState deviceConnectionState) {
    switch (deviceConnectionState) {
      case DeviceConnectionState.connected:
        return StreamBuilder<List<DiscoveredService>>(
            stream: deviceDetailsBloc.discoveredServices,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data.isNotEmpty) {
                var discoveredServices = snapshot.data;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: discoveredServices.length,
                  itemBuilder: (context, index) {
                    var currentService = discoveredServices[index];
                    return ExpansionTile(
                      title: ListTile(
                        title: Text(getServiceName(currentService.serviceId)),
                        subtitle: Text('${currentService.serviceId}'),
                      ),
                      children: currentService.characteristicIds
                          .map((uuid) => ListTile(
                                title: Text(getCharacteristicName(uuid)),
                                subtitle: Text('$uuid'),
                                trailing: IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    deviceDetailsBloc.writeCharacteristic(
                                        currentService.serviceId,
                                        uuid,
                                        widget.discoveredDevice.id);
                                  },
                                ),
                                onTap: () async {
                                  deviceDetailsBloc.readCharacteristic(
                                      currentService.serviceId,
                                      uuid,
                                      widget.discoveredDevice.id);
                                },
                              ))
                          .toList(),
                    );
                  },
                );
              } else {
                return Padding(
                  padding: EdgeInsets.all(20),
                  child: TextButton(
                      onPressed: () {
                        deviceDetailsBloc
                            .discoverServices(widget.discoveredDevice.id);
                      },
                      child: Text('Discover Services')),
                );
              }
            });
      case DeviceConnectionState.disconnected:
      case DeviceConnectionState.connecting:
      default:
        return SizedBox();
    }
  }

  String getServiceName(Uuid serviceId) {
    switch (serviceId.toString()) {
      case '1801':
        return 'Generic atribute';

      case '1800':
        return 'Generic Access';

      default:
        return 'Unknown Service';
    }
  }

  String getCharacteristicName(Uuid characteristicId) {
    switch (characteristicId.toString()) {
      case '2a00':
        return 'Device Name';

      case '2a01':
        return 'Appareance';

      default:
        return 'Unknown Characteristic';
    }
  }
}
