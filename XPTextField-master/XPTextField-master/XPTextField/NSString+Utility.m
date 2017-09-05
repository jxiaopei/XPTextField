//
//  NSString+Utility.m
//  XPSixHeLottery
//
//  Created by iMac on 2017/8/23.
//  Copyright © 2017年 eirc. All rights reserved.
//

#import "NSString+Utility.h"
#import <commoncrypto/CommonDigest.h>

@implementation NSString (Utility)

- (BOOL)isNotNil
{
    if (self == nil || (id)self == [NSNull null] || [self isEqualToString:@""] || [self isEqualToString:@" "] || [self class] == NULL)
        return NO;
    
    return YES;
}


@end
