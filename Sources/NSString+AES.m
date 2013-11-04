//
//  NSString+AES.m
//  FoundationExtend
//
//  Created by ZhuJiaQuan on 13-11-1.
//  Copyright (c) 2013年 5codelab. All rights reserved.
//

#import "NSString+AES.h"
#import "NSData+AES.h"
#import "NSString+MD5.h"
#import "ARCMacros.h"
#import <CommonCrypto/CommonDigest.h>

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation NSString (AES)

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (NSData *)AES256Encrypt:(NSString *)strSource withKey:(NSString*)key
{
    NSData *dataSource = [strSource dataUsingEncoding:NSUTF8StringEncoding];
    return [dataSource AES256EncryptWithKey:[key md5]];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (NSString *)AES256Decrypt:(NSData *)dataSource withKey:(NSString*)key
{
    NSData *decryptData = [dataSource AES256DecryptWithKey:[key md5]];
    return AMAutorelease([[NSString alloc] initWithData:decryptData encoding:NSUTF8StringEncoding]);
}

@end
