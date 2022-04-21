package com.siiprinter.sii_printer_plugin

import android.bluetooth.BluetoothAdapter
import android.content.Context
import android.util.Log
import androidx.annotation.NonNull
import com.seikoinstruments.sdk.thermalprinter.*
import com.seikoinstruments.sdk.thermalprinter.printerenum.CuttingMethod
import com.seikoinstruments.sdk.thermalprinter.printerenum.Dithering
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import java.util.*
import kotlin.collections.ArrayList


/** SiiPrinterPlugin */
class SiiPrinterPlugin : FlutterPlugin, MethodCallHandler, EventChannel.StreamHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private lateinit var devicesEventChannel: EventChannel

    /** PrinterManager SDK  */
    private var mPrinterManager: PrinterManager? = null
    private var mContext: Context? = null
    private val model: Int = PrinterManager.PRINTER_MODEL_MP_B20
    private val successfulStatus = 0
    private lateinit var mFlutterPluginBinding: FlutterPlugin.FlutterPluginBinding

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "sii_printer_plugin")
        channel.setMethodCallHandler(this)
        mContext = flutterPluginBinding.applicationContext
        mFlutterPluginBinding = flutterPluginBinding

        devicesEventChannel = EventChannel(flutterPluginBinding.binaryMessenger, "sii_printer_plugin_device_event")
        devicesEventChannel.setStreamHandler(this)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        when (call.method) {
            "connect" -> connect(call, result)
            "printText" -> printText(call, result)
            "printTextEx" -> printTextEx(call, result)
            "printLogo" -> printLogo(call, result)
            "cutPaper" -> cutPaper(call, result)
            "isConnect" -> isConnect(call, result)
            else -> result.notImplemented()
        }
    }

    private fun isConnect(@NonNull call: MethodCall, @NonNull result: Result) {
        if (mPrinterManager == null) {
            result.success(false)
            return
        }
        result.success(mPrinterManager!!.isConnect)
    }

    private fun cutPaper(@NonNull call: MethodCall, @NonNull result: Result) {
        try {
            mPrinterManager?.cutPaper(CuttingMethod.CUT_FULL)
            result.success(successfulStatus)
        } catch (e: PrinterException) {
            result.success(e.errorCode)
        }
    }

    private fun printLogo(@NonNull call: MethodCall, @NonNull result: Result) {
        val args = call.arguments as? Map<*, *> ?: return
        val assetsImage = args["assets_image"] as String
        try {
            val filePath = mFlutterPluginBinding.flutterAssets.getAssetFilePathByName(assetsImage)
            mPrinterManager?.sendDataFile(filePath, Dithering.DITHERING_ERRORDIFFUSION)
            result.success(successfulStatus)
        } catch (e: PrinterException) {
            result.success(e.errorCode)
        }
    }

    private fun printTextEx(@NonNull call: MethodCall, @NonNull result: Result) {
        val args = call.arguments as? Map<*, *> ?: return
        val text = args["text"] as String
        val bold = args["characterBold"] as String
        val reverse = args["characterReverse"] as String
        val underline = args["characterUnderline"] as String
        val scale = args["characterScale"] as String
        val alignment = args["printAlignment"] as String
        val font = args["characterFont"] as String

        try {
            mPrinterManager?.sendTextEx(
                text,
                MethodUtil.getCharacterBoldFromString(bold),
                MethodUtil.getCharacterUnderlineFromString(underline),
                MethodUtil.getCharacterReverseFromString(reverse),
                MethodUtil.getCharacterFontFromString(font),
                MethodUtil.getCharacterScaleFromString(scale),
                MethodUtil.getPrintAlignmentFromString(alignment)
            )
            result.success(successfulStatus)
        } catch (e: PrinterException) {
            result.success(e.errorCode)
        }
    }

    private fun printText(@NonNull call: MethodCall, @NonNull result: Result) {
        val args = call.arguments as? Map<*, *> ?: return
        val text = args["text"] as String
        try {
            mPrinterManager?.sendText(text)
            result.success(successfulStatus)
        } catch (e: PrinterException) {
            result.success(e.errorCode)
        }
    }

    private fun connect(@NonNull call: MethodCall, @NonNull result: Result) {
        val args = call.arguments as? Map<*, *> ?: return
        val printerAddress = args["printerAddress"] as String

        if (mPrinterManager == null) {
            mPrinterManager = PrinterManager(mContext)
        }

        try {
            mPrinterManager!!.connect(model, printerAddress, true)
            result.success(successfulStatus)
        } catch (e: PrinterException) {
            result.success(e.errorCode)
        }
    }

    private fun getPrinters(arguments: Any?, events: EventChannel.EventSink?) {
        val bluetoothAdapter = BluetoothAdapter.getDefaultAdapter()
        var printerList: MutableList<Map<String, Any>>
        if (bluetoothAdapter == null || !bluetoothAdapter.isEnabled) {
            return
        }
        try {
            mPrinterManager?.startDiscoveryPrinter {
                printerList = finishEvent(it)
                events?.success(printerList)
                events?.endOfStream()
            }
        } catch (e: PrinterException) {
            Log.d("Printer exception", e.toString())
            events?.success(e.errorCode)
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    private fun finishEvent(event: PrinterEvent): MutableList<Map<String, Any>> {
        val devices = mutableListOf<Map<String, Any>>()
        when (event.eventType) {
            PrinterEvent.EVENT_FINISHED_DISCOVERY, PrinterEvent.EVENT_CANCELED_DISCOVERY -> {
                val printerList = getPrinterList()
                for (printer in printerList) {
                    val device = mutableMapOf<String, Any>()
                    device["ip_address"] = printer.ipAddress
                    device["mac_address"] = printer.macAddress
                    device["name"] = printer.name
                    devices.add(device)
                }
            }
        }
        return devices
    }

    private fun getPrinterList(): MutableList<DeviceListItem> {
        val printerList = mutableListOf<DeviceListItem>()
        val list: ArrayList<PrinterInfo>? = mPrinterManager?.foundPrinter
        mPrinterManager?.foundDevice?.let { list?.addAll(it) }
        val count = list?.size ?: 0
        var index = 0
        while (index < count) {
            val info = list?.get(index) ?: continue
            val item = DeviceListItem(
                info.printerModelName,
                info.bluetoothAddress
            )
            printerList.add(item)
            index++
        }
        return printerList;
    }

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        getPrinters(arguments, events)
    }

    override fun onCancel(arguments: Any?) {

    }
}
