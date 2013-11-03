//
//  NSString+Base64.h
//  FoundationExtend
//
//  Created by ZhuJiaQuan on 13-11-1.
//  Copyright (c) 2013年 5codelab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Base64)

+ (NSString *)stringWithBase64EncodedString:(NSString *)string;
- (NSString *)base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth;
- (NSString *)base64EncodedString;
- (NSString *)base64DecodedString;
- (NSData *)base64DecodedData;

@end
