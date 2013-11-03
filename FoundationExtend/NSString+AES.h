//
//  NSString+AES.h
//  FoundationExtend
//
//  Created by ZhuJiaQuan on 13-11-1.
//  Copyright (c) 2013年 5codelab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (AES)

+ (NSData *)AES256Encrypt:(NSString *)strSource withKey:(NSString*)key;
+ (NSString *)AES256Decrypt:(NSData *)dataSource withKey:(NSString*)key;

@end
