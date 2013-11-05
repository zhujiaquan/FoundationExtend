//
//  NSString+Utilities.m
//  FoundationExtend
//
//  Created by ZhuJiaQuan on 13-11-1.
//  Copyright (c) 2013年 5codelab. All rights reserved.
//

#import <CoreFoundation/CoreFoundation.h>
#import "NSString+Utilities.h"
#import "NSNumberFormatter+Utilities.h"
#import "ARCMacros.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation NSString (Utilities)

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (BOOL)isNilOrEmpty:(NSString *)string
{
	return (string == nil ||
            [string isEqual:[NSNull null]] ||
            [string isEqual:nil] ||
            [string length] <= 0);
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (BOOL)isNilOrEmptyOrWhitespace:(NSString *)string
{
	return (string == nil ||
            [string isEqual:[NSNull null]] ||
            [string isEqual:nil] ||
            [[string trimmedString] length] <= 0);
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (NSString *)nonNullString:(NSString *)string
{
	return (string ? string : [NSString string]);
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (NSString *)nonEmptyStringOrNil:(NSString *)string
{
	if ([self isNilOrEmpty:string])
    {
		return nil;
    }
	return string;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (NSString *)nonEmptyTrimmedStringOrNil:(NSString *)string
{
	if ([self isNilOrEmptyOrWhitespace:string])
    {
        return nil;
    }
	return [string trimmedString];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (NSString *)newUUIDString
{
	CFUUIDRef theUUID = CFUUIDCreate(NULL);
	NSString *string = ( NSString *)CFUUIDCreateString(NULL, theUUID);
	CFRelease(theUUID);
	return string;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)contains:(NSString *)substring
{
	return ([self rangeOfString:substring].location != NSNotFound);
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString *)trimmedString
{
	return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (NSNumber *)numberWithString:(NSString *)string numberStyle:(NSNumberFormatterStyle)style
{
    NSNumberFormatter *formatter = [NSNumberFormatter numberFormatterWithNumberStyle:style];
    return [formatter numberFromString:string];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSNumber *)numberWithNumberStyle:(NSNumberFormatterStyle)style
{
    NSNumberFormatter *formatter = [NSNumberFormatter numberFormatterWithNumberStyle:style];
    return [formatter numberFromString:self];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSMutableArray *)substringByRegular:(NSString *)regular
{
    NSRange r = [self rangeOfString:regular options:NSRegularExpressionSearch];
    NSMutableArray *arr = [NSMutableArray array];
    if (r.length != NSNotFound &&r.length != 0)
    {
        while (r.length != NSNotFound &&r.length != 0)
        {
            NSString* substr = [self substringWithRange:r];
            [arr addObject:substr];
            NSRange startr = NSMakeRange(r.location+r.length, [self length]-r.location-r.length);
            r = [self rangeOfString:regular options:NSRegularExpressionSearch range:startr];
        }
    }
    return arr;
}

@end
