//
//  NSDictionary+URLString.h
//  FoundationExtend
//
//  Created by ZhuJiaQuan on 13-11-4.
//  Copyright (c) 2013年 5codelab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (URLString)

+ (NSDictionary *)dictionaryWithURLString:(NSString *)URLString;
- (NSString *)URLParametersString;

@end
