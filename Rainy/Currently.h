//
//  Currently.h
//  Rainy
//
//  Created by Pasan Premaratne on 1/19/15.
//  Copyright (c) 2015 Pasan Premaratne. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface Currently : NSObject

//@property (nonatomic, strong) CLPlacemark *placemark;
@property (nonatomic, strong) NSNumber *temperature;
@property (nonatomic, strong) UIImage *icon;


- (instancetype)initWithDictionary:(NSDictionary *)currently;

@end
