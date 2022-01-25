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
    CharacterBold characterBold = CharacterBold.normal,
    CharacterUnderline characterUnderline = CharacterUnderline.underlineCancel,
    CharacterReverse characterReverse = CharacterReverse.reverseCancel,
    CharacterScale characterScale = CharacterScale.vartical1Horizontal1,
    PrintAlignment printAlignment = PrintAlignment.alignmentLeft,
  }) async {
    final bool isSuccessfull = await _channel.invokeMethod('printTextEx', {
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

  static Future<bool> printLogo() async {
    final bool isSuccessfull = await _channel.invokeMethod('printLogo');
    return isSuccessfull;
  }

  static Future<bool> cutPaper() async {
    final bool isSuccessfull = await _channel.invokeMethod('cutPaper');
    return isSuccessfull;
  }
}
