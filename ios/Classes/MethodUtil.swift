//
//  MethodUtil.swift
//  sii_printer_plugin
//

import Foundation

public class MethodUtil {
    static func getCharacterBoldFromString(_ boldStyle: String) -> CharacterBold {
        switch (boldStyle) {
        case "SII_PM_BOLD":
            return CharacterBold.SII_PM_BOLD
        default:
            return CharacterBold.SII_PM_BOLD_CANCEL
        }
    }
    
    static func getCharacterUnderlineFromString(_ characterUnderline: String) -> CharacterUnderline{
        switch (characterUnderline) {
        case "SII_PM_UNDERLINE_1":
            return CharacterUnderline.SII_PM_UNDERLINE_1
        case "SII_PM_UNDERLINE_2":
            return CharacterUnderline.SII_PM_UNDERLINE_2
        default:
            return CharacterUnderline.SII_PM_UNDERLINE_CANCEL
        }
    }
    
    static func getCharacterReverseFromString(_ characterReverse: String) -> CharacterReverse {
        switch (characterReverse) {
        case "SII_PM_REVERSE":
            return CharacterReverse.SII_PM_REVERSE
        default:
            return CharacterReverse.SII_PM_REVERSE_CANCEL
        }
    }
    
    static func getCharacterFontFromString(_ characterFont: String) -> CharacterFont {
        switch (characterFont) {
        case "SII_PM_FONT_A":
            return CharacterFont.SII_PM_FONT_A
        case "SII_PM_FONT_B":
            return CharacterFont.SII_PM_FONT_B
        default:
            return CharacterFont.SII_PM_FONT_A
        }
    }
    
    static func getCharacterScaleFromString(_ characterScale: String) -> CharacterScale {
        switch (characterScale) {
        case "SII_PM_VARTICAL_1_HORIZONTAL_1":
            return CharacterScale.SII_PM_VARTICAL_1_HORIZONTAL_1
        case "SII_PM_VARTICAL_1_HORIZONTAL_2":
            return CharacterScale.SII_PM_VARTICAL_1_HORIZONTAL_2
        case "SII_PM_VARTICAL_1_HORIZONTAL_3":
            return CharacterScale.SII_PM_VARTICAL_1_HORIZONTAL_3
        case "SII_PM_VARTICAL_1_HORIZONTAL_4":
            return CharacterScale.SII_PM_VARTICAL_1_HORIZONTAL_4
        case "SII_PM_VARTICAL_2_HORIZONTAL_1":
            return CharacterScale.SII_PM_VARTICAL_2_HORIZONTAL_1
        case "SII_PM_VARTICAL_2_HORIZONTAL_2":
            return CharacterScale.SII_PM_VARTICAL_2_HORIZONTAL_2
        case "SII_PM_VARTICAL_2_HORIZONTAL_3":
            return CharacterScale.SII_PM_VARTICAL_2_HORIZONTAL_3
        case "SII_PM_VARTICAL_2_HORIZONTAL_4":
            return CharacterScale.SII_PM_VARTICAL_2_HORIZONTAL_4
        case "SII_PM_VARTICAL_2_HORIZONTAL_6":
            return CharacterScale.SII_PM_VARTICAL_2_HORIZONTAL_6
        case "SII_PM_VARTICAL_3_HORIZONTAL_1":
            return CharacterScale.SII_PM_VARTICAL_3_HORIZONTAL_1
        case "SII_PM_VARTICAL_3_HORIZONTAL_2":
            return CharacterScale.SII_PM_VARTICAL_3_HORIZONTAL_2
        case "SII_PM_VARTICAL_3_HORIZONTAL_3":
            return CharacterScale.SII_PM_VARTICAL_3_HORIZONTAL_3
        case "SII_PM_VARTICAL_3_HORIZONTAL_4":
            return CharacterScale.SII_PM_VARTICAL_3_HORIZONTAL_4
        case "SII_PM_VARTICAL_4_HORIZONTAL_1":
            return CharacterScale.SII_PM_VARTICAL_4_HORIZONTAL_1
        case "SII_PM_VARTICAL_4_HORIZONTAL_2":
            return CharacterScale.SII_PM_VARTICAL_4_HORIZONTAL_2
        case "SII_PM_VARTICAL_4_HORIZONTAL_3":
            return CharacterScale.SII_PM_VARTICAL_4_HORIZONTAL_3
        case "SII_PM_VARTICAL_4_HORIZONTAL_4":
            return CharacterScale.SII_PM_VARTICAL_4_HORIZONTAL_4
        case "SII_PM_VARTICAL_4_HORIZONTAL_6":
            return CharacterScale.SII_PM_VARTICAL_4_HORIZONTAL_6
        case "SII_PM_VARTICAL_4_HORIZONTAL_8":
            return CharacterScale.SII_PM_VARTICAL_4_HORIZONTAL_8
        case "SII_PM_VARTICAL_6_HORIZONTAL_2":
            return CharacterScale.SII_PM_VARTICAL_6_HORIZONTAL_2
        case "SII_PM_VARTICAL_6_HORIZONTAL_4":
            return CharacterScale.SII_PM_VARTICAL_6_HORIZONTAL_4
        case "SII_PM_VARTICAL_6_HORIZONTAL_6":
            return CharacterScale.SII_PM_VARTICAL_6_HORIZONTAL_6
        case "SII_PM_VARTICAL_6_HORIZONTAL_8":
            return CharacterScale.SII_PM_VARTICAL_6_HORIZONTAL_8
        case "SII_PM_VARTICAL_8_HORIZONTAL_4":
            return CharacterScale.SII_PM_VARTICAL_8_HORIZONTAL_4
        case "SII_PM_VARTICAL_8_HORIZONTAL_6":
            return CharacterScale.SII_PM_VARTICAL_8_HORIZONTAL_6
        case "SII_PM_VARTICAL_8_HORIZONTAL_8":
            return CharacterScale.SII_PM_VARTICAL_8_HORIZONTAL_8
        default:
            return CharacterScale.SII_PM_VARTICAL_1_HORIZONTAL_1
        }
    }
    
    static func getPrintAlignmentFromString(_ printAlignment: String) -> PrintAlignment {
        switch (printAlignment) {
        case "SII_PM_ALIGNMENT_LEFT":
            return PrintAlignment.SII_PM_ALIGNMENT_LEFT
        case "SII_PM_ALIGNMENT_CENTER":
            return PrintAlignment.SII_PM_ALIGNMENT_CENTER
        case "SII_PM_ALIGNMENT_RIGHT":
            return PrintAlignment.SII_PM_ALIGNMENT_RIGHT
        default:
            return PrintAlignment.SII_PM_ALIGNMENT_LEFT
        }
    }
    
    static func getBarcodeSymbolFromString(_ barcodeSymbol: String) -> BarcodeSymbol {
        switch (barcodeSymbol) {
        case "SII_PM_BARCODE_UPC_A":
            return BarcodeSymbol.SII_PM_BARCODE_UPC_A
        case "SII_PM_BARCODE_UPC_E":
            return BarcodeSymbol.SII_PM_BARCODE_UPC_E
        case "SII_PM_BARCODE_EAN13":
            return BarcodeSymbol.SII_PM_BARCODE_EAN13
        case "SII_PM_BARCODE_JAN13":
            return BarcodeSymbol.SII_PM_BARCODE_JAN13
        case "SII_PM_BARCODE_EAN8":
            return BarcodeSymbol.SII_PM_BARCODE_EAN8
        case "SII_PM_BARCODE_JAN8":
            return BarcodeSymbol.SII_PM_BARCODE_JAN8
        case "SII_PM_BARCODE_CODE39":
            return BarcodeSymbol.SII_PM_BARCODE_CODE39
        case "SII_PM_BARCODE_CODE93":
            return BarcodeSymbol.SII_PM_BARCODE_CODE93
        case "SII_PM_BARCODE_CODE128":
            return BarcodeSymbol.SII_PM_BARCODE_CODE128
        case "SII_PM_BARCODE_ITF":
            return BarcodeSymbol.SII_PM_BARCODE_ITF
        case "SII_PM_BARCODE_CODABAR":
            return BarcodeSymbol.SII_PM_BARCODE_CODABAR
        case "SII_PM_BARCODE_EAN13_ADDON":
            return BarcodeSymbol.SII_PM_BARCODE_EAN13_ADDON
        case "SII_PM_BARCODE_JAN13_ADDON":
            return BarcodeSymbol.SII_PM_BARCODE_JAN13_ADDON
        case "SII_PM_BARCODE_GS1_OMNI_DIRECTIONAL":
            return BarcodeSymbol.SII_PM_BARCODE_GS1_OMNI_DIRECTIONAL
        case "SII_PM_BARCODE_GS1_TRUNCATED":
            return BarcodeSymbol.SII_PM_BARCODE_GS1_TRUNCATED
        case "SII_PM_BARCODE_GS1_LIMITED":
            return BarcodeSymbol.SII_PM_BARCODE_GS1_LIMITED
        case "SII_PM_BARCODE_GS1_EXPANDED":
            return BarcodeSymbol.SII_PM_BARCODE_GS1_EXPANDED
        default:
            // Never handle this case
            return BarcodeSymbol.SII_PM_BARCODE_UPC_A
        }
    }
    
    static func getModuleSizeFromString(_ moduleSize: String) -> ModuleSize {
        switch (moduleSize) {
        case "SII_PM_BARCODE_MODULE_WIDTH_2":
            return ModuleSize.SII_PM_BARCODE_MODULE_WIDTH_2
        case "SII_PM_BARCODE_MODULE_WIDTH_3":
            return ModuleSize.SII_PM_BARCODE_MODULE_WIDTH_3
        case "SII_PM_BARCODE_MODULE_WIDTH_4":
            return ModuleSize.SII_PM_BARCODE_MODULE_WIDTH_4
        case "SII_PM_BARCODE_MODULE_WIDTH_5":
            return ModuleSize.SII_PM_BARCODE_MODULE_WIDTH_5
        case "SII_PM_BARCODE_MODULE_WIDTH_6":
            return ModuleSize.SII_PM_BARCODE_MODULE_WIDTH_6
        case "SII_PM_QR_MODULE_SIZE_2":
            return ModuleSize.SII_PM_QR_MODULE_SIZE_2
        case "SII_PM_QR_MODULE_SIZE_3":
            return ModuleSize.SII_PM_QR_MODULE_SIZE_3
        case "SII_PM_QR_MODULE_SIZE_4":
            return ModuleSize.SII_PM_QR_MODULE_SIZE_4
        case "SII_PM_QR_MODULE_SIZE_5":
            return ModuleSize.SII_PM_QR_MODULE_SIZE_5
        case "SII_PM_QR_MODULE_SIZE_6":
            return ModuleSize.SII_PM_QR_MODULE_SIZE_6
        case "SII_PM_QR_MODULE_SIZE_7":
            return ModuleSize.SII_PM_QR_MODULE_SIZE_7
        case "SII_PM_QR_MODULE_SIZE_8":
            return ModuleSize.SII_PM_QR_MODULE_SIZE_8
        case "SII_PM_QR_MODULE_SIZE_9":
            return ModuleSize.SII_PM_QR_MODULE_SIZE_9
        case "SII_PM_QR_MODULE_SIZE_10":
            return ModuleSize.SII_PM_QR_MODULE_SIZE_10
        case "SII_PM_QR_MODULE_SIZE_11":
            return ModuleSize.SII_PM_QR_MODULE_SIZE_11
        case "SII_PM_QR_MODULE_SIZE_12":
            return ModuleSize.SII_PM_QR_MODULE_SIZE_12
        case "SII_PM_QR_MODULE_SIZE_13":
            return ModuleSize.SII_PM_QR_MODULE_SIZE_13
        case "SII_PM_QR_MODULE_SIZE_14":
            return ModuleSize.SII_PM_QR_MODULE_SIZE_14
        case "SII_PM_QR_MODULE_SIZE_15":
            return ModuleSize.SII_PM_QR_MODULE_SIZE_15
        case "SII_PM_QR_MODULE_SIZE_16":
            return ModuleSize.SII_PM_QR_MODULE_SIZE_16
        case "SII_PM_PDF417_MODULE_WIDTH_2":
            return ModuleSize.SII_PM_PDF417_MODULE_WIDTH_2
        case "SII_PM_PDF417_MODULE_WIDTH_3":
            return ModuleSize.SII_PM_PDF417_MODULE_WIDTH_3
        case "SII_PM_PDF417_MODULE_WIDTH_4":
            return ModuleSize.SII_PM_PDF417_MODULE_WIDTH_4
        case "SII_PM_PDF417_MODULE_WIDTH_5":
            return ModuleSize.SII_PM_PDF417_MODULE_WIDTH_5
        case "SII_PM_PDF417_MODULE_WIDTH_6":
            return ModuleSize.SII_PM_PDF417_MODULE_WIDTH_6
        case "SII_PM_PDF417_MODULE_WIDTH_7":
            return ModuleSize.SII_PM_PDF417_MODULE_WIDTH_7
        case "SII_PM_PDF417_MODULE_WIDTH_8":
            return ModuleSize.SII_PM_PDF417_MODULE_WIDTH_8
        case "SII_PM_DATAMATRIX_MODULE_SIZE_2":
            return ModuleSize.SII_PM_DATAMATRIX_MODULE_SIZE_2
        case "SII_PM_DATAMATRIX_MODULE_SIZE_3":
            return ModuleSize.SII_PM_DATAMATRIX_MODULE_SIZE_3
        case "SII_PM_DATAMATRIX_MODULE_SIZE_4":
            return ModuleSize.SII_PM_DATAMATRIX_MODULE_SIZE_4
        case "SII_PM_DATAMATRIX_MODULE_SIZE_5":
            return ModuleSize.SII_PM_DATAMATRIX_MODULE_SIZE_5
        case "SII_PM_DATAMATRIX_MODULE_SIZE_6":
            return ModuleSize.SII_PM_DATAMATRIX_MODULE_SIZE_6
        case "SII_PM_DATAMATRIX_MODULE_SIZE_7":
            return ModuleSize.SII_PM_DATAMATRIX_MODULE_SIZE_7
        case "SII_PM_DATAMATRIX_MODULE_SIZE_8":
            return ModuleSize.SII_PM_DATAMATRIX_MODULE_SIZE_8
        case "SII_PM_DATAMATRIX_MODULE_SIZE_9":
            return ModuleSize.SII_PM_DATAMATRIX_MODULE_SIZE_9
        case "SII_PM_DATAMATRIX_MODULE_SIZE_10":
            return ModuleSize.SII_PM_DATAMATRIX_MODULE_SIZE_10
        case "SII_PM_DATAMATRIX_MODULE_SIZE_11":
            return ModuleSize.SII_PM_DATAMATRIX_MODULE_SIZE_11
        case "SII_PM_DATAMATRIX_MODULE_SIZE_12":
            return ModuleSize.SII_PM_DATAMATRIX_MODULE_SIZE_12
        case "SII_PM_DATAMATRIX_MODULE_SIZE_13":
            return ModuleSize.SII_PM_DATAMATRIX_MODULE_SIZE_13
        case "SII_PM_DATAMATRIX_MODULE_SIZE_14":
            return ModuleSize.SII_PM_DATAMATRIX_MODULE_SIZE_14
        case "SII_PM_DATAMATRIX_MODULE_SIZE_15":
            return ModuleSize.SII_PM_DATAMATRIX_MODULE_SIZE_15
        case "SII_PM_DATAMATRIX_MODULE_SIZE_16":
            return ModuleSize.SII_PM_DATAMATRIX_MODULE_SIZE_16
        case "SII_PM_GS1DATABAR_MODULE_SIZE_2":
            return ModuleSize.SII_PM_GS1DATABAR_MODULE_SIZE_2
        case "SII_PM_GS1DATABAR_MODULE_SIZE_3":
            return ModuleSize.SII_PM_GS1DATABAR_MODULE_SIZE_3
        case "SII_PM_GS1DATABAR_MODULE_SIZE_4":
            return ModuleSize.SII_PM_GS1DATABAR_MODULE_SIZE_4
        case "SII_PM_GS1DATABAR_MODULE_SIZE_5":
            return ModuleSize.SII_PM_GS1DATABAR_MODULE_SIZE_5
        case "SII_PM_GS1DATABAR_MODULE_SIZE_6":
            return ModuleSize.SII_PM_GS1DATABAR_MODULE_SIZE_6
        case "SII_PM_GS1DATABAR_MODULE_SIZE_7":
            return ModuleSize.SII_PM_GS1DATABAR_MODULE_SIZE_7
        case "SII_PM_GS1DATABAR_MODULE_SIZE_8":
            return ModuleSize.SII_PM_GS1DATABAR_MODULE_SIZE_8
        case "SII_PM_GS1DATABAR_MODULE_SIZE_9":
            return ModuleSize.SII_PM_GS1DATABAR_MODULE_SIZE_9
        case "SII_PM_GS1DATABAR_MODULE_SIZE_10":
            return ModuleSize.SII_PM_GS1DATABAR_MODULE_SIZE_10
        case "SII_PM_GS1DATABAR_MODULE_SIZE_11":
            return ModuleSize.SII_PM_GS1DATABAR_MODULE_SIZE_11
        case "SII_PM_GS1DATABAR_MODULE_SIZE_12":
            return ModuleSize.SII_PM_GS1DATABAR_MODULE_SIZE_12
        case "SII_PM_GS1DATABAR_MODULE_SIZE_13":
            return ModuleSize.SII_PM_GS1DATABAR_MODULE_SIZE_13
        case "SII_PM_GS1DATABAR_MODULE_SIZE_14":
            return ModuleSize.SII_PM_GS1DATABAR_MODULE_SIZE_14
        case "SII_PM_GS1DATABAR_MODULE_SIZE_15":
            return ModuleSize.SII_PM_GS1DATABAR_MODULE_SIZE_15
        case "SII_PM_GS1DATABAR_MODULE_SIZE_16":
            return ModuleSize.SII_PM_GS1DATABAR_MODULE_SIZE_16
        case "SII_PM_AZTECCODE_MODULE_SIZE_2":
            return ModuleSize.SII_PM_AZTECCODE_MODULE_SIZE_2
        case "SII_PM_AZTECCODE_MODULE_SIZE_3":
            return ModuleSize.SII_PM_AZTECCODE_MODULE_SIZE_3
        case "SII_PM_AZTECCODE_MODULE_SIZE_4":
            return ModuleSize.SII_PM_AZTECCODE_MODULE_SIZE_4
        case "SII_PM_AZTECCODE_MODULE_SIZE_5":
            return ModuleSize.SII_PM_AZTECCODE_MODULE_SIZE_5
        case "SII_PM_AZTECCODE_MODULE_SIZE_6":
            return ModuleSize.SII_PM_AZTECCODE_MODULE_SIZE_6
        case "SII_PM_AZTECCODE_MODULE_SIZE_7":
            return ModuleSize.SII_PM_AZTECCODE_MODULE_SIZE_7
        case "SII_PM_AZTECCODE_MODULE_SIZE_8":
            return ModuleSize.SII_PM_AZTECCODE_MODULE_SIZE_8
        case "SII_PM_AZTECCODE_MODULE_SIZE_9":
            return ModuleSize.SII_PM_AZTECCODE_MODULE_SIZE_9
        case "SII_PM_AZTECCODE_MODULE_SIZE_10":
            return ModuleSize.SII_PM_AZTECCODE_MODULE_SIZE_10
        case "SII_PM_AZTECCODE_MODULE_SIZE_11":
            return ModuleSize.SII_PM_AZTECCODE_MODULE_SIZE_11
        case "SII_PM_AZTECCODE_MODULE_SIZE_12":
            return ModuleSize.SII_PM_AZTECCODE_MODULE_SIZE_12
        case "SII_PM_AZTECCODE_MODULE_SIZE_13":
            return ModuleSize.SII_PM_AZTECCODE_MODULE_SIZE_13
        case "SII_PM_AZTECCODE_MODULE_SIZE_14":
            return ModuleSize.SII_PM_AZTECCODE_MODULE_SIZE_14
        case "SII_PM_AZTECCODE_MODULE_SIZE_15":
            return ModuleSize.SII_PM_AZTECCODE_MODULE_SIZE_15
        case "SII_PM_AZTECCODE_MODULE_SIZE_16":
            return ModuleSize.SII_PM_AZTECCODE_MODULE_SIZE_16
        default:
            // Never handle this case
            return ModuleSize.SII_PM_BARCODE_MODULE_WIDTH_2
        }
    }
    
    static func getDataMatrixModuleFromString(_ dataMatrixModule: String) -> DataMatrixModule {
        switch (dataMatrixModule) {
        case "SII_PM_DATA_MATRIX_AUTO":
            return DataMatrixModule.SII_PM_DATA_MATRIX_AUTO
        case "SII_PM_DATA_MATRIX_10_10":
            return DataMatrixModule.SII_PM_DATA_MATRIX_10_10
        case "SII_PM_DATA_MATRIX_12_12":
            return DataMatrixModule.SII_PM_DATA_MATRIX_12_12
        case "SII_PM_DATA_MATRIX_14_14":
            return DataMatrixModule.SII_PM_DATA_MATRIX_14_14
        case "SII_PM_DATA_MATRIX_16_16":
            return DataMatrixModule.SII_PM_DATA_MATRIX_16_16
        case "SII_PM_DATA_MATRIX_18_18":
            return DataMatrixModule.SII_PM_DATA_MATRIX_18_18
        case "SII_PM_DATA_MATRIX_20_20":
            return DataMatrixModule.SII_PM_DATA_MATRIX_20_20
        case "SII_PM_DATA_MATRIX_22_22":
            return DataMatrixModule.SII_PM_DATA_MATRIX_22_22
        case "SII_PM_DATA_MATRIX_24_24":
            return DataMatrixModule.SII_PM_DATA_MATRIX_24_24
        case "SII_PM_DATA_MATRIX_26_26":
            return DataMatrixModule.SII_PM_DATA_MATRIX_26_26
        case "SII_PM_DATA_MATRIX_32_32":
            return DataMatrixModule.SII_PM_DATA_MATRIX_32_32
        case "SII_PM_DATA_MATRIX_36_36":
            return DataMatrixModule.SII_PM_DATA_MATRIX_36_36
        case "SII_PM_DATA_MATRIX_40_40":
            return DataMatrixModule.SII_PM_DATA_MATRIX_40_40
        case "SII_PM_DATA_MATRIX_44_44":
            return DataMatrixModule.SII_PM_DATA_MATRIX_44_44
        case "SII_PM_DATA_MATRIX_48_48":
            return DataMatrixModule.SII_PM_DATA_MATRIX_48_48
        case "SII_PM_DATA_MATRIX_52_52":
            return DataMatrixModule.SII_PM_DATA_MATRIX_52_52
        case "SII_PM_DATA_MATRIX_64_64":
            return DataMatrixModule.SII_PM_DATA_MATRIX_64_64
        case "SII_PM_DATA_MATRIX_72_72":
            return DataMatrixModule.SII_PM_DATA_MATRIX_72_72
        case "SII_PM_DATA_MATRIX_80_80":
            return DataMatrixModule.SII_PM_DATA_MATRIX_80_80
        case "SII_PM_DATA_MATRIX_88_88":
            return DataMatrixModule.SII_PM_DATA_MATRIX_88_88
        case "SII_PM_DATA_MATRIX_96_96":
            return DataMatrixModule.SII_PM_DATA_MATRIX_96_96
        case "SII_PM_DATA_MATRIX_104_104":
            return DataMatrixModule.SII_PM_DATA_MATRIX_104_104
        case "SII_PM_DATA_MATRIX_120_120":
            return DataMatrixModule.SII_PM_DATA_MATRIX_120_120
        case "SII_PM_DATA_MATRIX_132_132":
            return DataMatrixModule.SII_PM_DATA_MATRIX_132_132
        case "SII_PM_DATA_MATRIX_144_144":
            return DataMatrixModule.SII_PM_DATA_MATRIX_144_144
        case "SII_PM_DATA_MATRIX_8_18":
            return DataMatrixModule.SII_PM_DATA_MATRIX_8_18
        case "SII_PM_DATA_MATRIX_8_32":
            return DataMatrixModule.SII_PM_DATA_MATRIX_8_32
        case "SII_PM_DATA_MATRIX_12_26":
            return DataMatrixModule.SII_PM_DATA_MATRIX_12_26
        case "SII_PM_DATA_MATRIX_12_36":
            return DataMatrixModule.SII_PM_DATA_MATRIX_12_36
        case "SII_PM_DATA_MATRIX_16_36":
            return DataMatrixModule.SII_PM_DATA_MATRIX_16_36
        case "SII_PM_DATA_MATRIX_16_48":
            return DataMatrixModule.SII_PM_DATA_MATRIX_16_48
        default:
            return DataMatrixModule.SII_PM_DATA_MATRIX_AUTO
        }
    }
    
    static func getMaxiCodeModeFromString(_ maxiCodeMode: String) -> MaxiCodeMode {
        switch (maxiCodeMode) {
        case "SII_PM_MAXI_CODE_2":
            return MaxiCodeMode.SII_PM_MAXI_CODE_2
        case "SII_PM_MAXI_CODE_3":
            return MaxiCodeMode.SII_PM_MAXI_CODE_3
        case "SII_PM_MAXI_CODE_4":
            return MaxiCodeMode.SII_PM_MAXI_CODE_4
        case "SII_PM_MAXI_CODE_5":
            return MaxiCodeMode.SII_PM_MAXI_CODE_5
        default:
            return MaxiCodeMode.SII_PM_MAXI_CODE_2
        }
    }
    
    static func getHriPositionFromString(_ hriPosition: String) -> HriPosition {
        switch (hriPosition) {
        case "SII_PM_HRI_NONE":
            return HriPosition.SII_PM_HRI_NONE
        case "SII_PM_HRI_POSITION_ABOVE":
            return HriPosition.SII_PM_HRI_POSITION_ABOVE
        case "SII_PM_HRI_POSITION_BELOW":
            return HriPosition.SII_PM_HRI_POSITION_BELOW
        case "SII_PM_HRI_POSITION_ABOVE_BELOW":
            return HriPosition.SII_PM_HRI_POSITION_ABOVE_BELOW
        default:
            return HriPosition.SII_PM_HRI_NONE
        }
    }
    
    static func getErrorMessage(_ errorCode: Int32) -> String {
        switch errorCode {
            case SII_PM_ERROR_ACCESS_DENIED:
                return "Exception:ACCESS_DENIED"
            case SII_PM_ERROR_SHARING_VIOLATION:
                return "Exception:SHARING_VIOLATION"
            case SII_PM_ERROR_PORT_NOT_OPENED:
                return "Exception:PORT_NOT_OPENED"
            case SII_PM_ERROR_DEVICE_NOT_CONNECTED:
                return "Exception:DEVICE_NOT_CONNECTED"
            case SII_PM_ERROR_OFFLINE:
                return "Exception:OFFLINE"
            case SII_PM_ERROR_EXTERNAL_DEVICE_NOT_CONNECTED:
                return "Exception:EXTERNAL_DEVICE_NOT_CONNECTED"
            case SII_PM_ERROR_DEVICE_INITIALIZE_FAILED:
                return "Exception:DEVICE_INITIALIZE_FAILED"
            case SII_PM_ERROR_DATA_SIZE_ZERO:
                return "Exception:DATA_SIZE_ZERO"
            case SII_PM_ERROR_OVER_MAX_DATA_SIZE:
                return "Exception:OVER_MAX_DATA_SIZE"
            case SII_PM_ERROR_DATA_SIZE_INVALID:
                return "Exception:DATA_SIZE_INVALID"
            case SII_PM_ERROR_ENCODE_FAILED:
                return "Exception:ENCODE_FAILED"
            case SII_PM_ERROR_TIMEOUT:
                return "Exception:TIMEOUT"
            case SII_PM_ERROR_FILE_NOT_FOUND:
                return "Exception:FILE_NOT_FOUND"
            case SII_PM_ERROR_FILE_USED:
                return "Exception:FILE_USED"
            case SII_PM_ERROR_FILE_INVALID:
                return "Exception:FILE_INVALID"
            case SII_PM_ERROR_LOW_MEMORY:
                return "Exception:LOW_MEMORY"
            case SII_PM_ERROR_OVER_MAX_IMAGE:
                return "Exception:OVER_MAX_IMAGE"
            case SII_PM_ERROR_LOGO_NOT_DEFINED:
                return "Exception:LOGO_NOT_DEFINED"
            case SII_PM_ERROR_LOW_USER_AREA:
                return "Exception:LOW_USER_AREA"
            case SII_PM_ERROR_LOW_EXTERNAL_RAM:
                return "Exception:LOW_EXTERNAL_RAM"
            case SII_PM_ERROR_NOT_REGISTERD:
                return "Exception:NOT_REGISTERD"
            case SII_PM_ERROR_NOT_UNREGISTERD:
                return "Exception:NOT_UNREGISTERD"
            case SII_PM_ERROR_INVALID_NO:
                return "Exception:INVALID_NO"
            case SII_PM_ERROR_OVER_STYLE_NUM:
                return "Exception:OVER_STYLE_NUM"
            case SII_PM_ERROR_INVALID_DATA:
                return "Exception:INVALID_DATA"
            case SII_PM_ERROR_PAGE_MODE_SPECIFIED:
                return "Exception:PAGE_MODE_SPECIFIED"
            case SII_PM_ERROR_PAGE_MODE_NOT_SPECIFIED:
                return "Exception:PAGE_MODE_NOT_SPECIFIED"
            case SII_PM_ERROR_INVALID_PARAM:
                return "Exception:INVALID_PARAM"
            default:
                return "Exception:Unknown error"
        }
    }
}
