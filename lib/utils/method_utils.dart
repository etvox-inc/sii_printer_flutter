import 'package:sii_printer_plugin/type/sii_error_code.dart';

class MethodUtils {
  static SiiErrorCode errorName(int code) {
    switch (code) {
      case -1:
        return SiiErrorCode.SII_PM_ERROR_ACCESS_DENIED;
      case -11:
        return SiiErrorCode.SII_PM_ERROR_SHARING_VIOLATION;
      case -12:
        return SiiErrorCode.SII_PM_ERROR_PORT_NOT_OPENED;
      case -21:
        return SiiErrorCode.SII_PM_ERROR_DEVICE_NOT_CONNECTED;
      case -22:
        return SiiErrorCode.SII_PM_ERROR_OFFLINE;
      case -23:
        return SiiErrorCode.SII_PM_ERROR_EXTERNAL_DEVICE_NOT_CONNECTED;
      case -31:
        return SiiErrorCode.SII_PM_ERROR_DEVICE_INITIALIZE_FAILED;
      case -101:
        return SiiErrorCode.SII_PM_ERROR_DATA_SIZE_ZERO;
      case -102:
        return SiiErrorCode.SII_PM_ERROR_OVER_MAX_DATA_SIZE;
      case -103:
        return SiiErrorCode.SII_PM_ERROR_DATA_SIZE_INVALID;
      case -111:
        return SiiErrorCode.SII_PM_ERROR_ENCODE_FAILED;
      case -201:
        return SiiErrorCode.SII_PM_ERROR_TIMEOUT;
      case -301:
        return SiiErrorCode.SII_PM_ERROR_FILE_NOT_FOUND;
      case -302:
        return SiiErrorCode.SII_PM_ERROR_FILE_USED;
      case -303:
        return SiiErrorCode.SII_PM_ERROR_FILE_INVALID;
      case -311:
        return SiiErrorCode.SII_PM_ERROR_LOW_MEMORY;
      case -312:
        return SiiErrorCode.SII_PM_ERROR_OVER_MAX_IMAGE;
      case -313:
        return SiiErrorCode.SII_PM_ERROR_LOGO_NOT_DEFINED;
      case -401:
        return SiiErrorCode.SII_PM_ERROR_LOW_USER_AREA;
      case -402:
        return SiiErrorCode.SII_PM_ERROR_LOW_EXTERNAL_RAM;
      case -403:
        return SiiErrorCode.SII_PM_ERROR_NOT_REGISTERD;
      case -404:
        return SiiErrorCode.SII_PM_ERROR_NOT_UNREGISTERD;
      case -501:
        return SiiErrorCode.SII_PM_ERROR_INVALID_NO;
      case -502:
        return SiiErrorCode.SII_PM_ERROR_OVER_STYLE_NUM;
      case -503:
        return SiiErrorCode.SII_PM_ERROR_INVALID_DATA;
      case -511:
        return SiiErrorCode.SII_PM_ERROR_PAGE_MODE_SPECIFIED;
      case -512:
        return SiiErrorCode.SII_PM_ERROR_PAGE_MODE_NOT_SPECIFIED;
      case -9999:
        return SiiErrorCode.SII_PM_ERROR_INVALID_PARAM;
      case 0:
        return SiiErrorCode.SII_PM_ERROR_NONE;
      default:
        return SiiErrorCode.SII_PM_ERROR_UNKNOWN;
    }
  }
}