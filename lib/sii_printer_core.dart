import 'package:flutter/services.dart';
import 'package:sii_printer_plugin/type/character_bold.dart';
import 'package:sii_printer_plugin/type/character_reverse.dart';
import 'package:sii_printer_plugin/type/character_scale.dart';
import 'package:sii_printer_plugin/type/character_underline.dart';
import 'package:sii_printer_plugin/type/print_alignment.dart';

class SiiPrinterCore {
  static const MethodChannel _channel = MethodChannel('sii_printer_plugin');

  static Future<List<dynamic>?> getPrinters() async {
    final List<dynamic>? printers = await _channel.invokeMethod('getPrinters');
    return printers;
  }

  static Future<bool> connect(String printerAddress) async {
    final bool isConnected = await _channel.invokeMethod('connect', {"printerAddress": printerAddress});
    return isConnected;
  }

  static Future<bool> printText(String text) async {
    final bool isSuccessfull = await _channel.invokeMethod('printText', {"text": text});
    return isSuccessfull;
  }

  static Future<bool> printTextEx(
    String text, {
    required CharacterBold characterBold,
    required CharacterUnderline characterUnderline,
    required CharacterReverse characterReverse,
    required CharacterScale characterScale,
    required PrintAlignment printAlignment,
  }) async {
    final bool isSuccessfull = await _channel.invokeMethod('printText', {
      "text": text,
      "characterBold": characterBold.typeName,
      "characterReverse": characterReverse.typeName,
      "characterUnderline": characterUnderline.typeName,
      "characterScale": characterScale.typeName,
      "printAlignment": printAlignment.typeName,
      "characterFont": printAlignment.typeName,
    });
    return isSuccessfull;
  }

  static Future<bool> printBase64Image(String base64,
      {PrintAlignment printAlignment = PrintAlignment.alignmentCenter}) async {
    final bool isSuccessfull = await _channel.invokeMethod('printBase64Image', {
      "imageData": base64,
    });
    return isSuccessfull;
  }

  static Future<bool> cutPaper() async {
    final bool isSuccessfull = await _channel.invokeMethod('cutPaper');
    return isSuccessfull;
  }
}
