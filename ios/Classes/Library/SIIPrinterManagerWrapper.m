//
//  SIIPrinterManagerWrapper.m
//  SiiLibSample
//

#import "SIIPrinterManagerWrapper.h"

@implementation SIIPrinterManagerWrapper

SIIPrinterManager *_sdk;

-(id)init
{
    _sdk = [[SIIPrinterManager alloc] init];
    return [super init];
}

- (BOOL)connect:(int)printerModel address:(NSString *)address portType:(int)portType :(NSError **)error
{
    @try {
        [_sdk connect:printerModel address:address portType:portType];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)disconnect:(NSError **)error
{
    @try {
        [_sdk disconnect];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)sendText:(NSString *)text :(NSError **)error
{
    @try {
        [_sdk sendText:text];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)sendTextEx:(NSString *)text bold:(CharacterBold)bold underline:(CharacterUnderline)underline reverse:(CharacterReverse)reverse font:(CharacterFont)font scale:(CharacterScale)scale alignment:(PrintAlignment)alignment :(NSError **)error;
{
    @try {
        [_sdk sendTextEx:text bold:bold underline:underline reverse:reverse font:font scale:scale alignment:alignment];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)sendTextEx:(NSString *)text bold:(CharacterBold)bold underline:(CharacterUnderline)underline font:(CharacterFont)font scale:(CharacterScale)scale :(NSError **)error
{
    @try {
        [_sdk sendTextEx:text bold:bold underline:underline font:font scale:scale];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)printBarcode:(BarcodeSymbol)barcodeSymbol text:(NSString *)text moduleSize:(ModuleSize)moduleSize moduleHeight:(NSInteger)moduleHeight hriPosition:(HriPosition)hriPosition hriFont:(CharacterFont)hriFont alignment:(PrintAlignment)alignment :(NSError **)error
{
    @try {
        [_sdk printBarcode:barcodeSymbol text:text moduleSize:moduleSize moduleHeight:moduleHeight hriPosition:hriPosition hriFont:hriFont alignment:alignment];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)printBarcode:(BarcodeSymbol)barcodeSymbol text:(NSString *)text moduleSize:(ModuleSize)moduleSize moduleHeight:(NSInteger)moduleHeight hriPosition:(HriPosition)hriPosition hriFont:(CharacterFont)hriFont alignment:(PrintAlignment)alignment nwRatio:(NwRatio)nwRatio :(NSError **)error
{
    @try {
        [_sdk printBarcode:barcodeSymbol text:text moduleSize:moduleSize moduleHeight:moduleHeight hriPosition:hriPosition hriFont:hriFont alignment:alignment nwRatio:nwRatio];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)printBarcode:(BarcodeSymbol)barcodeSymbol data:(NSData *)data moduleSize:(ModuleSize)moduleSize moduleHeight:(NSInteger)moduleHeight hriPosition:(HriPosition)hriPosition hriFont:(CharacterFont)hriFont alignment:(PrintAlignment)alignment :(NSError **)error
{
    @try {
        [_sdk printBarcode:barcodeSymbol data:data moduleSize:moduleSize moduleHeight:moduleHeight hriPosition:hriPosition hriFont:hriFont alignment:alignment];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)printPDF417:(NSString *)text errorCorrection:(ErrorCorrection)errorCorrection row:(NSInteger)row column:(NSInteger)column moduleSize:(ModuleSize)moduleSize moduleHeight:(NSInteger)moduleHeight alignment:(PrintAlignment)alignment :(NSError **)error
{
    @try {
        [_sdk printPDF417:text errorCorrection:errorCorrection row:row column:column moduleSize:moduleSize moduleHeight:moduleHeight alignment:alignment];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)printPDF417:(NSString *)text errorCorrection:(ErrorCorrection)errorCorrection row:(NSInteger)row column:(NSInteger)column moduleSize:(ModuleSize)moduleSize moduleHeight:(NSInteger)moduleHeight alignment:(PrintAlignment)alignment pdf417Symbol:(Pdf417Symbol)pdf417Symbol :(NSError **)error
{
    @try {
        [_sdk printPDF417:text errorCorrection:errorCorrection row:row column:column moduleSize:moduleSize moduleHeight:moduleHeight alignment:alignment pdf417Symbol:pdf417Symbol];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)printQRcode:(NSString *)text errorCorrection:(ErrorCorrection)errorCorrection moduleSize:(ModuleSize)moduleSize alignment:(PrintAlignment)alignment :(NSError **)error
{
    @try {
        [_sdk printQRcode:text errorCorrection:errorCorrection moduleSize:moduleSize alignment:alignment];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)printQRcode:(NSString *)text errorCorrection:(ErrorCorrection)errorCorrection moduleSize:(ModuleSize)moduleSize alignment:(PrintAlignment)alignment model:(QrModel)model :(NSError **)error
{
    @try {
        [_sdk printQRcode:text errorCorrection:errorCorrection moduleSize:moduleSize alignment:alignment model:model];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)printDataMatrix:(NSString *)text dataMatrixModule:(DataMatrixModule)dataMatrixModule moduleSize:(ModuleSize)moduleSize alignment:(PrintAlignment)alignment :(NSError **)error
{
    @try {
        [_sdk printDataMatrix:text dataMatrixModule:dataMatrixModule moduleSize:moduleSize alignment:alignment];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)printMaxiCode:(NSString *)text maxiCodeMode:(MaxiCodeMode)maxiCodeMode alignment:(PrintAlignment)alignment :(NSError **)error
{
    @try {
        [_sdk printMaxiCode:text maxiCodeMode:maxiCodeMode alignment:alignment];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)printGS1DataBarStacked:(NSString *)text moduleSize:(ModuleSize)moduleSize alignment:(PrintAlignment)alignment :(NSError **)error
{
    @try {
        [_sdk printGS1DataBarStacked:text moduleSize:moduleSize alignment:alignment];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)printGS1DataBarStackedOmnidirectional:(NSString *)text moduleHeight:(NSInteger)moduleHeight moduleSize:(ModuleSize)moduleSize alignment:(PrintAlignment)alignment :(NSError **)error
{
    @try {
        [_sdk printGS1DataBarStackedOmnidirectional:text moduleHeight:moduleHeight moduleSize:moduleSize alignment:alignment];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)printGS1DataBarExpandedStacked:(NSString *)text column:(NSInteger)column moduleSize:(ModuleSize)moduleSize alignment:(PrintAlignment)alignment :(NSError **)error
{
    @try {
        [_sdk printGS1DataBarExpandedStacked:text column:column moduleSize:moduleSize alignment:alignment];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)printAztecCode:(NSString *)text layer:(NSInteger)layer errorCorrection:(NSInteger)errorCorrection moduleSize:(ModuleSize)moduleSize aztecSymbol:(AztecSymbol)aztecSymbol alignment:(PrintAlignment)alignment :(NSError **)error
{
    @try {
        [_sdk printAztecCode:text layer:layer errorCorrection:errorCorrection moduleSize:moduleSize aztecSymbol:aztecSymbol alignment:alignment];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)cutPaper:(CuttingMethod)cuttingMethod :(NSError **)error
{
    @try {
        [_sdk cutPaper:cuttingMethod];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)feedPosition:(FeedPosition)feedPosition :(NSError **)error
{
    @try {
        [_sdk feedPosition:feedPosition];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)openDrawer:(DrawerNum)drawerNum onOffTime:(PulseWidth)onOffTime :(NSError **)error
{
    @try {
        [_sdk openDrawer:drawerNum onOffTime:onOffTime];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)buzzer:(NSInteger)onTime offTime:(NSInteger)offTime :(NSError **)error
{
    @try {
        [_sdk buzzer:onTime offTime:offTime];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)externalBuzzer:(BuzzerPattern)buzzerPattern buzzerCount:(NSInteger)buzzerCount :(NSError **)error
{
    @try {
        [_sdk externalBuzzer:buzzerPattern buzzerCount:buzzerCount];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)sendBinary:(NSData *)data :(NSError **)error
{
    @try {
        [_sdk sendBinary:data];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)sendDataFile:(NSString *)fileName alignment:(PrintAlignment)alignment dithering:(Dithering)dithering :(NSError **)error
{
    @try {
        [_sdk sendDataFile:fileName alignment:alignment dithering:dithering];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)sendDataFile:(NSString *)fileName alignment:(PrintAlignment)alignment :(NSError **)error
{
    @try {
        [_sdk sendDataFile:fileName alignment:alignment];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)sendDataFile:(NSString *)fileName :(NSError **)error
{
    @try {
        [_sdk sendDataFile:fileName];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)getStatus:(NSInteger[])buf :(NSError **)error
{
    @try {
        [_sdk getStatus:buf];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)abort:(NSError **)error
{
    @try {
        [_sdk abort];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)registerLogo:(NSString *)fileName logoId:(NSString *)logoId dithering:(Dithering)dithering :(NSError **)error
{
    @try {
        [_sdk registerLogo:fileName logoId:logoId dithering:dithering];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)registerLogo:(NSString *)fileName logoId:(NSString *)logoId :(NSError **)error
{
    @try {
        [_sdk registerLogo:fileName logoId:logoId];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)printLogo:(NSString *)logoId alignment:(PrintAlignment)alignment :(NSError **)error
{
    @try {
        [_sdk printLogo:logoId alignment:alignment];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)printLogo:(NSString *)logoId :(NSError **)error
{
    @try {
        [_sdk printLogo:logoId];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }    
}

- (BOOL)unregisterLogo:(NSString *)logoId :(NSError **)error
{
    @try {
        [_sdk unregisterLogo:logoId];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }    
}

- (BOOL)registerStyleSheet:(NSString *)fileName cssId:(NSInteger)cssId :(NSError **)error
{
    @try {
        [_sdk registerStyleSheet:fileName cssId:cssId];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }    
}

- (BOOL)unregisterStyleSheet:(NSInteger)cssId :(NSError **)error
{
    @try {
        [_sdk unregisterStyleSheet:cssId];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }    
}

- (BOOL)resetPrinter:(NSError **)error
{
    @try {
        [_sdk resetPrinter];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }    
}

- (BOOL)getPrinterResponse:(int)responseId param:(int)param response:(NSInteger[])response :(NSError **)error {
    @try {
        UInt8 paramArry[1] = {param};
        [_sdk getPrinterResponse:responseId param:[NSData dataWithBytes:paramArry length:sizeof(paramArry)] response:response];
        return true;
    }
    @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)getPrinterResponse:(int)responseId response:(NSInteger[])response :(NSError **)error {
    @try {
        [_sdk getPrinterResponse:responseId param:nil response:response];
        return true;
    }
    @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)getPrinterResponse:(int)responseId responseArray:(NSMutableArray *)responseArray :(NSError **)error {
    @try {
        NSMutableArray *ret = [[NSMutableArray alloc] init];
        [_sdk getPrinterResponse:responseId param:nil response:(__bridge void *)(ret)];
        [responseArray addObjectsFromArray:ret];
        return true;
    }
    @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (void)startDiscoveryPrinter:(NSPredicate *)predicate completion:(EABluetoothAccessoryPickerCompletion)completion
{
    [_sdk startDiscoveryPrinter:predicate completion:completion];
}

- (void)startDiscoveryPrinter:(NSInteger)retryCount timeout:(NSInteger)timeout completion:(SIIDiscoveryPrinterCompletion)completion
{
    [_sdk startDiscoveryPrinter:retryCount timeout:timeout completion:completion];
}

- (void)cancelDiscoveryPrinter
{
    [_sdk cancelDiscoveryPrinter];
}

- (NSArray *)getFoundPrinter
{
    return [_sdk getFoundPrinter];
}

- (BOOL)controlTransaction:(TransactionFunction)control :(NSError **)error
{
    @try {
        [_sdk controlTransaction:control];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}
#pragma mark PageMode APIs
- (BOOL)enterPageMode :(NSError **)error
{
    @try {
        [_sdk enterPageMode];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)exitPageMode :(NSError **)error
{
    @try {
        [_sdk exitPageMode];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)setPageModeArea:(NSInteger)x y:(NSInteger)y width:(NSInteger)width height:(NSInteger)height :(NSError **)error
{
    @try {
        [_sdk setPageModeArea:x y:y width:width height:height];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)setPageModeDirection:(Direction)direction :(NSError **)error
{
    @try {
        [_sdk setPageModeDirection:direction];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)setPageModeLineSpacing:(NSInteger)lineSpacing :(NSError **)error
{
    @try {
        [_sdk setPageModeLineSpacing:lineSpacing];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)printPageMode:(CuttingMethod)cuttingMethod :(NSError **)error
{
    @try {
        [_sdk printPageMode:cuttingMethod];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)printPageModeText:(NSInteger)startX startY:(NSInteger)startY text:(NSString *)text :(NSError **)error
{
    @try {
        [_sdk printPageModeText:startX startY:startY text:text];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)printPageModeTextEx:(NSInteger)startX startY:(NSInteger)startY text:(NSString *)text bold:(CharacterBold)bold underline:(CharacterUnderline)underline reverse:(CharacterReverse)reverse font:(CharacterFont)font scale:(CharacterScale)scale :(NSError **)error
{
    @try {
        [_sdk printPageModeTextEx:startX startY:startY text:text bold:bold underline:underline reverse:reverse font:font scale:scale];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)printPageModeBarcode:(NSInteger)startX startY:(NSInteger)startY barcodeSymbol:(BarcodeSymbol)barcodeSymbol text:(NSString *)text moduleSize:(ModuleSize)moduleSize moduleHeight:(NSInteger)moduleHeight hriPosition:(HriPosition)hriPosition hriFont:(CharacterFont)hriFont :(NSError **)error
{
    @try {
        [_sdk printPageModeBarcode:startX startY:startY barcodeSymbol:barcodeSymbol text:text moduleSize:moduleSize moduleHeight:moduleHeight hriPosition:hriPosition hriFont:hriFont];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)printPageModeBarcode:(NSInteger)startX startY:(NSInteger)startY barcodeSymbol:(BarcodeSymbol)barcodeSymbol text:(NSString *)text moduleSize:(ModuleSize)moduleSize moduleHeight:(NSInteger)moduleHeight hriPosition:(HriPosition)hriPosition hriFont:(CharacterFont)hriFont nwRatio:(NwRatio)nwRatio :(NSError **)error
{
    @try {
        [_sdk printPageModeBarcode:startX startY:startY barcodeSymbol:barcodeSymbol text:text moduleSize:moduleSize moduleHeight:moduleHeight hriPosition:hriPosition hriFont:hriFont nwRatio:nwRatio];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)printPageModeBarcode:(NSInteger)startX startY:(NSInteger)startY barcodeSymbol:(BarcodeSymbol)barcodeSymbol data:(NSData *)data moduleSize:(ModuleSize)moduleSize moduleHeight:(NSInteger)moduleHeight hriPosition:(HriPosition)hriPosition hriFont:(CharacterFont)hriFont :(NSError **)error
{
    @try {
        [_sdk printPageModeBarcode:startX startY:startY barcodeSymbol:barcodeSymbol data:data moduleSize:moduleSize moduleHeight:moduleHeight hriPosition:hriPosition hriFont:hriFont];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)printPageModePDF417:(NSInteger)startX startY:(NSInteger)startY text:(NSString *)text errorCorrection:(ErrorCorrection)errorCorrection row:(NSInteger)row column:(NSInteger)column moduleSize:(ModuleSize)moduleSize moduleHeight:(NSInteger)moduleHeight :(NSError **)error
{
    @try {
        [_sdk printPageModePDF417:startX startY:startY text:text errorCorrection:errorCorrection row:row column:column moduleSize:moduleSize moduleHeight:moduleHeight];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)printPageModePDF417:(NSInteger)startX startY:(NSInteger)startY text:(NSString *)text errorCorrection:(ErrorCorrection)errorCorrection row:(NSInteger)row column:(NSInteger)column moduleSize:(ModuleSize)moduleSize moduleHeight:(NSInteger)moduleHeight pdf417Symbol:(Pdf417Symbol)pdf417Symbol :(NSError **)error
{
    @try {
        [_sdk printPageModePDF417:startX startY:startY text:text errorCorrection:errorCorrection row:row column:column moduleSize:moduleSize moduleHeight:moduleHeight pdf417Symbol:pdf417Symbol];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)printPageModeQRcode:(NSInteger)startX startY:(NSInteger)startY text:(NSString *)text errorCorrection:(ErrorCorrection)errorCorrection moduleSize:(ModuleSize)moduleSize :(NSError **)error
{
    @try {
        [_sdk printPageModeQRcode:startX startY:startY text:text errorCorrection:errorCorrection moduleSize:moduleSize];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)printPageModeQRcode:(NSInteger)startX startY:(NSInteger)startY text:(NSString *)text errorCorrection:(ErrorCorrection)errorCorrection moduleSize:(ModuleSize)moduleSize model:(QrModel)model :(NSError **)error
{
    @try {
        [_sdk printPageModeQRcode:startX startY:startY text:text errorCorrection:errorCorrection moduleSize:moduleSize model:model];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)printPageModeDataMatrix:(NSInteger)startX startY:(NSInteger)startY text:(NSString *)text dataMatrixModule:(DataMatrixModule)dataMatrixModule moduleSize:(ModuleSize)moduleSize :(NSError **)error
{
    @try {
        [_sdk printPageModeDataMatrix:startX startY:startY text:text dataMatrixModule:dataMatrixModule moduleSize:moduleSize];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)printPageModeMaxiCode:(NSInteger)startX startY:(NSInteger)startY text:(NSString *)text maxiCodeMode:(MaxiCodeMode)maxiCodeMode :(NSError **)error
{
    @try {
        [_sdk printPageModeMaxiCode:startX startY:startY text:text maxiCodeMode:maxiCodeMode];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)printPageModeGS1DataBarStacked:(NSInteger)startX startY:(NSInteger)startY text:(NSString *)text moduleSize:(ModuleSize)moduleSize :(NSError **)error
{
    @try {
        [_sdk printPageModeGS1DataBarStacked:startX startY:startY text:text moduleSize:moduleSize];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)printPageModeGS1DataBarStackedOmnidirectional:(NSInteger)startX startY:(NSInteger)startY text:(NSString *)text moduleHeight:(NSInteger)moduleHeight moduleSize:(ModuleSize)moduleSize :(NSError **)error
{
    @try {
        [_sdk printPageModeGS1DataBarStackedOmnidirectional:startX startY:startY text:text moduleHeight:moduleHeight moduleSize:moduleSize];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)printPageModeGS1DataBarExpandedStacked:(NSInteger)startX startY:(NSInteger)startY text:(NSString *)text column:(NSInteger)column moduleSize:(ModuleSize)moduleSize :(NSError **)error
{
    @try {
        [_sdk printPageModeGS1DataBarExpandedStacked:startX startY:startY text:text column:column moduleSize:moduleSize];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)printPageModeAztecCode:(NSInteger)startX startY:(NSInteger)startY text:(NSString *)text layer:(NSInteger)layer errorCorrection:(NSInteger)errorCorrection moduleSize:(ModuleSize)moduleSize aztecSymbol:(AztecSymbol)aztecSymbol :(NSError **)error
{
    @try {
        [_sdk printPageModeAztecCode:startX startY:startY text:text layer:layer errorCorrection:errorCorrection moduleSize:moduleSize aztecSymbol:aztecSymbol];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)sendPageModeBinary:(NSData *)data :(NSError **)error
{
    @try {
        [_sdk sendPageModeBinary:data];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)printPageModeImageFile:(NSInteger)startX startY:(NSInteger)startY fileName:(NSString *)fileName dithering:(Dithering)dithering :(NSError **)error
{
    @try {
        [_sdk printPageModeImageFile:startX startY:startY fileName:fileName dithering:dithering];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)printPageModeLogo:(NSInteger)startX startY:(NSInteger)startY logoId:(NSString *)logoId :(NSError **)error
{
    @try {
        [_sdk printPageModeLogo:startX startY:startY logoId:logoId];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)printPageModeRectangle:(NSInteger)startX startY:(NSInteger)startY endX:(NSInteger)endX endY:(NSInteger)endY lineStyle:(LineStyle)lineStyle :(NSError **)error
{
    @try {
        [_sdk printPageModeRectangle:startX startY:startY endX:endX endY:endY lineStyle:lineStyle];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)printPageModeLine:(NSInteger)startX startY:(NSInteger)startY endX:(NSInteger)endX endY:(NSInteger)endY lineStyle:(LineStyle)lineStyle :(NSError **)error
{
    @try {
        [_sdk printPageModeLine:startX startY:startY endX:endX endY:endY lineStyle:lineStyle];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)defragment:(NSError **)error
{
    @try {
        [_sdk defragment:SII_PM_MEMORY_DISPLAY_USERMEMORY];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)initializeMemoryArea:(NSError **)error
{
    @try {
        [_sdk initializeMemoryArea:SII_PM_MEMORY_DISPLAY_USERMEMORY];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }

}

- (BOOL)showTemplate:(int)time_ms :(NSError **)error
{
    @try {
        [_sdk showTemplate:time_ms];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)showSlide:(int)slideID time_ms:(int)time_ms :(NSError **)error
{
    @try {
        [_sdk showSlide:slideID time_ms:time_ms];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)enterStandbyMode:(NSError **)error
{
    @try {
        [_sdk enterStandbyMode];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)executeMacro:(int)macroID repeatCount:(int)repeatCount :(NSError **)error
{
    @try {
        [_sdk executeMacro:macroID repeatCount:repeatCount];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)turnOnScreen:(BOOL)isOn :(NSError **)error
{
    @try {
        [_sdk turnOnScreen:isOn];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)selectTemplate:(int)templateID slideID:(int)slideID :(NSError **)error
{
    @try {
        [_sdk selectTemplate:templateID slideID:slideID];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)setTemplateImageData:(int)mapID imageID:(int)imageID :(NSError **)error
{
    @try {
        [_sdk setTemplateImageData:mapID imageID:imageID];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)selectTemplateTextObject:(int)mapID :(NSError **)error
{
    @try {
        [_sdk selectTemplateTextObject:mapID];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)setTemplateTextAlignment:(PrintAlignment)alignment :(NSError **)error
{
    @try {
        [_sdk setTemplateTextAlignment:alignment];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)setTemplateTextLeftMargin:(int)margin :(NSError **)error
{
    @try {
        [_sdk setTemplateTextLeftMargin:margin];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)setTemplateTextLineSpacing:(int)spacing :(NSError **)error
{
    @try {
        [_sdk setTemplateTextLineSpacing:spacing];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)setTemplateTextBold:(CharacterBold)bold :(NSError **)error
{
    @try {
        [_sdk setTemplateTextBold:bold];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)setTemplateTextUnderline:(CharacterUnderline)underline :(NSError **)error
{
    @try {
        [_sdk setTemplateTextUnderline:underline];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)setTemplateTextSize:(CharacterScale)scale :(NSError **)error
{
    @try {
        [_sdk setTemplateTextSize:scale];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)setTemplateTextFont:(CharacterFont)font :(NSError **)error
{
    @try {
        [_sdk setTemplateTextFont:font];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)setTemplateTextRegisteredFont:(RegisteredFont)font :(NSError **)error
{
    @try {
        [_sdk setTemplateTextRegisteredFont:font];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)setTemplateTextRightSpacing:(int)spacing :(NSError **)error
{
    @try {
        [_sdk setTemplateTextRightSpacing:spacing];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)setTemplateTextColor:(int)color :(NSError **)error
{
    @try {
        [_sdk setTemplateTextColor:color];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)setTemplateTextData:(NSString *)text :(NSError **)error
{
    @try {
        [_sdk setTemplateTextData:text];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)setTemplateQrCodeData:(int)mapID moduleSize:(ModuleSize)moduleSize errorCorrection:(ErrorCorrection)errorCorrection mode:(QrDataMode)mode qrQuietZone:(QrQuietZone)qrQuietZone text:(NSString *)text :(NSError **)error
{
    @try {
        [_sdk setTemplateQrCodeData:mapID moduleSize:moduleSize errorCorrection:errorCorrection mode:mode qrQuietZone:qrQuietZone text:text];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)setTemplateQrCodeData:(int)mapID text:(NSString *)text :(NSError **)error;
{
    @try {
        [_sdk setTemplateQrCodeData:mapID text:text];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)setTemplateBarcodeData:(int)mapID text:(NSString *)text :(NSError **)error;
{
    @try {
        [_sdk setTemplateBarcodeData:mapID text:text];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)registerTemplate:(int)templateID label:(NSString *)label fileName:(NSString *)fileName :(NSError **)error
{
    @try {
        [_sdk registerTemplate:templateID label:label fileName:fileName];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)unregisterTemplate:(int)templateID :(NSError **)error
{
    @try {
        [_sdk unregisterTemplate:templateID];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)registerImageData:(int)imageID label:(NSString *)label fileName:(NSString *)fileName :(NSError **)error
{
    @try {
        [_sdk registerImageData:imageID label:label fileName:fileName];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)unregisterImageData:(int)imageID :(NSError **)error
{
    @try {
        [_sdk unregisterImageData:imageID];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)registerSlideData:(int)slideID label:(NSString *)label fileName:(NSString *)fileName :(NSError **)error
{
    @try {
        [_sdk registerSlideData:slideID label:label fileName:fileName];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)unregisterSlideData:(int)slideID :(NSError **)error
{
    @try {
        [_sdk unregisterSlideData:slideID];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)registerUserDefinedCharacter:(NSString *)fileName :(NSError **)error;
{
    @try {
        [_sdk registerUserDefinedCharacter:fileName];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)unregisterUserDefinedCharacter:(NSError **)error
{
    @try {
        [_sdk unregisterUserDefinedCharacter];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)registerOptionFont:(int)startCode endCode:(int)endCode width:(int)width height:(int)height fileName:(NSString *)fileName :(NSError **)error
{
    @try {
        [_sdk registerOptionFont:startCode endCode:endCode width:width height:height fileName:fileName];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)unregisterOptionFont:(NSError **)error
{
    @try {
        [_sdk unregisterOptionFont];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)controlMacroRegistration:(int)macroID control:(MacroRegistrationFunction)control :(NSError **)error
{
    @try {
        [_sdk controlMacroRegistration:macroID control:control];
        return true;
    } @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)getDisplayResponse:(int)responseId param:(int)param response:(NSInteger[])response :(NSError **)error {
    @try {
        UInt8 paramArry[1] = {param};
        [_sdk getDisplayResponse:responseId param:[NSData dataWithBytes:paramArry length:sizeof(paramArry)] response:response];
        return true;
    }
    @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)getDisplayResponse:(int)responseId response:(NSInteger[])response :(NSError **)error {
    @try {
        [_sdk getDisplayResponse:responseId param:nil response:response];
        return true;
    }
    @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)getDisplayResponse:(int)responseId param:(int)param responseArray:(NSMutableArray *)responseArray :(NSError **)error {
    @try {
        UInt8 paramArry[1] = {param};
        NSMutableArray *ret = [[NSMutableArray alloc] init];
        [_sdk getDisplayResponse:responseId param:[NSData dataWithBytes:paramArry length:sizeof(paramArry)] response:(__bridge void *)(ret)];
        [responseArray addObjectsFromArray:ret];
        return true;
    }
    @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

- (BOOL)getDisplayResponse:(int)responseId responseArray:(NSMutableArray *)responseArray :(NSError **)error {
    @try {
        NSMutableArray *ret = [[NSMutableArray alloc] init];
        [_sdk getDisplayResponse:responseId param:nil response:(__bridge void *)(ret)];
        [responseArray addObjectsFromArray:ret];
        return true;
    }
    @catch (SIIPrinterException *e) {
        if (error) {
            *error = [self convertSIIPrinterExceptionToNSError:e];
        }
        return false;
    }
}

#pragma mark - Privert methods
- (NSError *)convertSIIPrinterExceptionToNSError:(SIIPrinterException *)exception
{
    NSString *errorDomain = @"com.sii-ps.SIIPrinterManager";
    NSInteger errorCode = exception.errorCode;
    NSDictionary *errorUserInfo = [NSDictionary dictionaryWithObject:exception.errorMessage forKey:NSLocalizedDescriptionKey];
    return [[NSError alloc] initWithDomain:errorDomain code:errorCode userInfo:errorUserInfo];
}

#pragma mark - Public properties
@dynamic sendTimeout;
- (void)setSendTimeout:(int)sendTimeout
{
    _sdk.sendTimeout = sendTimeout;
}

- (int)sendTimeout
{
    return (int)_sdk.sendTimeout;
}

@dynamic receiveTimeout;
- (void)setReceiveTimeout:(int)receiveTimeout
{
    _sdk.receiveTimeout = receiveTimeout;
}

- (int)receiveTimeout
{
    return (int)_sdk.receiveTimeout;
}

@dynamic printerModel;
- (int)printerModel
{
    return (int)_sdk.printerModel;
}

@dynamic portType;
- (int)portType
{
    return (int)_sdk.portType;
}

@dynamic internationalCharacter;
- (void)setInternationalCharacter:(int)internationalCharacter
{
    _sdk.internationalCharacter = internationalCharacter;
}

- (int)internationalCharacter
{
    return (int)_sdk.internationalCharacter;
}

@dynamic codePage;
- (void)setCodePage:(int)codePage
{
    _sdk.codePage = codePage;
}

- (int)codePage
{
    return (int)_sdk.codePage;
}

@dynamic isConnect;
- (BOOL)isConnect
{
    return (BOOL)_sdk.isConnect;
}

@dynamic socketKeepingTime;
- (void)setSocketKeepingTime:(int)socketKeepingTime
{
    _sdk.socketKeepingTime = socketKeepingTime;
}

- (int)socketKeepingTime
{
    return (int)_sdk.socketKeepingTime;
}

@dynamic delegate;
- (void)setDelegate:(id <SIIPrinterManagerDelegate>)delegate
{
    _sdk.delegate = delegate;
}

@end
