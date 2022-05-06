class BluetoothDevice {
  BluetoothDevice({
    required this.name,
    required this.macAddress,
  });

  final String name;
  final String macAddress;

  factory BluetoothDevice.fromMap(Map<String, dynamic> json) => BluetoothDevice(
        name: json["device_name"],
        macAddress: json["mac_address"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "mac_adress": macAddress,
      };
}
