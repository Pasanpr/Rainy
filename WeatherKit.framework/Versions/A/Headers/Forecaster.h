//
//  ForecasterKit.h
//  RainyObjC
//
//  Created by Pasan Premaratne on 1/17/15.
//  Copyright (c) 2015 Pasan Premaratne. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Forecaster : NSObject

- (instancetype)initWithAPIKey:(NSString *)forecastAPIKey;
- (void)getForecastForLatitude:(double)lat longitude:(double)lon success:(void (^)(NSDictionary *JSON))success failure:(void (^)(NSError *error, id response))failure;

@end
