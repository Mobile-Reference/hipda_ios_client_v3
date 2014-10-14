//
//  Flurry.m
//  HiPDA
//
//  Created by Jichao Wu on 14-10-13.
//  Copyright (c) 2014年 wujichao. All rights reserved.
//

#import "Flurry.h"

@implementation Flurry

+ (void)logEvent:(NSString *)eventName {
    eventName = [eventName stringByReplacingOccurrencesOfString:@" " withString:@"-"];
    [MobClick event:eventName];
}

+ (void)logEvent:(NSString *)eventName withParameters:(NSDictionary *)parameters {
    eventName = [eventName stringByReplacingOccurrencesOfString:@" " withString:@"-"];
    
    NSMutableDictionary *attributes = [NSMutableDictionary new];
    
    [parameters enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if ([obj isKindOfClass:[NSNumber class]]) {
            obj = [obj stringValue];
        }
        if ([obj isKindOfClass:[NSArray class]]) {
            obj = [[obj valueForKey:@"description"] componentsJoinedByString:@","];
        }
        [attributes setObject:obj forKey:key];
    }];
    
    //NSLog(@"eventName %@ attributes %@", eventName, attributes);
    [MobClick event:eventName attributes:attributes];
}

+ (void)setUserID:(NSString *)userID {
    [MobClick event:@"Account-Login" attributes:@{@"userid":userID}];
}


@end