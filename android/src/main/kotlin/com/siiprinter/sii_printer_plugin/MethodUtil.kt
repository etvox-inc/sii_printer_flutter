package com.siiprinter.sii_printer_plugin

import com.seikoinstruments.sdk.thermalprinter.PrinterException
import com.seikoinstruments.sdk.thermalprinter.printerenum.*

class MethodUtil {
    companion object {
        fun getCharacterBoldFromString(boldStyle: String): CharacterBold {
            return when (boldStyle) {
                "SII_PM_BOLD" -> CharacterBold.BOLD
                else -> CharacterBold.BOLD_CANCEL
            }
        }

        fun getCharacterUnderlineFromString(characterUnderline: String): CharacterUnderline {
            return when (characterUnderline) {
                "SII_PM_UNDERLINE_1" -> CharacterUnderline.UNDERLINE_1
                "SII_PM_UNDERLINE_2" -> CharacterUnderline.UNDERLINE_2
                else -> CharacterUnderline.UNDERLINE_CANCEL
            }
        }

        fun getCharacterReverseFromString(characterReverse: String): CharacterReverse {
            return when (characterReverse) {
                "SII_PM_REVERSE" -> CharacterReverse.REVERSE
                else -> CharacterReverse.REVERSE_CANCEL
            }
        }

        fun getCharacterFontFromString(characterFont: String): CharacterFont {
            return when (characterFont) {
                "SII_PM_FONT_A" -> CharacterFont.FONT_A
                "SII_PM_FONT_B" -> CharacterFont.FONT_B
                else -> CharacterFont.FONT_A
            }
        }

        fun getCharacterScaleFromString(characterScale: String): CharacterScale {
            return when (characterScale) {
                "SII_PM_VARTICAL_1_HORIZONTAL_1" -> CharacterScale.VARTICAL_1_HORIZONTAL_1
                "SII_PM_VARTICAL_1_HORIZONTAL_2" -> CharacterScale.VARTICAL_1_HORIZONTAL_2
                "SII_PM_VARTICAL_1_HORIZONTAL_3" -> CharacterScale.VARTICAL_1_HORIZONTAL_3
                "SII_PM_VARTICAL_1_HORIZONTAL_4" -> CharacterScale.VARTICAL_1_HORIZONTAL_4
                "SII_PM_VARTICAL_2_HORIZONTAL_1" -> CharacterScale.VARTICAL_2_HORIZONTAL_1
                "SII_PM_VARTICAL_2_HORIZONTAL_2" -> CharacterScale.VARTICAL_2_HORIZONTAL_2
                "SII_PM_VARTICAL_2_HORIZONTAL_3" -> CharacterScale.VARTICAL_2_HORIZONTAL_3
                "SII_PM_VARTICAL_2_HORIZONTAL_4" -> CharacterScale.VARTICAL_2_HORIZONTAL_4
                "SII_PM_VARTICAL_2_HORIZONTAL_6" -> CharacterScale.VARTICAL_2_HORIZONTAL_6
                "SII_PM_VARTICAL_3_HORIZONTAL_1" -> CharacterScale.VARTICAL_3_HORIZONTAL_1
                "SII_PM_VARTICAL_3_HORIZONTAL_2" -> CharacterScale.VARTICAL_3_HORIZONTAL_2
                "SII_PM_VARTICAL_3_HORIZONTAL_3" -> CharacterScale.VARTICAL_3_HORIZONTAL_3
                "SII_PM_VARTICAL_3_HORIZONTAL_4" -> CharacterScale.VARTICAL_3_HORIZONTAL_4
                "SII_PM_VARTICAL_4_HORIZONTAL_1" -> CharacterScale.VARTICAL_4_HORIZONTAL_1
                "SII_PM_VARTICAL_4_HORIZONTAL_2" -> CharacterScale.VARTICAL_4_HORIZONTAL_2
                "SII_PM_VARTICAL_4_HORIZONTAL_3" -> CharacterScale.VARTICAL_4_HORIZONTAL_3
                "SII_PM_VARTICAL_4_HORIZONTAL_4" -> CharacterScale.VARTICAL_4_HORIZONTAL_4
                "SII_PM_VARTICAL_4_HORIZONTAL_6" -> CharacterScale.VARTICAL_4_HORIZONTAL_6
                "SII_PM_VARTICAL_4_HORIZONTAL_8" -> CharacterScale.VARTICAL_4_HORIZONTAL_8
                "SII_PM_VARTICAL_6_HORIZONTAL_2" -> CharacterScale.VARTICAL_6_HORIZONTAL_2
                "SII_PM_VARTICAL_6_HORIZONTAL_4" -> CharacterScale.VARTICAL_6_HORIZONTAL_4
                "SII_PM_VARTICAL_6_HORIZONTAL_6" -> CharacterScale.VARTICAL_6_HORIZONTAL_6
                "SII_PM_VARTICAL_6_HORIZONTAL_8" -> CharacterScale.VARTICAL_6_HORIZONTAL_8
                "SII_PM_VARTICAL_8_HORIZONTAL_4" -> CharacterScale.VARTICAL_8_HORIZONTAL_4
                "SII_PM_VARTICAL_8_HORIZONTAL_6" -> CharacterScale.VARTICAL_8_HORIZONTAL_6
                "SII_PM_VARTICAL_8_HORIZONTAL_8" -> CharacterScale.VARTICAL_8_HORIZONTAL_8
                else -> CharacterScale.VARTICAL_1_HORIZONTAL_1
            }
        }

        fun getPrintAlignmentFromString(printAlignment: String): PrintAlignment {
            return when (printAlignment) {
                "SII_PM_ALIGNMENT_LEFT" -> PrintAlignment.ALIGNMENT_LEFT
                "SII_PM_ALIGNMENT_CENTER" -> PrintAlignment.ALIGNMENT_CENTER
                "SII_PM_ALIGNMENT_RIGHT" -> PrintAlignment.ALIGNMENT_RIGHT
                else -> PrintAlignment.ALIGNMENT_LEFT
            }
        }

        fun getBarcodeSymbolFromString(barcodeSymbol: String): BarcodeSymbol {
            return when (barcodeSymbol) {
                "SII_PM_BARCODE_UPC_A" -> BarcodeSymbol.BARCODE_SYMBOL_UPC_A
                "SII_PM_BARCODE_UPC_E" -> BarcodeSymbol.BARCODE_SYMBOL_UPC_E
                "SII_PM_BARCODE_EAN13" -> BarcodeSymbol.BARCODE_SYMBOL_EAN13
                "SII_PM_BARCODE_JAN13" -> BarcodeSymbol.BARCODE_SYMBOL_JAN13
                "SII_PM_BARCODE_EAN8" -> BarcodeSymbol.BARCODE_SYMBOL_EAN8
                "SII_PM_BARCODE_JAN8" -> BarcodeSymbol.BARCODE_SYMBOL_JAN8
                "SII_PM_BARCODE_CODE39" -> BarcodeSymbol.BARCODE_SYMBOL_CODE39
                "SII_PM_BARCODE_CODE93" -> BarcodeSymbol.BARCODE_SYMBOL_CODE93
                "SII_PM_BARCODE_CODE128" -> BarcodeSymbol.BARCODE_SYMBOL_CODE128
                "SII_PM_BARCODE_ITF" -> BarcodeSymbol.BARCODE_SYMBOL_ITF
                "SII_PM_BARCODE_CODABAR" -> BarcodeSymbol.BARCODE_SYMBOL_CODABAR
                "SII_PM_BARCODE_EAN13_ADDON" -> BarcodeSymbol.BARCODE_SYMBOL_EAN13_ADDON
                "SII_PM_BARCODE_JAN13_ADDON" -> BarcodeSymbol.BARCODE_SYMBOL_JAN13_ADDON
                "SII_PM_BARCODE_GS1_OMNI_DIRECTIONAL" -> BarcodeSymbol.BARCODE_SYMBOL_GS1_OMNI_DIRECTIONAL
                "SII_PM_BARCODE_GS1_TRUNCATED" -> BarcodeSymbol.BARCODE_SYMBOL_GS1_TRUNCATED
                "SII_PM_BARCODE_GS1_LIMITED" -> BarcodeSymbol.BARCODE_SYMBOL_GS1_LIMITED
                "SII_PM_BARCODE_GS1_EXPANDED" -> BarcodeSymbol.BARCODE_SYMBOL_GS1_EXPANDED
                // Never handle this
                else -> BarcodeSymbol.BARCODE_SYMBOL_UPC_A

            }
        }

        fun getModuleSizeFromString(moduleSize: String): ModuleSize {
            return when (moduleSize) {
                "SII_PM_BARCODE_MODULE_WIDTH_2" -> ModuleSize.BARCODE_MODULE_WIDTH_2
                "SII_PM_BARCODE_MODULE_WIDTH_3" -> ModuleSize.BARCODE_MODULE_WIDTH_3
                "SII_PM_BARCODE_MODULE_WIDTH_4" -> ModuleSize.BARCODE_MODULE_WIDTH_4
                "SII_PM_BARCODE_MODULE_WIDTH_5" -> ModuleSize.BARCODE_MODULE_WIDTH_5
                "SII_PM_BARCODE_MODULE_WIDTH_6" -> ModuleSize.BARCODE_MODULE_WIDTH_6
                "SII_PM_QR_MODULE_SIZE_2" -> ModuleSize.QR_MODULE_SIZE_2
                "SII_PM_QR_MODULE_SIZE_3" -> ModuleSize.QR_MODULE_SIZE_3
                "SII_PM_QR_MODULE_SIZE_4" -> ModuleSize.QR_MODULE_SIZE_4
                "SII_PM_QR_MODULE_SIZE_5" -> ModuleSize.QR_MODULE_SIZE_5
                "SII_PM_QR_MODULE_SIZE_6" -> ModuleSize.QR_MODULE_SIZE_6
                "SII_PM_QR_MODULE_SIZE_7" -> ModuleSize.QR_MODULE_SIZE_7
                "SII_PM_QR_MODULE_SIZE_8" -> ModuleSize.QR_MODULE_SIZE_8
                "SII_PM_QR_MODULE_SIZE_9" -> ModuleSize.QR_MODULE_SIZE_9
                "SII_PM_QR_MODULE_SIZE_10" -> ModuleSize.QR_MODULE_SIZE_10
                "SII_PM_QR_MODULE_SIZE_11" -> ModuleSize.QR_MODULE_SIZE_11
                "SII_PM_QR_MODULE_SIZE_12" -> ModuleSize.QR_MODULE_SIZE_12
                "SII_PM_QR_MODULE_SIZE_13" -> ModuleSize.QR_MODULE_SIZE_13
                "SII_PM_QR_MODULE_SIZE_14" -> ModuleSize.QR_MODULE_SIZE_14
                "SII_PM_QR_MODULE_SIZE_15" -> ModuleSize.QR_MODULE_SIZE_15
                "SII_PM_QR_MODULE_SIZE_16" -> ModuleSize.QR_MODULE_SIZE_16
                "SII_PM_PDF417_MODULE_WIDTH_2" -> ModuleSize.PDF417_MODULE_WIDTH_2
                "SII_PM_PDF417_MODULE_WIDTH_3" -> ModuleSize.PDF417_MODULE_WIDTH_3
                "SII_PM_PDF417_MODULE_WIDTH_4" -> ModuleSize.PDF417_MODULE_WIDTH_4
                "SII_PM_PDF417_MODULE_WIDTH_5" -> ModuleSize.PDF417_MODULE_WIDTH_5
                "SII_PM_PDF417_MODULE_WIDTH_6" -> ModuleSize.PDF417_MODULE_WIDTH_6
                "SII_PM_PDF417_MODULE_WIDTH_7" -> ModuleSize.PDF417_MODULE_WIDTH_7
                "SII_PM_PDF417_MODULE_WIDTH_8" -> ModuleSize.PDF417_MODULE_WIDTH_8
                "SII_PM_DATAMATRIX_MODULE_SIZE_2" -> ModuleSize.DATAMATRIX_MODULE_SIZE_2
                "SII_PM_DATAMATRIX_MODULE_SIZE_3" -> ModuleSize.DATAMATRIX_MODULE_SIZE_3
                "SII_PM_DATAMATRIX_MODULE_SIZE_4" -> ModuleSize.DATAMATRIX_MODULE_SIZE_4
                "SII_PM_DATAMATRIX_MODULE_SIZE_5" -> ModuleSize.DATAMATRIX_MODULE_SIZE_5
                "SII_PM_DATAMATRIX_MODULE_SIZE_6" -> ModuleSize.DATAMATRIX_MODULE_SIZE_6
                "SII_PM_DATAMATRIX_MODULE_SIZE_7" -> ModuleSize.DATAMATRIX_MODULE_SIZE_7
                "SII_PM_DATAMATRIX_MODULE_SIZE_8" -> ModuleSize.DATAMATRIX_MODULE_SIZE_8
                "SII_PM_DATAMATRIX_MODULE_SIZE_9" -> ModuleSize.DATAMATRIX_MODULE_SIZE_9
                "SII_PM_DATAMATRIX_MODULE_SIZE_10" -> ModuleSize.DATAMATRIX_MODULE_SIZE_10
                "SII_PM_DATAMATRIX_MODULE_SIZE_11" -> ModuleSize.DATAMATRIX_MODULE_SIZE_11
                "SII_PM_DATAMATRIX_MODULE_SIZE_12" -> ModuleSize.DATAMATRIX_MODULE_SIZE_12
                "SII_PM_DATAMATRIX_MODULE_SIZE_13" -> ModuleSize.DATAMATRIX_MODULE_SIZE_13
                "SII_PM_DATAMATRIX_MODULE_SIZE_14" -> ModuleSize.DATAMATRIX_MODULE_SIZE_14
                "SII_PM_DATAMATRIX_MODULE_SIZE_15" -> ModuleSize.DATAMATRIX_MODULE_SIZE_15
                "SII_PM_DATAMATRIX_MODULE_SIZE_16" -> ModuleSize.DATAMATRIX_MODULE_SIZE_16
                "SII_PM_GS1DATABAR_MODULE_SIZE_2" -> ModuleSize.GS1DATABAR_MODULE_SIZE_2
                "SII_PM_GS1DATABAR_MODULE_SIZE_3" -> ModuleSize.GS1DATABAR_MODULE_SIZE_3
                "SII_PM_GS1DATABAR_MODULE_SIZE_4" -> ModuleSize.GS1DATABAR_MODULE_SIZE_4
                "SII_PM_GS1DATABAR_MODULE_SIZE_5" -> ModuleSize.GS1DATABAR_MODULE_SIZE_5
                "SII_PM_GS1DATABAR_MODULE_SIZE_6" -> ModuleSize.GS1DATABAR_MODULE_SIZE_6
                "SII_PM_GS1DATABAR_MODULE_SIZE_7" -> ModuleSize.GS1DATABAR_MODULE_SIZE_7
                "SII_PM_GS1DATABAR_MODULE_SIZE_8" -> ModuleSize.GS1DATABAR_MODULE_SIZE_8
                "SII_PM_GS1DATABAR_MODULE_SIZE_9" -> ModuleSize.GS1DATABAR_MODULE_SIZE_9
                "SII_PM_GS1DATABAR_MODULE_SIZE_10" -> ModuleSize.GS1DATABAR_MODULE_SIZE_10
                "SII_PM_GS1DATABAR_MODULE_SIZE_11" -> ModuleSize.GS1DATABAR_MODULE_SIZE_11
                "SII_PM_GS1DATABAR_MODULE_SIZE_12" -> ModuleSize.GS1DATABAR_MODULE_SIZE_12
                "SII_PM_GS1DATABAR_MODULE_SIZE_13" -> ModuleSize.GS1DATABAR_MODULE_SIZE_13
                "SII_PM_GS1DATABAR_MODULE_SIZE_14" -> ModuleSize.GS1DATABAR_MODULE_SIZE_14
                "SII_PM_GS1DATABAR_MODULE_SIZE_15" -> ModuleSize.GS1DATABAR_MODULE_SIZE_15
                "SII_PM_GS1DATABAR_MODULE_SIZE_16" -> ModuleSize.GS1DATABAR_MODULE_SIZE_16
                "SII_PM_AZTECCODE_MODULE_SIZE_2" -> ModuleSize.AZTECCODE_MODULE_SIZE_2
                "SII_PM_AZTECCODE_MODULE_SIZE_3" -> ModuleSize.AZTECCODE_MODULE_SIZE_3
                "SII_PM_AZTECCODE_MODULE_SIZE_4" -> ModuleSize.AZTECCODE_MODULE_SIZE_4
                "SII_PM_AZTECCODE_MODULE_SIZE_5" -> ModuleSize.AZTECCODE_MODULE_SIZE_5
                "SII_PM_AZTECCODE_MODULE_SIZE_6" -> ModuleSize.AZTECCODE_MODULE_SIZE_6
                "SII_PM_AZTECCODE_MODULE_SIZE_7" -> ModuleSize.AZTECCODE_MODULE_SIZE_7
                "SII_PM_AZTECCODE_MODULE_SIZE_8" -> ModuleSize.AZTECCODE_MODULE_SIZE_8
                "SII_PM_AZTECCODE_MODULE_SIZE_9" -> ModuleSize.AZTECCODE_MODULE_SIZE_9
                "SII_PM_AZTECCODE_MODULE_SIZE_10" -> ModuleSize.AZTECCODE_MODULE_SIZE_10
                "SII_PM_AZTECCODE_MODULE_SIZE_11" -> ModuleSize.AZTECCODE_MODULE_SIZE_11
                "SII_PM_AZTECCODE_MODULE_SIZE_12" -> ModuleSize.AZTECCODE_MODULE_SIZE_12
                "SII_PM_AZTECCODE_MODULE_SIZE_13" -> ModuleSize.AZTECCODE_MODULE_SIZE_13
                "SII_PM_AZTECCODE_MODULE_SIZE_14" -> ModuleSize.AZTECCODE_MODULE_SIZE_14
                "SII_PM_AZTECCODE_MODULE_SIZE_15" -> ModuleSize.AZTECCODE_MODULE_SIZE_15
                "SII_PM_AZTECCODE_MODULE_SIZE_16" -> ModuleSize.AZTECCODE_MODULE_SIZE_16
                // Never handle this
                else -> ModuleSize.BARCODE_MODULE_WIDTH_2
            }
        }

        fun getDataMatrixModuleFromString(dataMatrixModule: String): DataMatrixModule {
            return when (dataMatrixModule) {
                "SII_PM_DATA_MATRIX_AUTO" -> DataMatrixModule.DATA_MATRIX_AUTO
                "SII_PM_DATA_MATRIX_10_10" -> DataMatrixModule.DATA_MATRIX_10_10
                "SII_PM_DATA_MATRIX_12_12" -> DataMatrixModule.DATA_MATRIX_12_12
                "SII_PM_DATA_MATRIX_14_14" -> DataMatrixModule.DATA_MATRIX_14_14
                "SII_PM_DATA_MATRIX_16_16" -> DataMatrixModule.DATA_MATRIX_16_16
                "SII_PM_DATA_MATRIX_18_18" -> DataMatrixModule.DATA_MATRIX_18_18
                "SII_PM_DATA_MATRIX_20_20" -> DataMatrixModule.DATA_MATRIX_20_20
                "SII_PM_DATA_MATRIX_22_22" -> DataMatrixModule.DATA_MATRIX_22_22
                "SII_PM_DATA_MATRIX_24_24" -> DataMatrixModule.DATA_MATRIX_24_24
                "SII_PM_DATA_MATRIX_26_26" -> DataMatrixModule.DATA_MATRIX_26_26
                "SII_PM_DATA_MATRIX_32_32" -> DataMatrixModule.DATA_MATRIX_32_32
                "SII_PM_DATA_MATRIX_36_36" -> DataMatrixModule.DATA_MATRIX_36_36
                "SII_PM_DATA_MATRIX_40_40" -> DataMatrixModule.DATA_MATRIX_40_40
                "SII_PM_DATA_MATRIX_44_44" -> DataMatrixModule.DATA_MATRIX_44_44
                "SII_PM_DATA_MATRIX_48_48" -> DataMatrixModule.DATA_MATRIX_48_48
                "SII_PM_DATA_MATRIX_52_52" -> DataMatrixModule.DATA_MATRIX_52_52
                "SII_PM_DATA_MATRIX_64_64" -> DataMatrixModule.DATA_MATRIX_64_64
                "SII_PM_DATA_MATRIX_72_72" -> DataMatrixModule.DATA_MATRIX_72_72
                "SII_PM_DATA_MATRIX_80_80" -> DataMatrixModule.DATA_MATRIX_80_80
                "SII_PM_DATA_MATRIX_88_88" -> DataMatrixModule.DATA_MATRIX_88_88
                "SII_PM_DATA_MATRIX_96_96" -> DataMatrixModule.DATA_MATRIX_96_96
                "SII_PM_DATA_MATRIX_104_104" -> DataMatrixModule.DATA_MATRIX_104_104
                "SII_PM_DATA_MATRIX_120_120" -> DataMatrixModule.DATA_MATRIX_120_120
                "SII_PM_DATA_MATRIX_132_132" -> DataMatrixModule.DATA_MATRIX_132_132
                "SII_PM_DATA_MATRIX_144_144" -> DataMatrixModule.DATA_MATRIX_144_144
                "SII_PM_DATA_MATRIX_8_18" -> DataMatrixModule.DATA_MATRIX_8_18
                "SII_PM_DATA_MATRIX_8_32" -> DataMatrixModule.DATA_MATRIX_8_32
                "SII_PM_DATA_MATRIX_12_26" -> DataMatrixModule.DATA_MATRIX_12_26
                "SII_PM_DATA_MATRIX_12_36" -> DataMatrixModule.DATA_MATRIX_12_36
                "SII_PM_DATA_MATRIX_16_36" -> DataMatrixModule.DATA_MATRIX_16_36
                "SII_PM_DATA_MATRIX_16_48" -> DataMatrixModule.DATA_MATRIX_16_48
                else -> DataMatrixModule.DATA_MATRIX_AUTO
            }
        }

        fun getMaxiCodeModeFromString(maxiCodeMode: String): MaxiCodeMode {
            return when (maxiCodeMode) {
                "SII_PM_MAXI_CODE_2" -> MaxiCodeMode.MAXI_CODE_2
                "SII_PM_MAXI_CODE_3" -> MaxiCodeMode.MAXI_CODE_3
                "SII_PM_MAXI_CODE_4" -> MaxiCodeMode.MAXI_CODE_4
                "SII_PM_MAXI_CODE_5" -> MaxiCodeMode.MAXI_CODE_5
                else -> MaxiCodeMode.MAXI_CODE_2
            }
        }

        fun getHriPositionFromString(hriPosition: String): HriPosition {
            return when (hriPosition) {
                "SII_PM_HRI_NONE" -> HriPosition.HRI_NONE
                "SII_PM_HRI_POSITION_ABOVE" -> HriPosition.HRI_POSITION_ABOVE
                "SII_PM_HRI_POSITION_BELOW" -> HriPosition.HRI_POSITION_BELOW
                "SII_PM_HRI_POSITION_ABOVE_BELOW" -> HriPosition.HRI_POSITION_ABOVE_BELOW
                else -> HriPosition.HRI_NONE
            }
        }

        fun getErrorMessage(errorCode: Int): String {
            return when (errorCode) {
                PrinterException.ERROR_ACCESS_DENIED -> "Exception:ACCESS_DENIED"
                PrinterException.ERROR_SHARING_VIOLATION -> "Exception:SHARING_VIOLATION"
                PrinterException.ERROR_PORT_NOT_OPENED -> "Exception:PORT_NOT_OPENED"
                PrinterException.ERROR_DEVICE_NOT_CONNECTED -> "Exception:DEVICE_NOT_CONNECTED"
                PrinterException.ERROR_OFFLINE -> "Exception:OFFLINE"
                PrinterException.ERROR_EXTERNAL_DEVICE_NOT_CONNECTED -> "Exception:EXTERNAL_DEVICE_NOT_CONNECTED"
                PrinterException.ERROR_DEVICE_INITIALIZE_FAILED -> "Exception:DEVICE_INITIALIZE_FAILED"
                PrinterException.ERROR_DATA_SIZE_ZERO -> "Exception:DATA_SIZE_ZERO"
                PrinterException.ERROR_OVER_MAX_DATA_SIZE -> "Exception:OVER_MAX_DATA_SIZE"
                PrinterException.ERROR_DATA_SIZE_INVALID -> "Exception:DATA_SIZE_INVALID"
                PrinterException.ERROR_ENCODE_FAILED -> "Exception:ENCODE_FAILED"
                PrinterException.ERROR_TIMEOUT -> "Exception:TIMEOUT"
                PrinterException.ERROR_FILE_NOT_FOUND -> "Exception:FILE_NOT_FOUND"
                PrinterException.ERROR_FILE_USED -> "Exception:FILE_USED"
                PrinterException.ERROR_FILE_INVALID -> "Exception:FILE_INVALID"
                PrinterException.ERROR_LOW_MEMORY -> "Exception:LOW_MEMORY"
                PrinterException.ERROR_OVER_MAX_IMAGE -> "Exception:OVER_MAX_IMAGE"
                PrinterException.ERROR_LOGO_NOT_DEFINED -> "Exception:LOGO_NOT_DEFINED"
                PrinterException.ERROR_LOW_USER_AREA -> "Exception:LOW_USER_AREA"
                PrinterException.ERROR_LOW_EXTERNAL_RAM -> "Exception:LOW_EXTERNAL_RAM"
                PrinterException.ERROR_NOT_REGISTERD -> "Exception:NOT_REGISTERD"
                PrinterException.ERROR_NOT_UNREGISTERD -> "Exception:NOT_UNREGISTERD"
                PrinterException.ERROR_INVALID_NO -> "Exception:INVALID_NO"
                PrinterException.ERROR_OVER_STYLE_NUM -> "Exception:OVER_STYLE_NUM"
                PrinterException.ERROR_INVALID_DATA -> "Exception:INVALID_DATA"
                PrinterException.ERROR_PAGE_MODE_SPECIFIED -> "Exception:PAGE_MODE_SPECIFIED"
                PrinterException.ERROR_PAGE_MODE_NOT_SPECIFIED -> "Exception:PAGE_MODE_NOT_SPECIFIED"
                PrinterException.ERROR_INVALID_PARAM -> "Exception:INVALID_PARAM"
                else -> "Exception:Unknown error"
            }
        }
    }
}