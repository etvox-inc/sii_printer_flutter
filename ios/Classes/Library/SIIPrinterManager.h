//
//  SIIPrinterManager.h
//  SIIPrinterManager
//

#import <Foundation/Foundation.h>
#import <ExternalAccessory/ExternalAccessory.h>
#import "SIIPrinterEnum.h"
#import "SIIPrinterException.h"

#define SII_PM_PRINTER_MODEL_DPU_S445   281
#define SII_PM_PRINTER_MODEL_DPU_S245   284
#define SII_PM_PRINTER_MODEL_RP_E10     291
#define SII_PM_PRINTER_MODEL_RP_D10     295
#define SII_PM_PRINTER_MODEL_MP_B20     298
#define SII_PM_PRINTER_MODEL_MP_B30     302
#define SII_PM_PRINTER_MODEL_RP_F10     301
#define SII_PM_PRINTER_MODEL_MP_B30L    304

#define SII_PM_PRINTER_PORT_TYPE_BLUETOOTH  0
#define SII_PM_PRINTER_PORT_TYPE_USB        1
#define SII_PM_PRINTER_PORT_TYPE_TCP        2

#define SII_PM_COUNTRY_USA           0
#define SII_PM_COUNTRY_FRANCE        1
#define SII_PM_COUNTRY_GERMANY       2
#define SII_PM_COUNTRY_ENGLAND       3
#define SII_PM_COUNTRY_DENMARK_1     4
#define SII_PM_COUNTRY_SWEDEN        5
#define SII_PM_COUNTRY_ITALY         6
#define SII_PM_COUNTRY_SPAIN         7
#define SII_PM_COUNTRY_JAPAN         8
#define SII_PM_COUNTRY_NORWAY        9
#define SII_PM_COUNTRY_DENMARK_2     10
#define SII_PM_COUNTRY_SPAIN_2       11
#define SII_PM_COUNTRY_LATIN_AMERICA 12
#define SII_PM_COUNTRY_ARABIA        17

#define SII_PM_CODE_PAGE_437           0
#define SII_PM_CODE_PAGE_KATAKANA      1
#define SII_PM_CODE_PAGE_850           2
#define SII_PM_CODE_PAGE_860           3
#define SII_PM_CODE_PAGE_863           4
#define SII_PM_CODE_PAGE_865           5
#define SII_PM_CODE_PAGE_857           13
#define SII_PM_CODE_PAGE_737           14
#define SII_PM_CODE_PAGE_1252          16
#define SII_PM_CODE_PAGE_866           17
#define SII_PM_CODE_PAGE_852           18
#define SII_PM_CODE_PAGE_858           19
#define SII_PM_CODE_PAGE_855           34
#define SII_PM_CODE_PAGE_864           37
#define SII_PM_CODE_PAGE_1250          45
#define SII_PM_CODE_PAGE_1251          46
#define SII_PM_CODE_PAGE_1253          47
#define SII_PM_CODE_PAGE_1254          48

#define SII_PM_BARCODE_HEIGHT_DEFAULT       162
#define SII_PM_PDF417_MODULE_HEIGHT_DEFAULT 10
#define SII_PM_PDF417_ROW_AUTO              0
#define SII_PM_PDF417_COLUMN_AUTO           0

#define SII_PM_PRINTER_RESPONSE_REQUEST           0
#define SII_PM_PRINTER_RESPONSE_USER_AREA         1
#define SII_PM_PRINTER_RESPONSE_ARRANGE_USER_AREA 2
#define SII_PM_PRINTER_RESPONSE_NV_GRAPHICS       3
#define SII_PM_PRINTER_RESPONSE_KEY_CODE          4
#define SII_PM_PRINTER_RESPONSE_BATTERY_STATUS    5

#define SII_PM_BATTERY_STATUS_FULL   0
#define SII_PM_BATTERY_STATUS_MIDDLE 1
#define SII_PM_BATTERY_STATUS_LOW    2
#define SII_PM_BATTERY_STATUS_EMPTY  3

#define SII_PM_DISPLAY_RESPONSE_REQUEST          0
#define SII_PM_DISPLAY_RESPONSE_USER_AREA        1
#define SII_PM_DISPLAY_RESPONSE_TEMPLATE_ID_LIST 2
#define SII_PM_DISPLAY_RESPONSE_IMAGE_ID_LIST    3
#define SII_PM_DISPLAY_RESPONSE_SLIDE_ID_LIST    4
#define SII_PM_DISPLAY_RESPONSE_TEMPLATE_LABEL   5
#define SII_PM_DISPLAY_RESPONSE_IMAGE_LABEL      6
#define SII_PM_DISPLAY_RESPONSE_SLIDE_LABEL      7

typedef void(^SIIDiscoveryPrinterCompletion)(NSArray *printerList);

@class SIIPrinterManager;

@protocol SIIPrinterManagerDelegate <NSObject>

@optional

- (void)didStatusChange:(SIIPrinterManager *)printerManager status:(NSInteger)status;
- (void)didBarcodeScannerReadData:(SIIPrinterManager *)printerManager data:(NSData *)data;
- (void)didBarcodeScannerChangedOnline:(SIIPrinterManager *)printerManager;
- (void)didBarcodeScannerChangedOffline:(SIIPrinterManager *)printerManager;

@end

@interface SIIPrinterManager : NSObject

/**
 * Show accessory picker.(for Bluetooth)
 * @param predicate name filter.
 * @param completion completion event.
 */
- (void)startDiscoveryPrinter:(NSPredicate *)predicate completion:(EABluetoothAccessoryPickerCompletion)completion;

/**
 * Start discovery printer.(for TCP/IP)
 * @param retryCount retry count.
 * @param timeout timeout.
 * @param completion completion event.
 */
- (void)startDiscoveryPrinter:(NSInteger)retryCount timeout:(NSInteger)timeout completion:(SIIDiscoveryPrinterCompletion)completion;

/**
 * Cancel discovery printer.(for TCP/IP)
 */
- (void)cancelDiscoveryPrinter;

/**
 * Get discovered printer.(for TCP/IP)
 * @return SIIPrinterInfo list.
 */
- (NSArray *)getFoundPrinter;

/**
 * Connect printer by ip address.
 * @param printerModel Printer's model.
 * @param address Printer's ip address(TCP) or accessory's name(Bluetooth).
 * @param portType Printer's port type.
 */
- (void)connect:(NSInteger)printerModel address:(NSString *)address portType:(NSInteger)portType;

/**
 * Disconnect printer.
 */
- (void)disconnect;

/**
 * Send text to printer.
 * @param text Text data.
 */
- (void)sendText:(NSString *)text;

/**
 * Send text to printer with style.(for POS printer)
 * @param text Text data.
 * @param bold Bold.
 * @param underline Underline.
 * @param reverse Black white reverse.
 * @param font Font.
 * @param scale Character scale.
 * @param alignment Print position align.
 */
- (void)sendTextEx:(NSString *)text bold:(CharacterBold)bold underline:(CharacterUnderline)underline reverse:(CharacterReverse)reverse font:(CharacterFont)font scale:(CharacterScale)scale alignment:(PrintAlignment)alignment;

/**
 * Send text to printer with style.(for Mobile printer)
 * @param text Text data.
 * @param bold Bold.
 * @param underline Underline.
 * @param font Font.
 * @param scale Character scale.
 */
- (void)sendTextEx:(NSString *)text bold:(CharacterBold)bold underline:(CharacterUnderline)underline font:(CharacterFont)font scale:(CharacterScale)scale;

/**
 * Print barcode(UPC-A, UPC-E, JAN13, JAN8, CODE39, ITF, CODABAR, JAN13 Addon).
 * @param barcodeSymbol Barcode symbol.
 * @param text Barcode data.
 * @param moduleSize Module size.
 * @param moduleHeight Barcode height.
 * @param hriPosition HRI position.
 * @param hriFont HRI font.
 * @param alignment Print position align.
 */
- (void)printBarcode:(BarcodeSymbol)barcodeSymbol text:(NSString *)text moduleSize:(ModuleSize)moduleSize moduleHeight:(NSInteger)moduleHeight hriPosition:(HriPosition)hriPosition hriFont:(CharacterFont)hriFont alignment:(PrintAlignment)alignment;

/**
 * Print barcode(CODE39, ITF, CODABAR).
 * @param barcodeSymbol Barcode symbol.
 * @param text Barcode data.
 * @param moduleSize Module size.
 * @param moduleHeight Barcode height.
 * @param hriPosition HRI position.
 * @param hriFont HRI font.
 * @param alignment Print position align.
 * @param nwRatio NW ratio.
 */
- (void)printBarcode:(BarcodeSymbol)barcodeSymbol text:(NSString *)text moduleSize:(ModuleSize)moduleSize moduleHeight:(NSInteger)moduleHeight hriPosition:(HriPosition)hriPosition hriFont:(CharacterFont)hriFont alignment:(PrintAlignment)alignment nwRatio:(NwRatio)nwRatio;

/**
 * Print barcode(CODE93, CODE128).
 * @param barcodeSymbol Barcode symbol.
 * @param data Barcode data.
 * @param moduleSize Module size.
 * @param moduleHeight Barcode height.
 * @param hriPosition HRI position.
 * @param hriFont HRI font.
 * @param alignment Print position align.
 */
- (void)printBarcode:(BarcodeSymbol)barcodeSymbol data:(NSData *)data moduleSize:(ModuleSize)moduleSize moduleHeight:(NSInteger)moduleHeight hriPosition:(HriPosition)hriPosition hriFont:(CharacterFont)hriFont alignment:(PrintAlignment)alignment;

/**
 * Print PDF417 barcode.
 * @param text Barcode data.
 * @param errorCorrection Error correction.
 * @param row Row.
 * @param column Column.
 * @param moduleSize Module size.
 * @param moduleHeight Module height.
 * @param alignment Print position align.
 */
- (void)printPDF417:(NSString *)text errorCorrection:(ErrorCorrection)errorCorrection row:(NSInteger)row column:(NSInteger)column moduleSize:(ModuleSize)moduleSize moduleHeight:(NSInteger)moduleHeight alignment:(PrintAlignment)alignment;

/**
 * Print PDF417 barcode.
 * @param text Barcode data.
 * @param errorCorrection Error correction.
 * @param row Row.
 * @param column Column.
 * @param moduleSize Module size.
 * @param moduleHeight Module height.
 * @param alignment Print position align.
 * @param pdf417Symbol PDF417 symbol.
 */
- (void)printPDF417:(NSString *)text errorCorrection:(ErrorCorrection)errorCorrection row:(NSInteger)row column:(NSInteger)column moduleSize:(ModuleSize)moduleSize moduleHeight:(NSInteger)moduleHeight alignment:(PrintAlignment)alignment pdf417Symbol:(Pdf417Symbol)pdf417Symbol;

/**
 * Print model 2 QR code.
 * @param text QR code data.
 * @param errorCorrection Error correction.
 * @param moduleSize Module size.
 * @param alignment Print position align.
 */
- (void)printQRcode:(NSString *)text errorCorrection:(ErrorCorrection)errorCorrection moduleSize:(ModuleSize)moduleSize alignment:(PrintAlignment)alignment;

/**
 * Print QR code.
 * @param text QR code data.
 * @param errorCorrection Error correction.
 * @param moduleSize Module size.
 * @param alignment Print position align.
 * @param model Model.
 */
- (void)printQRcode:(NSString *)text errorCorrection:(ErrorCorrection)errorCorrection moduleSize:(ModuleSize)moduleSize alignment:(PrintAlignment)alignment model:(QrModel)model;

/**
 * Print DataMatrix.
 * @param text DataMatrix data.
 * @param dataMatrixModule DataMatrix Module number.
 * @param moduleSize Module size.
 * @param alignment Print position align.
 */
- (void)printDataMatrix:(NSString *)text dataMatrixModule:(DataMatrixModule)dataMatrixModule moduleSize:(ModuleSize)moduleSize alignment:(PrintAlignment)alignment;

/**
 * Print MaxiCode.
 * @param text MaxiCode data.
 * @param maxiCodeMode MaxiCode mode.
 * @param alignment Print position align.
 */
- (void)printMaxiCode:(NSString *)text maxiCodeMode:(MaxiCodeMode)maxiCodeMode alignment:(PrintAlignment)alignment;

/**
 * Print GS1 DataBar Stacked.
 * @param text GS1 DataBar Stacked data.
 * @param moduleSize Module size.
 * @param alignment Print position align.
 */
- (void)printGS1DataBarStacked:(NSString *)text moduleSize:(ModuleSize)moduleSize alignment:(PrintAlignment)alignment;

/**
 * Print GS1 DataBar Stacked Omnidirectional.
 * @param text GS1 DataBar Stacked Omnidirectional data.
 * @param moduleHeight Module height.
 * @param moduleSize Module size.
 * @param alignment Print position align.
 */
- (void)printGS1DataBarStackedOmnidirectional:(NSString *)text moduleHeight:(NSInteger)moduleHeight moduleSize:(ModuleSize)moduleSize alignment:(PrintAlignment)alignment;

/**
 * Print GS1 DataBar Expanded Stacked.
 * @param text GS1 DataBar Expanded Stacked data.
 * @param column Column.
 * @param moduleSize Module size.
 * @param alignment Print position align.
 */
- (void)printGS1DataBarExpandedStacked:(NSString *)text column:(NSInteger)column moduleSize:(ModuleSize)moduleSize alignment:(PrintAlignment)alignment;

/**
 * Print Aztec Code.
 * @param text Aztec Code data.
 * @param layer Layer.
 * @param errorCorrection Error correction.
 * @param moduleSize Module size.
 * @param aztecSymbol AztecSymbol.
 * @param alignment Print position align.
 */
- (void)printAztecCode:(NSString *)text layer:(NSInteger)layer errorCorrection:(NSInteger)errorCorrection moduleSize:(ModuleSize)moduleSize aztecSymbol:(AztecSymbol)aztecSymbol alignment:(PrintAlignment)alignment;

/**
 * Cut paper.
 * @param cuttingMethod Cutting method.
 */
- (void)cutPaper:(CuttingMethod)cuttingMethod;

/**
 * Marked paper form feed
 * @param feedPosition Position.
 */
- (void)feedPosition:(FeedPosition)feedPosition;

/**
 * Open drawer.
 * @param drawerNum Drawer number.
 * @param onOffTime On off time.
 */
- (void)openDrawer:(DrawerNum)drawerNum onOffTime:(PulseWidth)onOffTime;

/**
 * Buzzer.
 * @param onTime On time.
 * @param offTime Off time.
 */
- (void)buzzer:(NSInteger)onTime offTime:(NSInteger)offTime;

/**
 * External Buzzer.
 * @param buzzerPattern buzzer pattern.
 * @param buzzerCount buzzer count.
 */
- (void)externalBuzzer:(BuzzerPattern)buzzerPattern buzzerCount:(NSInteger)buzzerCount;

/**
 * Send binary data.
 * @param data Data.
 */
- (void)sendBinary:(NSData *)data;

/**
 * Send file.(for POS printer)
 * @param fileName File path.
 * @param alignment Print position align.
 * @param dithering Dithering selection for image file.
 */
- (void)sendDataFile:(NSString *)fileName alignment:(PrintAlignment)alignment dithering:(Dithering)dithering;

/**
 * Send file.(for POS printer)
 * @param fileName File path.
 * @param alignment Print position align.
 */
- (void)sendDataFile:(NSString *)fileName alignment:(PrintAlignment)alignment;

/**
 * Send file.(for Mobile printer)
 * @param fileName File path.
 */
- (void)sendDataFile:(NSString *)fileName;

/**
 * Get status.
 * @param buf Buffer for saving status result.
 */
- (void)getStatus:(NSInteger[])buf;

/**
 * Abort.
 */
- (void)abort;

/**
 * Register logo.
 * @param fileName File path.
 * @param logoId Logo id.
 * @param dithering Dithering selection for image file.
 */
- (void)registerLogo:(NSString *)fileName logoId:(NSString *)logoId dithering:(Dithering)dithering;

/**
 * Register logo.
 * @param fileName File path.
 * @param logoId Logo id.
 */
- (void)registerLogo:(NSString *)fileName logoId:(NSString *)logoId;

/**
 * Print logo.(for POS printer)
 * @param logoId Logo id.
 * @param alignment Print position align.
 */
- (void)printLogo:(NSString *)logoId alignment:(PrintAlignment)alignment;

/**
 * Print logo.(for Mobile printer)
 * @param logoId Logo id.
 */
- (void)printLogo:(NSString *)logoId;

/**
 * Unregister logo.
 * @param logoId Logo id.
 */
- (void)unregisterLogo:(NSString *)logoId;

/**
 * Register style sheet.
 * @param fileName File path.
 * @param cssId CSS id.
 */
- (void)registerStyleSheet:(NSString *)fileName cssId:(NSInteger)cssId;

/**
 * Unregister style sheet.
 * @param cssId CSS id.
 */
- (void)unregisterStyleSheet:(NSInteger)cssId;

/**
 * Reset printer.
 */
- (void)resetPrinter;

/**
 * Get printer response.
 * @param responseId response ID.
 * @param param Parameter.
 * @param response response.
 */
- (void)getPrinterResponse:(NSInteger)responseId param:(NSObject *)param response:(void *)response;

/**
 * Start/finish print data batch sending
 * @param control Operation selection of batch process
 */
- (void)controlTransaction:(TransactionFunction)control;

/**
 * Start page mode print.
 */
- (void)enterPageMode;

/**
 * End page mode print.
 */
- (void)exitPageMode;

/**
 * Set page area.
 * @param x X coordinate of upper left.
 * @param y Y coordinate of upper left.
 * @param width width.
 * @param height height.
 */
- (void)setPageModeArea:(NSInteger)x y:(NSInteger)y width:(NSInteger)width height:(NSInteger)height;

/**
 * Set page direction.
 * @param direction direction.
 */
- (void)setPageModeDirection:(Direction)direction;

/**
 * Set page line space.
 * @param lineSpacing line space.
 */
- (void)setPageModeLineSpacing:(NSInteger)lineSpacing;

/**
 * Print in page mode.
 * @param cuttingMethod Cutting method.
 */
- (void)printPageMode:(CuttingMethod)cuttingMethod;

/**
 * Place a text in the page area
 * @param startX startX coordinate of lower left.
 * @param startY startY coordinate of lower left.
 * @param text Text data.
 */
- (void)printPageModeText:(NSInteger)startX startY:(NSInteger)startY text:(NSString *)text;

/**
 * Place a text with style in the page area.
 * @param startX startX coordinate of lower left.
 * @param startY startY coordinate of lower left.
 * @param text Text data.
 * @param bold Bold.
 * @param underline Underline.
 * @param reverse Black white reverse.
 * @param font Font.
 * @param scale Character scale.
 */
- (void)printPageModeTextEx:(NSInteger)startX startY:(NSInteger)startY text:(NSString *)text bold:(CharacterBold)bold underline:(CharacterUnderline)underline reverse:(CharacterReverse)reverse font:(CharacterFont)font scale:(CharacterScale)scale;

/**
 * Place a barcode(UPC-A, UPC-E, JAN13, JAN8, CODE39, ITF, CODABAR, JAN13 Addon) in the page area.
 * @param startX startX coordinate of lower left.
 * @param startY startY coordinate of lower left.
 * @param barcodeSymbol Barcode symbol.
 * @param text Barcode data.
 * @param moduleSize Module size.
 * @param moduleHeight Barcode height.
 * @param hriPosition HRI position.
 * @param hriFont HRI font.
 */
- (void)printPageModeBarcode:(NSInteger)startX startY:(NSInteger)startY barcodeSymbol:(BarcodeSymbol)barcodeSymbol text:(NSString *)text moduleSize:(ModuleSize)moduleSize moduleHeight:(NSInteger)moduleHeight hriPosition:(HriPosition)hriPosition hriFont:(CharacterFont)hriFont;

/**
 * Place a barcode(CODE39, ITF, CODABAR) in the page area.
 * @param startX startX coordinate of lower left.
 * @param startY startY coordinate of lower left.
 * @param barcodeSymbol Barcode symbol.
 * @param text Barcode data.
 * @param moduleSize Module size.
 * @param moduleHeight Barcode height.
 * @param hriPosition HRI position.
 * @param hriFont HRI font.
 * @param nwRatio NW ratio.
 */
- (void)printPageModeBarcode:(NSInteger)startX startY:(NSInteger)startY barcodeSymbol:(BarcodeSymbol)barcodeSymbol text:(NSString *)text moduleSize:(ModuleSize)moduleSize moduleHeight:(NSInteger)moduleHeight hriPosition:(HriPosition)hriPosition hriFont:(CharacterFont)hriFont nwRatio:(NwRatio)nwRatio;

/**
 * Place a barcode(CODE93, CODE128) in the page area.
 * @param startX startX coordinate of lower left.
 * @param startY startY coordinate of lower left.
 * @param barcodeSymbol Barcode symbol.
 * @param data Barcode data.
 * @param moduleSize Module size.
 * @param moduleHeight Barcode height.
 * @param hriPosition HRI position.
 * @param hriFont HRI font.
 */
- (void)printPageModeBarcode:(NSInteger)startX startY:(NSInteger)startY barcodeSymbol:(BarcodeSymbol)barcodeSymbol data:(NSData *)data moduleSize:(ModuleSize)moduleSize moduleHeight:(NSInteger)moduleHeight hriPosition:(HriPosition)hriPosition hriFont:(CharacterFont)hriFont;

/**
 * Place a PDF417 barcode in the page area.
 * @param startX startX coordinate of lower left.
 * @param startY startY coordinate of lower left.
 * @param text Barcode data.
 * @param errorCorrection Error correction.
 * @param row Row.
 * @param column Column.
 * @param moduleSize Module size.
 * @param moduleHeight Module height.
 */
- (void)printPageModePDF417:(NSInteger)startX startY:(NSInteger)startY text:(NSString *)text errorCorrection:(ErrorCorrection)errorCorrection row:(NSInteger)row column:(NSInteger)column moduleSize:(ModuleSize)moduleSize moduleHeight:(NSInteger)moduleHeight;

/**
 * Place a PDF417 barcode in the page area.
 * @param startX startX coordinate of lower left.
 * @param startY startY coordinate of lower left.
 * @param text Barcode data.
 * @param errorCorrection Error correction.
 * @param row Row.
 * @param column Column.
 * @param moduleSize Module size.
 * @param moduleHeight Module height.
 * @param pdf417Symbol PDF417 symbol.
 */
- (void)printPageModePDF417:(NSInteger)startX startY:(NSInteger)startY text:(NSString *)text errorCorrection:(ErrorCorrection)errorCorrection row:(NSInteger)row column:(NSInteger)column moduleSize:(ModuleSize)moduleSize moduleHeight:(NSInteger)moduleHeight pdf417Symbol:(Pdf417Symbol)pdf417Symbol;

/**
 * Place a model 2 QR code in the page area.
 * @param startX startX coordinate of lower left.
 * @param startY startY coordinate of lower left.
 * @param text QR code data.
 * @param errorCorrection Error correction.
 * @param moduleSize Module size.
 */
- (void)printPageModeQRcode:(NSInteger)startX startY:(NSInteger)startY text:(NSString *)text errorCorrection:(ErrorCorrection)errorCorrection moduleSize:(ModuleSize)moduleSize;

/**
 * Place a QR code in the page area.
 * @param startX startX coordinate of lower left.
 * @param startY startY coordinate of lower left.
 * @param text QR code data.
 * @param errorCorrection Error correction.
 * @param moduleSize Module size.
 * @param model Model.
 */
- (void)printPageModeQRcode:(NSInteger)startX startY:(NSInteger)startY text:(NSString *)text errorCorrection:(ErrorCorrection)errorCorrection moduleSize:(ModuleSize)moduleSize model:(QrModel)model;

/**
 * Place a DataMatrix in the page area.
 * @param startX startX coordinate of lower left.
 * @param startY startY coordinate of lower left.
 * @param text DataMatrix data.
 * @param dataMatrixModule DataMatrix Module number.
 * @param moduleSize Module size.
 */
- (void)printPageModeDataMatrix:(NSInteger)startX startY:(NSInteger)startY text:(NSString *)text dataMatrixModule:(DataMatrixModule)dataMatrixModule moduleSize:(ModuleSize)moduleSize;

/**
 * Place a MaxiCode in the page area.
 * @param startX startX coordinate of lower left.
 * @param startY startY coordinate of lower left.
 * @param text MaxiCode data.
 * @param maxiCodeMode MaxiCode mode.
 */
- (void)printPageModeMaxiCode:(NSInteger)startX startY:(NSInteger)startY text:(NSString *)text maxiCodeMode:(MaxiCodeMode)maxiCodeMode;

/**
 * Place a GS1 DataBar Stacked in the page area.
 * @param startX startX coordinate of lower left.
 * @param startY startY coordinate of lower left.
 * @param text GS1 DataBar Stacked data.
 * @param moduleSize Module size.
 */
- (void)printPageModeGS1DataBarStacked:(NSInteger)startX startY:(NSInteger)startY text:(NSString *)text moduleSize:(ModuleSize)moduleSize;

/**
 * Place a GS1 DataBar Stacked Omnidirectional in the page area.
 * @param startX startX coordinate of lower left.
 * @param startY startY coordinate of lower left.
 * @param text GS1 DataBar Stacked Omnidirectional data.
 * @param moduleHeight Module height.
 * @param moduleSize Module size.
 */
- (void)printPageModeGS1DataBarStackedOmnidirectional:(NSInteger)startX startY:(NSInteger)startY text:(NSString *)text moduleHeight:(NSInteger)moduleHeight moduleSize:(ModuleSize)moduleSize;

/**
 * Place a GS1 DataBar Expanded Stacked in the page area.
 * @param startX startX coordinate of lower left.
 * @param startY startY coordinate of lower left.
 * @param text GS1 DataBar Expanded Stacked data.
 * @param column Column.
 * @param moduleSize Module size.
 */
- (void)printPageModeGS1DataBarExpandedStacked:(NSInteger)startX startY:(NSInteger)startY text:(NSString *)text column:(NSInteger)column moduleSize:(ModuleSize)moduleSize;

/**
 * Place a Aztec Code in the page area.
 * @param startX startX coordinate of lower left.
 * @param startY startY coordinate of lower left.
 * @param text Aztec Code data.
 * @param layer Layer.
 * @param errorCorrection Error correction.
 * @param moduleSize Module size.
 * @param aztecSymbol AztecSymbol.
 */
- (void)printPageModeAztecCode:(NSInteger)startX startY:(NSInteger)startY text:(NSString *)text layer:(NSInteger)layer errorCorrection:(NSInteger)errorCorrection moduleSize:(ModuleSize)moduleSize aztecSymbol:(AztecSymbol)aztecSymbol;

/**
 * Send binary data in the page mode.
 * @param data Data.
 */
- (void)sendPageModeBinary:(NSData *)data;

/**
 * Print image file in the page area.
 * @param startX startX coordinate of lower left.
 * @param startY startY coordinate of lower left.
 * @param fileName File path.
 * @param dithering Dithering selection for image file.
 */
- (void)printPageModeImageFile:(NSInteger)startX startY:(NSInteger)startY fileName:(NSString *)fileName dithering:(Dithering)dithering;

/**
 * Print logo in the page area.
 * @param startX startX coordinate of lower left.
 * @param startY startY coordinate of lower left.
 * @param logoId Logo id.
*/
- (void)printPageModeLogo:(NSInteger)startX startY:(NSInteger)startY logoId:(NSString *)logoId;

/**
 * Print rectangle in the page area.
 * @param startX startX coordinate of upper left.
 * @param startY startY coordinate of upper left.
 * @param endX endX coordinate of lower right.
 * @param endY endY coordinate of lower right.
 * @param lineStyle lineStyle.
*/
- (void)printPageModeRectangle:(NSInteger)startX startY:(NSInteger)startY endX:(NSInteger)endX endY:(NSInteger)endY lineStyle:(LineStyle)lineStyle;

/**
 * Print horizontal line in the page area.
 * @param startX startX
 * @param startY startY
 * @param endX endX
 * @param endY endY
 * @param lineStyle lineStyle.
*/
- (void)printPageModeLine:(NSInteger)startX startY:(NSInteger)startY endX:(NSInteger)endX endY:(NSInteger)endY lineStyle:(LineStyle)lineStyle;

/**
 * Optimizes memory area.
 * @param memoryArea Specifies memory area
 */
- (void)defragment:(MemoryArea)memoryArea;

/**
 * Initializes memory area.
 * @param memoryArea Specifies memory area
 */
- (void)initializeMemoryArea:(MemoryArea)memoryArea;

/**
 * Shows template on the screen.
 * @param time_ms Screen display time
 */
- (void)showTemplate:(NSInteger)time_ms;

/**
 * Shows slide on the screen.
 * @param slideID Slide number
 * @param time_ms Screen display time
 */
- (void)showSlide:(NSInteger)slideID time_ms:(NSInteger)time_ms;

/**
 * Shows standby on the screen.
 */
- (void)enterStandbyMode;

/**
 * Executes the registered macro.
 * @param macroID Macro number
 * @param repeatCount The number of execution times
 */
- (void)executeMacro:(NSInteger)macroID repeatCount:(NSInteger)repeatCount;

/**
 * Sets the screen backlight on/off.
 * @param isOn Operation.
 */
- (void)turnOnScreen:(BOOL)isOn;

/**
 * Selects a template.
 * @param templateID Template number.
 * @param slideID Slide number.
 */
- (void)selectTemplate:(NSInteger)templateID slideID:(NSInteger)slideID;

/**
 * Selects a template.
 * @param templateID Template number.
 */
- (void)selectTemplate:(NSInteger)templateID;

/**
 * Specifies an image to show on a selecting template.
 * @param mapID Map ID.
 * @param imageID Image number.
 */
- (void)setTemplateImageData:(NSInteger)mapID imageID:(NSInteger)imageID;

/**
 * Selects the map ID of the text object to start modify.
 * @param mapID Map ID.
 */
- (void)selectTemplateTextObject:(NSInteger)mapID;

/**
 * Specifies alignment to text data.
 * @param alignment Alignment.
 */
- (void)setTemplateTextAlignment:(PrintAlignment)alignment;

/**
 * Specifies left margin to text data.
 * @param margin Left margin.
 */
- (void)setTemplateTextLeftMargin:(NSInteger)margin;

/**
 * Specifies line spacing to text data.
 * @param spacing Line spacing.
 */
- (void)setTemplateTextLineSpacing:(NSInteger)spacing;

/**
 * Specifies/cancels bold character to text data.
 * @param bold Bold.
 */
- (void)setTemplateTextBold:(CharacterBold)bold;

/**
 * Specifies/cancels underline to text data.
 * @param underline Underline.
 */
- (void)setTemplateTextUnderline:(CharacterUnderline)underline;

/**
 * Specifies character size to text data.
 * @param scale Character scale.
 */
- (void)setTemplateTextSize:(CharacterScale)scale;

/**
 * Specifies a character font to text data.
 * @param font Character font.
 */
- (void)setTemplateTextFont:(CharacterFont)font;

/**
 * Specifies the registered font used for text data.
 * @param font Registered font.
 */
- (void)setTemplateTextRegisteredFont:(RegisteredFont)font;

/**
 * Specifies character spacing to text data.
 * @param spacing Character spacing.
 */
- (void)setTemplateTextRightSpacing:(NSInteger)spacing;

/**
 * Specifies the character color used for text data.
 * @param color Character color.
 */
- (void)setTemplateTextColor:(NSInteger)color;

/**
 * Specifies the text data to be shown in the text object specified by selectTemplateTextObject.
 * @param text Text data.
 */
- (void)setTemplateTextData:(NSString *)text;

/**
 * Specifies map ID of a barcode object on a selecting template, and specify barcode data.
 * @param mapID Map ID.
 * @param text Barcode data.
 */
- (void)setTemplateBarcodeData:(NSInteger)mapID text:(NSString *)text;

/**
 * Specifies map ID of a barcode object on a selecting template, and specify barcode data.
 * @param mapID Map ID.
 * @param data Barcode data.
 */
- (void)setTemplateBarcodeData:(NSInteger)mapID data:(NSData *)data;

/**
 * Specifies map ID of a QR Code object on a selecting template, and specifies QR Code data.
 * @param mapID Map ID.
 * @param moduleSize Mosule size.
 * @param errorCorrection Error correction level.
 * @param mode Data mode.
 * @param qrQuietZone Quiet zone flag.
 * @param text QR Code data.
 */
- (void)setTemplateQrCodeData:(NSInteger)mapID moduleSize:(ModuleSize)moduleSize errorCorrection:(ErrorCorrection)errorCorrection mode:(QrDataMode)mode qrQuietZone:(QrQuietZone)qrQuietZone text:(NSString *)text;

/**
 * Specifies map ID of a QR Code object on a selecting template, and specifies QR Code data.
 * @param mapID Map ID.
 * @param text QR Code data.
 */
- (void)setTemplateQrCodeData:(NSInteger)mapID text:(NSString *)text;

/**
 * Specifies map ID of a QR Code object on a selecting template, and specifies QR Code data.
 * @param mapID Map ID.
 * @param moduleSize Mosule size.
 * @param errorCorrection Error correction level.
 * @param mode Data mode.
 * @param qrQuietZone Quiet zone flag.
 * @param data QR Code data.
 */
- (void)setTemplateQrCodeData:(NSInteger)mapID moduleSize:(ModuleSize)moduleSize errorCorrection:(ErrorCorrection)errorCorrection mode:(QrDataMode)mode qrQuietZone:(QrQuietZone)qrQuietZone data:(NSData *)data;

/**
 * Specifies map ID of a QR Code object on a selecting template, and specifies QR Code data.
 * @param mapID Map ID.
 * @param data QR Code data.
 */
- (void)setTemplateQrCodeData:(NSInteger)mapID data:(NSData *)data;

/**
 * Registers a template.
 * @param templateID Template number.
 * @param label Template name.
 * @param fileName File path.
 */
- (void)registerTemplate:(NSInteger)templateID label:(NSString *)label fileName:(NSString *)fileName;

/**
 * Deletes the registered template.
 * @param templateID Template number.
 */
- (void)unregisterTemplate:(NSInteger)templateID;

/**
 * Registers image data.
 * @param imageID Image number.
 * @param label Image name.
 * @param fileName File path.
 */
- (void)registerImageData:(NSInteger)imageID label:(NSString *)label fileName:(NSString *)fileName;

/**
 * Deletes the registered image data.
 * @param imageID Image number.
 */
- (void)unregisterImageData:(NSInteger)imageID;

/**
 * Registers slide data.
 * @param slideID Slide number.
 * @param label Slide name.
 * @param fileName File path.
 */
- (void)registerSlideData:(NSInteger)slideID label:(NSString *)label fileName:(NSString *)fileName;

/**
 * Deletes the registered slide data.
 * @param slideID Slide number.
 */
- (void)unregisterSlideData:(NSInteger)slideID;

/**
 * Registers user-defined character.
 * @param fileName File path.
 */
- (void)registerUserDefinedCharacter:(NSString *)fileName;

/**
 * Deletes the registered user-defined character.
 */
- (void)unregisterUserDefinedCharacter;

/**
 * Registers optional font.
 * @param startCode Registration start character code.
 * @param endCode Registration end character code.
 * @param width Character width.
 * @param height Character height.
 * @param fileName File path.
 */
- (void)registerOptionFont:(NSInteger)startCode endCode:(NSInteger)endCode width:(NSInteger)width height:(NSInteger)height fileName:(NSString *)fileName;

/**
 * Deletes the registered optional font.
 */
- (void)unregisterOptionFont;

/**
 * Specifies start and end of macro registeration.
 * @param macroID Macro number.
 * @param control Macro processing selection.
 */
- (void)controlMacroRegistration:(NSInteger)macroID control:(MacroRegistrationFunction)control;

/**
 * Get display response.
 * @param responseId response ID.
 * @param param Parameter.
 * @param response response.
 */
- (void)getDisplayResponse:(NSInteger)responseId param:(NSObject *)param response:(void *)response;

/**
 * Set or get send timeout.
 */
@property NSInteger sendTimeout;

/**
 * Set or get receive timeout.
 */
@property NSInteger receiveTimeout;

/**
 * Get port type.
 */
@property(readonly) NSInteger portType;

/**
 * Get connect state.
 */
@property(readonly) BOOL isConnect;

/**
 * Set or get socket keeping time.
 */
@property NSInteger socketKeepingTime;

/**
 * Set or get international character.
 */
@property NSInteger internationalCharacter;

/**
 * Set or get code page.
 */
@property NSInteger codePage;

/**
 * Get printer model.
 */
@property(readonly) NSInteger printerModel;

/**
 * Set or get printer delegate.
 */
@property(weak, nonatomic) id <SIIPrinterManagerDelegate> delegate;

@end


@interface SIIPrinterInfo : NSObject
{
    NSString *_mac;
    NSString *_ip;
    NSString *_name;
}

@property NSString *mac;
@property NSString *ip;
@property NSString *name;

@end

