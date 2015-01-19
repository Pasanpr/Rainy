//
//  TodayViewController.h
//  RainyToday
//
//  Created by Pasan Premaratne on 1/19/15.
//  Copyright (c) 2015 Pasan Premaratne. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@class Forecaster;

@interface TodayViewController : UIViewController <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *weatherLabel;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) Forecaster *forecaster;

@end
