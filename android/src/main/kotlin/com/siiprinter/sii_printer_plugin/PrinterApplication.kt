package com.siiprinter.sii_printer_plugin

import android.app.Application
import com.seikoinstruments.sdk.thermalprinter.PrinterManager

/**
 * Class that holds PrinterManager.
 */
class PrinterApplication : Application() {
    /** PrinterManager(SDK)  */
    private var mPrinterManager: PrinterManager? = null
    var printerManager: PrinterManager?
        get() = mPrinterManager
        set(manager) {
            mPrinterManager = manager
        }
}
