//
//  Currently.m
//  Rainy
//
//  Created by Pasan Premaratne on 1/19/15.
//  Copyright (c) 2015 Pasan Premaratne. All rights reserved.
//

#import "Currently.h"

@implementation Currently

- (instancetype)initWithDictionary:(NSDictionary *)currently
{
    self = [super init];
    if (self) {
        _temperature = currently[@"temperature"];
        _icon = [self iconFromString:currently[@"icon"]];
    }
    return self;
}

- (UIImage *)iconFromString:(NSString *)iconName {
    
    static NSDictionary *map = nil;
    if (map == nil) {
        map = [NSDictionary dictionaryWithObjectsAndKeys:@"clear-day", @"clear-day", @"clear-night", @"clear-night", @"rain", @"rain", @"snow", @"snow", @"sleet", @"sleet", @"wind", @"wind", @"fog", @"fog", @"cloudy", @"cloudy",@"partly-cloudy", @"partly-cloudy-day", @"cloudy-night", @"partly-cloudy-night", nil];
    }
    return [UIImage imageNamed:map[iconName]];
}

@end
