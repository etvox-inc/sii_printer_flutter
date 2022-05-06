import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:sii_printer_plugin/bluetooth_device.dart';
import 'package:sii_printer_plugin/type/character_bold.dart';
import 'package:sii_printer_plugin/type/character_font.dart';
import 'package:sii_printer_plugin/type/character_reverse.dart';
import 'package:sii_printer_plugin/type/character_scale.dart';
import 'package:sii_printer_plugin/type/character_underline.dart';
import 'package:sii_printer_plugin/type/print_alignment.dart';
import 'package:sii_printer_plugin/type/sii_error_code.dart';
import 'package:sii_printer_plugin/utils/method_utils.dart';

class SiiPrinterCore {
  static const MethodChannel _channel = MethodChannel('sii_printer_plugin');
  static const EventChannel _devicesEventchannel = EventChannel('sii_printer_plugin_device_event');

  /// @return list of [BluetoothDevice]
  /// Only working in IOS platform
  static Future<List<BluetoothDevice>> getPrintersInIOS() async {
    List<BluetoothDevice> bluetoothDevices = [];
    if (Platform.isIOS) {
      var devices = await _channel.invokeMethod('getPrinters');
      if (devices != null) {
        bluetoothDevices =
            List.from(devices.map((device) => BluetoothDevice.fromMap(Map<String, dynamic>.from(device))));
      }
      return bluetoothDevices;
    }
    throw Exception("Not implement for this platform");
  }

  /// @return list of [BluetoothDevice]
  /// Only working in Android platform
  static Stream<List<BluetoothDevice>> getPrintersInAndroid() {
    if (Platform.isAndroid) {
      return _devicesEventchannel.receiveBroadcastStream().map(
              (devices) => List.from(devices.map((device) => BluetoothDevice.fromMap(Map<String, dynamic>.from(device)))));
    }
    throw Exception("Not implement for this platform");
  }

  static Future<SiiErrorCode> connect(BluetoothDevice bluetoothDevice) async {
    String printerAddress;
    if (Platform.isIOS) {
      printerAddress = bluetoothDevice.name;
    } else {
      printerAddress = bluetoothDevice.macAddress;
    }
    final int statusCode = await _channel.invokeMethod('connect', {"printerAddress": printerAddress});
    var errorCode = MethodUtils.errorName(statusCode);
    debugPrint(errorCode.message);
    return errorCode;
  }

  static Future<SiiErrorCode> printText(String text) async {
    final int statusCode = await _channel.invokeMethod('printText', {"text": text});
    var errorCode = MethodUtils.errorName(statusCode);
    debugPrint(errorCode.message);
    return errorCode;
  }

  static Future<SiiErrorCode> printTextEx(
    String text, {
    CharacterBold characterBold = CharacterBold.normal,
    CharacterUnderline characterUnderline = CharacterUnderline.underlineCancel,
    CharacterReverse characterReverse = CharacterReverse.reverseCancel,
    CharacterScale characterScale = CharacterScale.vartical1Horizontal1,
    PrintAlignment printAlignment = PrintAlignment.alignmentLeft,
    CharacterFont font = CharacterFont.fontA,
  }) async {
    final int statusCode = await _channel.invokeMethod('printTextEx', {
      "text": text,
      "characterBold": characterBold.typeName,
      "characterReverse": characterReverse.typeName,
      "characterUnderline": characterUnderline.typeName,
      "characterScale": characterScale.typeName,
      "printAlignment": printAlignment.typeName,
      "characterFont": font.typeName,
    });
    var errorCode = MethodUtils.errorName(statusCode);
    debugPrint(errorCode.message);
    return errorCode;
  }

  static Future<SiiErrorCode> printLogo(String assetImagePath) async {
    final int statusCode = await _channel.invokeMethod('printLogo', {
      "assets_image": assetImagePath,
    });
    var errorCode = MethodUtils.errorName(statusCode);
    debugPrint(errorCode.message);
    return errorCode;
  }

  static Future<SiiErrorCode> cutPaper() async {
    final int statusCode = await _channel.invokeMethod('cutPaper');
    var errorCode = MethodUtils.errorName(statusCode);
    debugPrint(errorCode.message);
    return errorCode;
  }

  static Future<bool> isConnect() async {
    final isConnecting = await _channel.invokeMethod('isConnect');
    return isConnecting;
  }
}
