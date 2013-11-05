//
//  NSDictionary+URLString.m
//  FoundationExtend
//
//  Created by ZhuJiaQuan on 13-11-4.
//  Copyright (c) 2013年 5codelab. All rights reserved.
//

#import "NSDictionary+URLString.h"
#import "NSString+URLCode.h"
#import "ARCMacros.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation NSDictionary (URLString)

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (NSDictionary *)dictionaryWithURLString:(NSString *)URLString
{
    NSMutableDictionary *components = AMAutorelease([NSMutableDictionary new]);
    for (NSString *keyValueString in [URLString componentsSeparatedByString:@"&"])
    {
        NSArray *keyValueArray = [keyValueString componentsSeparatedByString:@"="];
        if ([keyValueArray count] < 2)
        {
			continue;
        }
		
        NSString *key = [[keyValueArray objectAtIndex:0] URLDecodedString];
        NSString *value = [[keyValueArray objectAtIndex:1] URLDecodedString];
		
		[components setObject:value forKey:key];
    }
    
    return AMAutorelease([[NSDictionary alloc] initWithDictionary:components]);
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString *)URLParametersString
{
	NSMutableArray* arguments = AMAutorelease([[NSMutableArray alloc] initWithCapacity:[self count]]);
	[self enumerateKeysAndObjectsUsingBlock:^(NSString *key, id obj, BOOL *stop) {
        
        NSString *param = [[NSString alloc] initWithFormat:@"%@=%@", [key URLEncodedString],[[obj description] URLEncodedString]];
		[arguments addObject:AMAutorelease(param)];
        
	}];
	return [arguments componentsJoinedByString:@"&"];
}

@end
