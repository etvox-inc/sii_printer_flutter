import 'package:flutter/services.dart';
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

  static Future<List<dynamic>?> getPrinters() async {
    final List<dynamic>? printers = await _channel.invokeMethod('getPrinters');
    return printers;
  }

  static Future<SiiErrorCode> connect(String printerAddress) async {
    final int statusCode = await _channel.invokeMethod('connect', {"printerAddress": printerAddress});
    var errorCode = MethodUtils.errorName(statusCode);
    print(errorCode.message);
    return errorCode;
  }

  static Future<SiiErrorCode> printText(String text) async {
    final int statusCode = await _channel.invokeMethod('printText', {"text": text});
    var errorCode = MethodUtils.errorName(statusCode);
    print(errorCode.message);
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
    print(errorCode.message);
    return errorCode;
  }

  static Future<SiiErrorCode> printLogo(String assetImagePath) async {
    final int statusCode = await _channel.invokeMethod('printLogo', {
      "assets_image": assetImagePath,
    });
    var errorCode = MethodUtils.errorName(statusCode);
    print(errorCode.message);
    return errorCode;
  }

  static Future<SiiErrorCode> cutPaper() async {
    final int statusCode = await _channel.invokeMethod('cutPaper');
    var errorCode = MethodUtils.errorName(statusCode);
    print(errorCode.message);
    return errorCode;
  }

  static Future<bool> isConnect() async {
    final isConnecting = await _channel.invokeMethod('isConnect');
    return isConnecting;
  }
}
