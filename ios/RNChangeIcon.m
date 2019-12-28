#import "React/RCTLog.h"

#import "RNChangeIcon.h"

@implementation RNChangeIcon

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE()

RCT_REMAP_METHOD(changeIcon, iconName:(NSString *)iconName resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject) {
    NSError *error = nil;
    // Not supported
    if ([[UIApplication sharedApplication] supportsAlternateIcons] == NO) {
        reject(@"Error", @"Alternate icon not supported", error);
        RCTLog(@"Alternate icons are not supported");
        return;
    }

    NSString *currentIcon = [[UIApplication sharedApplication] alternateIconName];

    if ([iconName isEqualToString:currentIcon]) {
        return;
    }

    resolve(@(YES));

    // Custom icon
    [[UIApplication sharedApplication] setAlternateIconName:iconName completionHandler:^(NSError * _Nullable error) {
        RCTLog(@"%@", [error description]);
    }];
}

@end
