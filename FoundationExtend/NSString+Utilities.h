//
//  NSString+Utilities.h
//  FoundationExtend
//
//  Created by ZhuJiaQuan on 13-11-1.
//  Copyright (c) 2013年 5codelab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Utilities)

+ (BOOL)isNilOrEmpty:(NSString *)string;
+ (BOOL)isNilOrEmptyOrWhitespace:(NSString *)string;

+ (NSString *)nonNullString:(NSString *)string;
+ (NSString *)nonEmptyStringOrNil:(NSString *)string;
+ (NSString *)nonEmptyTrimmedStringOrNil:(NSString *)string;
+ (NSString *)newUUIDString;

+ (NSNumber *)numberWithString:(NSString *)string numberStyle:(NSNumberFormatterStyle)style;
- (NSNumber *)numberWithNumberStyle:(NSNumberFormatterStyle)style;

- (BOOL)contains:(NSString *)substring;
- (NSString *)trimmedString;

- (NSMutableArray *)substringByRegular:(NSString *)regular;

@end
