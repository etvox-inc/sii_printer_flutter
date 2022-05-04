//
//  SIIPrinterManagerWrapper.h
//  SiiLibSample
//

#import "SIIPrinterManager.h"

@class SIIPrinterManagerWrapper;

@interface SIIPrinterManagerWrapper : NSObject

- (BOOL)connect:(int)printerModel address:(NSString *)address portType:(int)portType :(NSError **)error;
- (BOOL)disconnect:(NSError **)error;
- (BOOL)sendText:(NSString *)text :(NSError **)error;
- (BOOL)sendTextEx:(NSString *)text bold:(CharacterBold)bold underline:(CharacterUnderline)underline reverse:(CharacterReverse)reverse font:(CharacterFont)font scale:(CharacterScale)scale alignment:(PrintAlignment)alignment :(NSError **)error;
- (BOOL)sendTextEx:(NSString *)text bold:(CharacterBold)bold underline:(CharacterUnderline)underline font:(CharacterFont)font scale:(CharacterScale)scale :(NSError **)error;
- (BOOL)printBarcode:(BarcodeSymbol)barcodeSymbol text:(NSString *)text moduleSize:(ModuleSize)moduleSize moduleHeight:(NSInteger)moduleHeight hriPosition:(HriPosition)hriPosition hriFont:(CharacterFont)hriFont alignment:(PrintAlignment)alignment :(NSError **)error;
- (BOOL)printBarcode:(BarcodeSymbol)barcodeSymbol text:(NSString *)text moduleSize:(ModuleSize)moduleSize moduleHeight:(NSInteger)moduleHeight hriPosition:(HriPosition)hriPosition hriFont:(CharacterFont)hriFont alignment:(PrintAlignment)alignment nwRatio:(NwRatio)nwRatio :(NSError **)error;
- (BOOL)printBarcode:(BarcodeSymbol)barcodeSymbol data:(NSData *)data moduleSize:(ModuleSize)moduleSize moduleHeight:(NSInteger)moduleHeight hriPosition:(HriPosition)hriPosition hriFont:(CharacterFont)hriFont alignment:(PrintAlignment)alignment :(NSError **)error;
- (BOOL)printPDF417:(NSString *)text errorCorrection:(ErrorCorrection)errorCorrection row:(NSInteger)row column:(NSInteger)column moduleSize:(ModuleSize)moduleSize moduleHeight:(NSInteger)moduleHeight alignment:(PrintAlignment)alignment :(NSError **)error;
- (BOOL)printPDF417:(NSString *)text errorCorrection:(ErrorCorrection)errorCorrection row:(NSInteger)row column:(NSInteger)column moduleSize:(ModuleSize)moduleSize moduleHeight:(NSInteger)moduleHeight alignment:(PrintAlignment)alignment pdf417Symbol:(Pdf417Symbol)pdf417Symbol :(NSError **)error;
- (BOOL)printQRcode:(NSString *)text errorCorrection:(ErrorCorrection)errorCorrection moduleSize:(ModuleSize)moduleSize alignment:(PrintAlignment)alignment :(NSError **)error;
- (BOOL)printQRcode:(NSString *)text errorCorrection:(ErrorCorrection)errorCorrection moduleSize:(ModuleSize)moduleSize alignment:(PrintAlignment)alignment model:(QrModel)model :(NSError **)error;
- (BOOL)printDataMatrix:(NSString *)text dataMatrixModule:(DataMatrixModule)dataMatrixModule moduleSize:(ModuleSize)moduleSize alignment:(PrintAlignment)alignment :(NSError **)error;
- (BOOL)printMaxiCode:(NSString *)text maxiCodeMode:(MaxiCodeMode)maxiCodeMode alignment:(PrintAlignment)alignment :(NSError **)error;
- (BOOL)printGS1DataBarStacked:(NSString *)text moduleSize:(ModuleSize)moduleSize alignment:(PrintAlignment)alignment :(NSError **)error;
- (BOOL)printGS1DataBarStackedOmnidirectional:(NSString *)text moduleHeight:(NSInteger)moduleHeight moduleSize:(ModuleSize)moduleSize alignment:(PrintAlignment)alignment :(NSError **)error;
- (BOOL)printGS1DataBarExpandedStacked:(NSString *)text column:(NSInteger)column moduleSize:(ModuleSize)moduleSize alignment:(PrintAlignment)alignment :(NSError **)error;
- (BOOL)printAztecCode:(NSString *)text layer:(NSInteger)layer errorCorrection:(NSInteger)errorCorrection moduleSize:(ModuleSize)moduleSize aztecSymbol:(AztecSymbol)aztecSymbol alignment:(PrintAlignment)alignment :(NSError **)error;
- (BOOL)cutPaper:(CuttingMethod)cuttingMethod :(NSError **)error;
- (BOOL)feedPosition:(FeedPosition)feedPosition :(NSError **)error;
- (BOOL)openDrawer:(DrawerNum)drawerNum onOffTime:(PulseWidth)onOffTime :(NSError **)error;
- (BOOL)buzzer:(NSInteger)onTime offTime:(NSInteger)offTime :(NSError **)error;
- (BOOL)externalBuzzer:(BuzzerPattern)buzzerPattern buzzerCount:(NSInteger)buzzerCount :(NSError **)error;
- (BOOL)sendBinary:(NSData *)data :(NSError **)error;
- (BOOL)sendDataFile:(NSString *)fileName alignment:(PrintAlignment)alignment dithering:(Dithering)dithering :(NSError **)error;
- (BOOL)sendDataFile:(NSString *)fileName alignment:(PrintAlignment)alignment :(NSError **)error;
- (BOOL)sendDataFile:(NSString *)fileName :(NSError **)error;
- (BOOL)getStatus:(NSInteger[])buf :(NSError **)error;
- (BOOL)abort:(NSError **)error;
- (BOOL)registerLogo:(NSString *)fileName logoId:(NSString *)logoId dithering:(Dithering)dithering :(NSError **)error;
- (BOOL)registerLogo:(NSString *)fileName logoId:(NSString *)logoId :(NSError **)error;
- (BOOL)printLogo:(NSString *)logoId alignment:(PrintAlignment)alignment :(NSError **)error;
- (BOOL)printLogo:(NSString *)logoId :(NSError **)error;
- (BOOL)unregisterLogo:(NSString *)logoId :(NSError **)error;
- (BOOL)registerStyleSheet:(NSString *)fileName cssId:(NSInteger)cssId :(NSError **)error;
- (BOOL)unregisterStyleSheet:(NSInteger)cssId :(NSError **)error;
- (BOOL)resetPrinter:(NSError **)error;
- (BOOL)getPrinterResponse:(int)responseId param:(int)param response:(NSInteger[])response :(NSError **)error;
- (BOOL)getPrinterResponse:(int)responseId response:(NSInteger[])response :(NSError **)error;
- (BOOL)getPrinterResponse:(int)responseId responseArray:(NSMutableArray *)responseArray :(NSError **)error;
- (void)startDiscoveryPrinter:(NSPredicate *)predicate completion:(EABluetoothAccessoryPickerCompletion)completion;
- (void)startDiscoveryPrinter:(NSInteger)retryCount timeout:(NSInteger)timeout completion:(SIIDiscoveryPrinterCompletion)completion;
- (void)cancelDiscoveryPrinter;
- (NSArray *)getFoundPrinter;
- (BOOL)controlTransaction:(TransactionFunction)control :(NSError **)error;
- (BOOL)enterPageMode :(NSError **)error;
- (BOOL)exitPageMode :(NSError **)error;
- (BOOL)setPageModeArea:(NSInteger)x y:(NSInteger)y width:(NSInteger)width height:(NSInteger)height :(NSError **)error;
- (BOOL)setPageModeDirection:(Direction)direction :(NSError **)error;
- (BOOL)setPageModeLineSpacing:(NSInteger)lineSpacing :(NSError **)error;
- (BOOL)printPageMode:(CuttingMethod)cuttingMethod :(NSError **)error;
- (BOOL)printPageModeText:(NSInteger)startX startY:(NSInteger)startY text:(NSString *)text :(NSError **)error;
- (BOOL)printPageModeTextEx:(NSInteger)startX startY:(NSInteger)startY text:(NSString *)text bold:(CharacterBold)bold underline:(CharacterUnderline)underline reverse:(CharacterReverse)reverse font:(CharacterFont)font scale:(CharacterScale)scale :(NSError **)error;
- (BOOL)printPageModeBarcode:(NSInteger)startX startY:(NSInteger)startY barcodeSymbol:(BarcodeSymbol)barcodeSymbol text:(NSString *)text moduleSize:(ModuleSize)moduleSize moduleHeight:(NSInteger)moduleHeight hriPosition:(HriPosition)hriPosition hriFont:(CharacterFont)hriFont :(NSError **)error;
- (BOOL)printPageModeBarcode:(NSInteger)startX startY:(NSInteger)startY barcodeSymbol:(BarcodeSymbol)barcodeSymbol text:(NSString *)text moduleSize:(ModuleSize)moduleSize moduleHeight:(NSInteger)moduleHeight hriPosition:(HriPosition)hriPosition hriFont:(CharacterFont)hriFont nwRatio:(NwRatio)nwRatio :(NSError **)error;
- (BOOL)printPageModeBarcode:(NSInteger)startX startY:(NSInteger)startY barcodeSymbol:(BarcodeSymbol)barcodeSymbol data:(NSData *)data moduleSize:(ModuleSize)moduleSize moduleHeight:(NSInteger)moduleHeight hriPosition:(HriPosition)hriPosition hriFont:(CharacterFont)hriFont :(NSError **)error;
- (BOOL)printPageModePDF417:(NSInteger)startX startY:(NSInteger)startY text:(NSString *)text errorCorrection:(ErrorCorrection)errorCorrection row:(NSInteger)row column:(NSInteger)column moduleSize:(ModuleSize)moduleSize moduleHeight:(NSInteger)moduleHeight :(NSError **)error;
- (BOOL)printPageModePDF417:(NSInteger)startX startY:(NSInteger)startY text:(NSString *)text errorCorrection:(ErrorCorrection)errorCorrection row:(NSInteger)row column:(NSInteger)column moduleSize:(ModuleSize)moduleSize moduleHeight:(NSInteger)moduleHeight pdf417Symbol:(Pdf417Symbol)pdf417Symbol :(NSError **)error;
- (BOOL)printPageModeQRcode:(NSInteger)startX startY:(NSInteger)startY text:(NSString *)text errorCorrection:(ErrorCorrection)errorCorrection moduleSize:(ModuleSize)moduleSize :(NSError **)error;
- (BOOL)printPageModeQRcode:(NSInteger)startX startY:(NSInteger)startY text:(NSString *)text errorCorrection:(ErrorCorrection)errorCorrection moduleSize:(ModuleSize)moduleSize model:(QrModel)model :(NSError **)error;
- (BOOL)printPageModeDataMatrix:(NSInteger)startX startY:(NSInteger)startY text:(NSString *)text dataMatrixModule:(DataMatrixModule)dataMatrixModule moduleSize:(ModuleSize)moduleSize :(NSError **)error;
- (BOOL)printPageModeMaxiCode:(NSInteger)startX startY:(NSInteger)startY text:(NSString *)text maxiCodeMode:(MaxiCodeMode)maxiCodeMode :(NSError **)error;
- (BOOL)printPageModeGS1DataBarStacked:(NSInteger)startX startY:(NSInteger)startY text:(NSString *)text moduleSize:(ModuleSize)moduleSize :(NSError **)error;
- (BOOL)printPageModeGS1DataBarStackedOmnidirectional:(NSInteger)startX startY:(NSInteger)startY text:(NSString *)text moduleHeight:(NSInteger)moduleHeight moduleSize:(ModuleSize)moduleSize :(NSError **)error;
- (BOOL)printPageModeGS1DataBarExpandedStacked:(NSInteger)startX startY:(NSInteger)startY text:(NSString *)text column:(NSInteger)column moduleSize:(ModuleSize)moduleSize :(NSError **)error;
- (BOOL)printPageModeAztecCode:(NSInteger)startX startY:(NSInteger)startY text:(NSString *)text layer:(NSInteger)layer errorCorrection:(NSInteger)errorCorrection moduleSize:(ModuleSize)moduleSize aztecSymbol:(AztecSymbol)aztecSymbol :(NSError **)error;
- (BOOL)sendPageModeBinary:(NSData *)data :(NSError **)error;
- (BOOL)printPageModeImageFile:(NSInteger)startX startY:(NSInteger)startY fileName:(NSString *)fileName dithering:(Dithering)dithering :(NSError **)error;
- (BOOL)printPageModeLogo:(NSInteger)startX startY:(NSInteger)startY logoId:(NSString *)logoId :(NSError **)error;
- (BOOL)printPageModeRectangle:(NSInteger)startX startY:(NSInteger)startY endX:(NSInteger)endX endY:(NSInteger)endY lineStyle:(LineStyle)lineStyle :(NSError **)error;
- (BOOL)printPageModeLine:(NSInteger)startX startY:(NSInteger)startY endX:(NSInteger)endX endY:(NSInteger)endY lineStyle:(LineStyle)lineStyle :(NSError **)error;
- (BOOL)defragment:(NSError **)error;
- (BOOL)initializeMemoryArea:(NSError **)error;
- (BOOL)showTemplate:(int)time_ms :(NSError **)error;
- (BOOL)showSlide:(int)slideID time_ms:(int)time_ms :(NSError **)error;
- (BOOL)enterStandbyMode:(NSError **)error;
- (BOOL)executeMacro:(int)macroID repeatCount:(int)repeatCount :(NSError **)error;
- (BOOL)turnOnScreen:(BOOL)isOn :(NSError **)error;
- (BOOL)selectTemplate:(int)templateID slideID:(int)slideID :(NSError **)error;
- (BOOL)setTemplateImageData:(int)mapID imageID:(int)imageID :(NSError **)error;
- (BOOL)selectTemplateTextObject:(int)mapID :(NSError **)error;
- (BOOL)setTemplateTextAlignment:(PrintAlignment)alignment :(NSError **)error;
- (BOOL)setTemplateTextLeftMargin:(int)margin :(NSError **)error;
- (BOOL)setTemplateTextLineSpacing:(int)spacing :(NSError **)error;
- (BOOL)setTemplateTextBold:(CharacterBold)bold :(NSError **)error;
- (BOOL)setTemplateTextUnderline:(CharacterUnderline)underline :(NSError **)error;
- (BOOL)setTemplateTextSize:(CharacterScale)scale :(NSError **)error;
- (BOOL)setTemplateTextFont:(CharacterFont)font :(NSError **)error;
- (BOOL)setTemplateTextRegisteredFont:(RegisteredFont)font :(NSError **)error;
- (BOOL)setTemplateTextRightSpacing:(int)spacing :(NSError **)error;
- (BOOL)setTemplateTextColor:(int)color :(NSError **)error;
- (BOOL)setTemplateTextData:(NSString *)text :(NSError **)error;
- (BOOL)setTemplateQrCodeData:(int)mapID moduleSize:(ModuleSize)moduleSize errorCorrection:(ErrorCorrection)errorCorrection mode:(QrDataMode)mode qrQuietZone:(QrQuietZone)qrQuietZone text:(NSString *)text :(NSError **)error;
- (BOOL)setTemplateQrCodeData:(int)mapID text:(NSString *)text :(NSError **)error;
- (BOOL)setTemplateBarcodeData:(int)mapID text:(NSString *)text :(NSError **)error;
- (BOOL)registerTemplate:(int)templateID label:(NSString *)label fileName:(NSString *)fileName :(NSError **)error;
- (BOOL)unregisterTemplate:(int)templateID :(NSError **)error;
- (BOOL)registerImageData:(int)imageID label:(NSString *)label fileName:(NSString *)fileName :(NSError **)error;
- (BOOL)unregisterImageData:(int)imageID :(NSError **)error;
- (BOOL)registerSlideData:(int)slideID label:(NSString *)label fileName:(NSString *)fileName :(NSError **)error;
- (BOOL)unregisterSlideData:(int)slideID :(NSError **)error;
- (BOOL)registerUserDefinedCharacter:(NSString *)fileName :(NSError **)error;
- (BOOL)unregisterUserDefinedCharacter:(NSError **)error;
- (BOOL)registerOptionFont:(int)startCode endCode:(int)endCode width:(int)width height:(int)height fileName:(NSString *)fileName :(NSError **)error;
- (BOOL)unregisterOptionFont:(NSError **)error;
- (BOOL)controlMacroRegistration:(int)macroID control:(MacroRegistrationFunction)control :(NSError **)error;
- (BOOL)getDisplayResponse:(int)responseId param:(int)param response:(NSInteger[])response :(NSError **)error;
- (BOOL)getDisplayResponse:(int)responseId response:(NSInteger[])response :(NSError **)error;
- (BOOL)getDisplayResponse:(int)responseId param:(int)param responseArray:(NSMutableArray *)responseArray :(NSError **)error;
- (BOOL)getDisplayResponse:(int)responseId responseArray:(NSMutableArray *)responseArray :(NSError **)error;

@property int sendTimeout;
@property int receiveTimeout;
@property int internationalCharacter;
@property int codePage;
@property(readonly) int printerModel;
@property(readonly) int portType;
@property(readonly) BOOL isConnect;
@property int socketKeepingTime;
@property(weak, nonatomic) id <SIIPrinterManagerDelegate> delegate;

@end
