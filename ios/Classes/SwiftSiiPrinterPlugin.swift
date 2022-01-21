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
}
