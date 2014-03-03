//
//  NSObject+Utilities.h
//  FoundationExtend
//
//  Created by ZhuJiaQuan on 13-11-4.
//  Copyright (c) 2013年 5codelab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Utilities)

+ (BOOL)isNil:(id)obj;
- (id)performString:(NSString *)string;
- (id)performString:(NSString *)string withObject:(id)obj;

@end
