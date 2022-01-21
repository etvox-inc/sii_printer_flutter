import 'package:flutter/services.dart';

class SiiPrinterCore {
  static const MethodChannel _channel =
      MethodChannel('sii_printer_plugin');

  static Future<List<dynamic>?> getPrinters() async {
    final List<dynamic>? printers = await _channel.invokeMethod('getPrinters');
    return printers;
  }

  static Future<bool> connect(String printerAddress) async {
    final bool isConnected = await _channel.invokeMethod('connect', {
      "printerAddress" : printerAddress
    });
    return isConnected;
  }
}