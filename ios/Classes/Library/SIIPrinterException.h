//
//  SIIPrinterException.h
//  SIIPrinterManager
//

#import <Foundation/Foundation.h>

#define SII_PM_ERROR_ACCESS_DENIED              -1
#define SII_PM_ERROR_SHARING_VIOLATION          -11
#define SII_PM_ERROR_PORT_NOT_OPENED            -12
#define SII_PM_ERROR_DEVICE_NOT_CONNECTED       -21
#define SII_PM_ERROR_OFFLINE                    -22
#define SII_PM_ERROR_EXTERNAL_DEVICE_NOT_CONNECTED -23
#define SII_PM_ERROR_DEVICE_INITIALIZE_FAILED   -31
#define SII_PM_ERROR_DATA_SIZE_ZERO             -101
#define SII_PM_ERROR_OVER_MAX_DATA_SIZE         -102
#define SII_PM_ERROR_DATA_SIZE_INVALID          -103
#define SII_PM_ERROR_ENCODE_FAILED              -111
#define SII_PM_ERROR_TIMEOUT                    -201
#define SII_PM_ERROR_FILE_NOT_FOUND             -301
#define SII_PM_ERROR_FILE_USED                  -302
#define SII_PM_ERROR_FILE_INVALID               -303
#define SII_PM_ERROR_LOW_MEMORY                 -311
#define SII_PM_ERROR_OVER_MAX_IMAGE             -312
#define SII_PM_ERROR_LOGO_NOT_DEFINED           -313
#define SII_PM_ERROR_LOW_USER_AREA              -401
#define SII_PM_ERROR_LOW_EXTERNAL_RAM           -402
#define SII_PM_ERROR_NOT_REGISTERD              -403
#define SII_PM_ERROR_NOT_UNREGISTERD            -404


#define SII_PM_ERROR_INVALID_NO                 -501
#define SII_PM_ERROR_OVER_STYLE_NUM             -502
#define SII_PM_ERROR_INVALID_DATA               -503
#define SII_PM_ERROR_PAGE_MODE_SPECIFIED        -511
#define SII_PM_ERROR_PAGE_MODE_NOT_SPECIFIED    -512
#define SII_PM_ERROR_INVALID_PARAM              -9999

@interface SIIPrinterException : NSException

- (id)initWithErrorCode:(NSInteger)errorCode errorMessage:(NSString *)errorMessage;
- (id)initWithErrorCode:(NSInteger)errorCode extended:(NSInteger)extended;

@property NSInteger errorCode;
@property NSString *errorMessage;

@end

