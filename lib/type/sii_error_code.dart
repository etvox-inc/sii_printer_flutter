enum SiiErrorCode {
  SII_PM_ERROR_NONE,
  SII_PM_ERROR_UNKNOWN,
  SII_PM_ERROR_ACCESS_DENIED,
  SII_PM_ERROR_SHARING_VIOLATION,
  SII_PM_ERROR_PORT_NOT_OPENED,
  SII_PM_ERROR_DEVICE_NOT_CONNECTED,
  SII_PM_ERROR_OFFLINE,
  SII_PM_ERROR_EXTERNAL_DEVICE_NOT_CONNECTED,
  SII_PM_ERROR_DEVICE_INITIALIZE_FAILED,
  SII_PM_ERROR_DATA_SIZE_ZERO,
  SII_PM_ERROR_OVER_MAX_DATA_SIZE,
  SII_PM_ERROR_DATA_SIZE_INVALID,
  SII_PM_ERROR_ENCODE_FAILED,
  SII_PM_ERROR_TIMEOUT,
  SII_PM_ERROR_FILE_NOT_FOUND,
  SII_PM_ERROR_FILE_USED,
  SII_PM_ERROR_FILE_INVALID,
  SII_PM_ERROR_LOW_MEMORY,
  SII_PM_ERROR_OVER_MAX_IMAGE,
  SII_PM_ERROR_LOGO_NOT_DEFINED,
  SII_PM_ERROR_LOW_USER_AREA,
  SII_PM_ERROR_LOW_EXTERNAL_RAM,
  SII_PM_ERROR_NOT_REGISTERD,
  SII_PM_ERROR_NOT_UNREGISTERD,
  SII_PM_ERROR_INVALID_NO,
  SII_PM_ERROR_OVER_STYLE_NUM,
  SII_PM_ERROR_INVALID_DATA,
  SII_PM_ERROR_PAGE_MODE_SPECIFIED,
  SII_PM_ERROR_PAGE_MODE_NOT_SPECIFIED,
  SII_PM_ERROR_INVALID_PARAM,
}

extension StatusCodeExtension on SiiErrorCode {
  String get message {
    switch (this) {
      case SiiErrorCode.SII_PM_ERROR_ACCESS_DENIED:
        return "Exception:ACCESS_DENIED";
      case SiiErrorCode.SII_PM_ERROR_SHARING_VIOLATION:
        return "Exception:SHARING_VIOLATION";
      case SiiErrorCode.SII_PM_ERROR_PORT_NOT_OPENED:
        return "Exception:PORT_NOT_OPENED";
      case SiiErrorCode.SII_PM_ERROR_DEVICE_NOT_CONNECTED:
        return "Exception:DEVICE_NOT_CONNECTED";
      case SiiErrorCode.SII_PM_ERROR_OFFLINE:
        return "Exception:OFFLINE";
      case SiiErrorCode.SII_PM_ERROR_EXTERNAL_DEVICE_NOT_CONNECTED:
        return "Exception:EXTERNAL_DEVICE_NOT_CONNECTED";
      case SiiErrorCode.SII_PM_ERROR_DEVICE_INITIALIZE_FAILED:
        return "Exception:DEVICE_INITIALIZE_FAILED";
      case SiiErrorCode.SII_PM_ERROR_DATA_SIZE_ZERO:
        return "Exception:DATA_SIZE_ZERO";
      case SiiErrorCode.SII_PM_ERROR_OVER_MAX_DATA_SIZE:
        return "Exception:OVER_MAX_DATA_SIZE";
      case SiiErrorCode.SII_PM_ERROR_DATA_SIZE_INVALID:
        return "Exception:DATA_SIZE_INVALID";
      case SiiErrorCode.SII_PM_ERROR_ENCODE_FAILED:
        return "Exception:ENCODE_FAILED";
      case SiiErrorCode.SII_PM_ERROR_TIMEOUT:
        return "Exception:TIMEOUT";
      case SiiErrorCode.SII_PM_ERROR_FILE_NOT_FOUND:
        return "Exception:FILE_NOT_FOUND";
      case SiiErrorCode.SII_PM_ERROR_FILE_USED:
        return "Exception:FILE_USED";
      case SiiErrorCode.SII_PM_ERROR_FILE_INVALID:
        return "Exception:FILE_INVALID";
      case SiiErrorCode.SII_PM_ERROR_LOW_MEMORY:
        return "Exception:LOW_MEMORY";
      case SiiErrorCode.SII_PM_ERROR_OVER_MAX_IMAGE:
        return "Exception:OVER_MAX_IMAGE";
      case SiiErrorCode.SII_PM_ERROR_LOGO_NOT_DEFINED:
        return "Exception:LOGO_NOT_DEFINED";
      case SiiErrorCode.SII_PM_ERROR_LOW_USER_AREA:
        return "Exception:LOW_USER_AREA";
      case SiiErrorCode.SII_PM_ERROR_LOW_EXTERNAL_RAM:
        return "Exception:LOW_EXTERNAL_RAM";
      case SiiErrorCode.SII_PM_ERROR_NOT_REGISTERD:
        return "Exception:NOT_REGISTERD";
      case SiiErrorCode.SII_PM_ERROR_NOT_UNREGISTERD:
        return "Exception:NOT_UNREGISTERD";
      case SiiErrorCode.SII_PM_ERROR_INVALID_NO:
        return "Exception:INVALID_NO";
      case SiiErrorCode.SII_PM_ERROR_OVER_STYLE_NUM:
        return "Exception:OVER_STYLE_NUM";
      case SiiErrorCode.SII_PM_ERROR_INVALID_DATA:
        return "Exception:INVALID_DATA";
      case SiiErrorCode.SII_PM_ERROR_PAGE_MODE_SPECIFIED:
        return "Exception:PAGE_MODE_SPECIFIED";
      case SiiErrorCode.SII_PM_ERROR_PAGE_MODE_NOT_SPECIFIED:
        return "Exception:PAGE_MODE_NOT_SPECIFIED";
      case SiiErrorCode.SII_PM_ERROR_INVALID_PARAM:
        return "Exception:INVALID_PARAM";
      case SiiErrorCode.SII_PM_ERROR_NONE:
        return "No error";
      default:
        return "Exception:Unknown error";

    }
  }
}
