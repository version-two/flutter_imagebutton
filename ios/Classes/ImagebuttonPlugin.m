#import "ImagebuttonPlugin.h"
#import <imagebutton/imagebutton-Swift.h>

@implementation ImagebuttonPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftImagebuttonPlugin registerWithRegistrar:registrar];
}
@end
