//
//  NSNumberFormatter+Utilities.m
//  FoundationExtend
//
//  Created by ZhuJiaQuan on 13-11-1.
//  Copyright (c) 2013年 5codelab. All rights reserved.
//

#import "NSNumberFormatter+Utilities.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
NSNumberFormatter *sharedNumberFormatterDecimalStyle  = nil;
NSNumberFormatter *sharedNumberFormatterCurrencyStyle = nil;
NSNumberFormatter *sharedNumberFormatterPercentStyle    = nil;
NSNumberFormatter *sharedNumberFormatterScientificStyle = nil;
NSNumberFormatter *sharedNumberFormatterSpellOutStyle   = nil;
NSNumberFormatter *sharedNumberFormatterNoStyle   = nil;

static NSString *kSharedNumberFormatterDecimalStyleLock  = @"kSharedNumberFormatterDecimalStyleLock";
static NSString *kSharedNumberFormatterCurrencyStyleLock = @"kSharedNumberFormatterCurrencyStyleLock";
static NSString *kSharedNumberFormatterPercentStyleLock  = @"kSharedNumberFormatterPercentStyleLock";
static NSString *kSharedNumberFormatterScientificStyleLock = @"kSharedNumberFormatterScientificStyleLock";
static NSString *kSharedNumberFormatterSpellOutStyleLock   = @"kSharedNumberFormatterSpellOutStyleLock";
static NSString *kSharedNumberFormatterNoStyleLock  = @"kSharedNumberFormatterNoStyleLock";

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation NSNumberFormatter (Utilities)

/////////////////////////////////////////////////////////////////////////////////////////////////////
+ (NSNumberFormatter *)decimalStyleSharedNumberFormatter
{
    if (sharedNumberFormatterDecimalStyle) {
        return sharedNumberFormatterDecimalStyle;
    }
    
    @synchronized(kSharedNumberFormatterDecimalStyleLock) {
        if (sharedNumberFormatterDecimalStyle == nil) {
            sharedNumberFormatterDecimalStyle = [[NSNumberFormatter alloc] init];
            sharedNumberFormatterDecimalStyle.numberStyle = NSNumberFormatterDecimalStyle;
        }
    }
    
    return sharedNumberFormatterDecimalStyle;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (NSNumberFormatter *)currencyStyleSharedNumberFormatter
{
    if (sharedNumberFormatterCurrencyStyle) {
        return sharedNumberFormatterCurrencyStyle;
    }
    
    @synchronized(kSharedNumberFormatterCurrencyStyleLock) {
        if (sharedNumberFormatterCurrencyStyle == nil) {
            sharedNumberFormatterCurrencyStyle = [[NSNumberFormatter alloc] init];
            sharedNumberFormatterCurrencyStyle.numberStyle = NSNumberFormatterCurrencyStyle;
        }
    }
    
    return sharedNumberFormatterCurrencyStyle;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (NSNumberFormatter *)percentStyleSharedNumberFormatter
{
    if (sharedNumberFormatterPercentStyle) {
        return sharedNumberFormatterPercentStyle;
    }
    
    @synchronized(kSharedNumberFormatterPercentStyleLock) {
        if (sharedNumberFormatterPercentStyle == nil) {
            sharedNumberFormatterPercentStyle = [[NSNumberFormatter alloc] init];
            sharedNumberFormatterPercentStyle.numberStyle = NSNumberFormatterPercentStyle;
        }
    }
    
    return sharedNumberFormatterCurrencyStyle;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (NSNumberFormatter *)scientificStyleSharedNumberFormatter
{
    if (sharedNumberFormatterScientificStyle) {
        return sharedNumberFormatterScientificStyle;
    }
    
    @synchronized(kSharedNumberFormatterScientificStyleLock) {
        if (sharedNumberFormatterScientificStyle == nil) {
            sharedNumberFormatterScientificStyle = [[NSNumberFormatter alloc] init];
            sharedNumberFormatterScientificStyle.numberStyle = NSNumberFormatterScientificStyle;
        }
    }
    
    return sharedNumberFormatterCurrencyStyle;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (NSNumberFormatter *)spellOutStyleSharedNumberFormatter
{
    if (sharedNumberFormatterSpellOutStyle) {
        return sharedNumberFormatterSpellOutStyle;
    }
    
    @synchronized(kSharedNumberFormatterSpellOutStyleLock) {
        if (sharedNumberFormatterSpellOutStyle == nil) {
            sharedNumberFormatterSpellOutStyle = [[NSNumberFormatter alloc] init];
            sharedNumberFormatterSpellOutStyle.numberStyle = NSNumberFormatterSpellOutStyle;
        }
    }
    
    return sharedNumberFormatterSpellOutStyle;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (NSNumberFormatter *)noStyleSharedNumberFormatter
{
    if (sharedNumberFormatterNoStyle) {
        return sharedNumberFormatterNoStyle;
    }
    
    @synchronized(kSharedNumberFormatterNoStyleLock) {
        if (sharedNumberFormatterNoStyle == nil) {
            sharedNumberFormatterNoStyle = [[NSNumberFormatter alloc] init];
            sharedNumberFormatterNoStyle.numberStyle = NSNumberFormatterNoStyle;
        }
    }
    
    return sharedNumberFormatterSpellOutStyle;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (NSNumberFormatter *)numberFormatterWithNumberStyle:(NSNumberFormatterStyle)style
{
    NSNumberFormatter *formatter = nil;
    switch (style)
    {
        case NSNumberFormatterDecimalStyle:
        formatter = [NSNumberFormatter decimalStyleSharedNumberFormatter];
        break;
        
        case NSNumberFormatterCurrencyStyle:
        formatter = [NSNumberFormatter currencyStyleSharedNumberFormatter];
        break;
        
        case NSNumberFormatterPercentStyle:
        formatter = [NSNumberFormatter percentStyleSharedNumberFormatter];
        break;
        
        case NSNumberFormatterScientificStyle:
        formatter = [NSNumberFormatter scientificStyleSharedNumberFormatter];
        break;
        
        case NSNumberFormatterSpellOutStyle:
        formatter = [NSNumberFormatter spellOutStyleSharedNumberFormatter];
        break;
        
        default:
        formatter = [NSNumberFormatter noStyleSharedNumberFormatter];
        break;
    }
    return formatter;
}

//+ (NSNumberFormatter *)numberFormatterWithNumberStyle:(NSNumberFormatterStyle)style
//{
//    NSNumberFormatter *formatter = nil;
//    switch (style)
//    {
//        case NSNumberFormatterDecimalStyle:
//            if (sharedNumberFormatterDecimalStyle) {
//                formatter = sharedNumberFormatterDecimalStyle;
//                break;
//            }
//            @synchronized(kSharedNumberFormatterDecimalStyleLock) {
//                if (sharedNumberFormatterDecimalStyle == nil) {
//                    sharedNumberFormatterDecimalStyle = [[NSNumberFormatter alloc] init];
//                    sharedNumberFormatterDecimalStyle.numberStyle = NSNumberFormatterDecimalStyle;
//                }
//            }
//            formatter = sharedNumberFormatterDecimalStyle;
//            break;
//        
//        case NSNumberFormatterCurrencyStyle:
//            if (sharedNumberFormatterCurrencyStyle){
//                formatter = sharedNumberFormatterCurrencyStyle;
//            }
//            @synchronized(kSharedNumberFormatterCurrencyStyleLock) {
//                if (sharedNumberFormatterCurrencyStyle == nil) {
//                    sharedNumberFormatterCurrencyStyle = [[NSNumberFormatter alloc] init];
//                    sharedNumberFormatterCurrencyStyle.numberStyle = NSNumberFormatterCurrencyStyle;
//                }
//            }
//            formatter = sharedNumberFormatterCurrencyStyle;
//            break;
//        
//        case NSNumberFormatterPercentStyle:
//            if (sharedNumberFormatterPercentStyle){
//                formatter = sharedNumberFormatterPercentStyle;
//            }
//            @synchronized(kSharedNumberFormatterPercentStyleLock) {
//                if (sharedNumberFormatterPercentStyle == nil) {
//                    sharedNumberFormatterPercentStyle = [[NSNumberFormatter alloc] init];
//                    sharedNumberFormatterPercentStyle.numberStyle = NSNumberFormatterPercentStyle;
//                }
//            }
//            formatter = sharedNumberFormatterCurrencyStyle;
//            break;
//        
//        case NSNumberFormatterScientificStyle:
//            if (sharedNumberFormatterScientificStyle){
//                formatter = sharedNumberFormatterScientificStyle;
//            }
//            @synchronized(kSharedNumberFormatterScientificStyleLock) {
//                if (sharedNumberFormatterScientificStyle == nil) {
//                    sharedNumberFormatterScientificStyle = [[NSNumberFormatter alloc] init];
//                    sharedNumberFormatterScientificStyle.numberStyle = NSNumberFormatterScientificStyle;
//                }
//            }
//            formatter = sharedNumberFormatterCurrencyStyle;
//            break;
//        
//        case NSNumberFormatterSpellOutStyle:
//            if (sharedNumberFormatterSpellOutStyle){
//                formatter = sharedNumberFormatterSpellOutStyle;
//            }
//            @synchronized(kSharedNumberFormatterSpellOutStyleLock) {
//                if (sharedNumberFormatterSpellOutStyle == nil) {
//                    sharedNumberFormatterSpellOutStyle = [[NSNumberFormatter alloc] init];
//                    sharedNumberFormatterSpellOutStyle.numberStyle = NSNumberFormatterSpellOutStyle;
//                }
//            }
//            formatter = sharedNumberFormatterSpellOutStyle;
//            break;
//        
//        default:
//            if (sharedNumberFormatterNoStyle){
//                formatter = sharedNumberFormatterNoStyle;
//            }
//            @synchronized(kSharedNumberFormatterNoStyleLock) {
//                if (sharedNumberFormatterNoStyle == nil) {
//                    sharedNumberFormatterNoStyle = [[NSNumberFormatter alloc] init];
//                    sharedNumberFormatterNoStyle.numberStyle = NSNumberFormatterNoStyle;
//                }
//            }
//            formatter = sharedNumberFormatterSpellOutStyle;
//            break;
//    }
//    return formatter;
//}

@end
