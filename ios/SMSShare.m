//
//  SMS.m
//  RNShare
//
//  Created by Alejandro Gómez Alanís on 28/09/2018.
//

#import "SMSShare.h"

@implementation SMSShare
RCT_EXPORT_MODULE();
- (void)shareSingle:(NSDictionary *)options
    failureCallback:(RCTResponseErrorBlock)failureCallback
    successCallback:(RCTResponseSenderBlock)successCallback {
    
    NSLog(@"Try open Message");
    
    if ([options objectForKey:@"message"] && [options objectForKey:@"message"] != [NSNull null]) {
        NSString *url = [NSString stringWithFormat:@"sms:&body=%@", options[@"message"]];
        NSURL *smsURL = [NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        
        if ([[UIApplication sharedApplication] canOpenURL: smsURL]) {
            [[UIApplication sharedApplication] openURL:smsURL];
            successCallback(@[]);
        } else {
            // Cannot open SMS
            NSLog(@"error message intent");
        }
    }
}


@end

