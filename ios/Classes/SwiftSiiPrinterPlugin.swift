import Flutter
import UIKit

public class SwiftSiiPrinterPlugin: NSObject, FlutterPlugin {
    fileprivate let SII_EXTERNAL_ACCESSORY_PROTOCOL = "com.sii-ps.siieap"
    fileprivate let SEGMENT_BLUETOOTH = 1
    fileprivate var _printer: SIIPrinterManagerWrapper!

    @objc
    internal var _printerTypeSeg: UISegmentedControl!

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "sii_printer_plugin", binaryMessenger: registrar.messenger())
    let instance = SwiftSiiPrinterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      switch call.method {
      case "getPrinters":
          getPrinters(call, result)
      case "connect":
          connect(call, result)
      case "printText":
          printText(call, result)
      case "printTextEx":
          printTextEx(call, result)
      case "printLogo":
          printLogo(call, result)
      case "cutPaper":
          cutPaper(call, result)
      default:
          result(nil)
      }
  }

  private func getPrinters(_ call: FlutterMethodCall,_ result: @escaping FlutterResult) {
      let printerList = NSMutableArray()
      let accessories = EAAccessoryManager.shared().connectedAccessories
      if accessories.count > 0 {
          for obj: EAAccessory in accessories {
              if obj.protocolStrings.index(of: SII_EXTERNAL_ACCESSORY_PROTOCOL) != nil {
                  let macAddressOptional = obj.value(forKey: "macAddress") as? String
                  if macAddressOptional != nil {
                        printerList.add(obj.name)
                  }
              }
          }
      }
      result(printerList)
  }

  private func connect(_ call: FlutterMethodCall,_ result: @escaping FlutterResult) {
      guard let args = call.arguments as? [String : Any] else {return}
      let printerAddress = args["printerAddress"] as! String
      self._printer = SIIPrinterManagerWrapper()
      do {
          try self._printer.connect(SII_PM_PRINTER_MODEL_MP_B20, address: printerAddress, portType: SII_PM_PRINTER_PORT_TYPE_BLUETOOTH)
          result(true)
      } catch {
          result(false)
      }

  }
    
    private func disconnect(_ call: FlutterMethodCall,_ result: @escaping FlutterResult) {
        do {
            try self._printer.disconnect()
            result(true)
        } catch {
            result(false)
        }
    }

    private func printTextEx(_ call: FlutterMethodCall,_ result: @escaping FlutterResult) {
        guard let args = call.arguments as? [String : Any] else {return}
        let text = args["text"] as! String
        let bold = args["characterBold"] as! String
        let reverse = args["characterReverse"] as! String
        let underline = args["characterUnderline"] as! String
        let scale = args["characterScale"] as! String
        let alignment = args["printAlignment"] as! String
        let font = args["characterFont"] as! String
        
        do {
            try self._printer.sendTextEx(
                text,
                bold: MethodUtil.getCharacterBoldFromString(bold),
                underline: MethodUtil.getCharacterUnderlineFromString(underline),
                reverse: MethodUtil.getCharacterReverseFromString(reverse),
                font: MethodUtil.getCharacterFontFromString(font),
                scale: MethodUtil.getCharacterScaleFromString(scale),
                alignment: MethodUtil.getPrintAlignmentFromString(alignment))
            result(true)
        } catch let error as NSError {
            result(MethodUtil.getErrorMessage(Int32(error.code)))
        }
    }

    private func printText(_ call: FlutterMethodCall,_ result: @escaping FlutterResult) {
        guard let args = call.arguments as? [String : Any] else {return}
        let text = args["text"] as! String
        do {
            try self._printer.sendText(text)
            result(true)
        } catch {
            result(false)
        }
    }
    
    private func printLogo(_ call: FlutterMethodCall,_ result: @escaping FlutterResult) {
        let filePath = Bundle.main.path(forResource: "logo", ofType: "jpg")
        do {
            try self._printer.sendDataFile(filePath)
            result(true)
        } catch {
            result(false)
        }
    }

    private func cutPaper(_ call: FlutterMethodCall,_ result: @escaping FlutterResult) {
        do {
            try self._printer.cutPaper(CuttingMethod.SII_PM_CUT_FULL)
            result(true)
        } catch {
            result(false)
        }
    }
}
