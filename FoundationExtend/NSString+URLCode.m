//
//  NSString+URLCode.m
//  FoundationExtend
//
//  Created by ZhuJiaQuan on 13-11-4.
//  Copyright (c) 2013年 5codelab. All rights reserved.
//

#import "NSString+URLCode.h"
#import "ARCMacros.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation NSString (URLCode)

///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString *)URLEncodedString
{
    NSString *encoded = (NSString *)
	CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
											( CFStringRef)self,
											NULL,
                                            (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                            kCFStringEncodingUTF8);
    return AMAutorelease(encoded);
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString *)URLDecodedString
{
	return [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

@end