//
//  TodayViewController.m
//  RainyToday
//
//  Created by Pasan Premaratne on 1/19/15.
//  Copyright (c) 2015 Pasan Premaratne. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import <WeatherKit/Forecaster.h>

NSString *const kForecastApiKey = @"e7d8d21f3e7c1c515d68fba89aa058ba";

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Set up location manager and start monitoring location
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers;
    
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
        [_locationManager requestAlwaysAuthorization];
    }
    
    [_locationManager startUpdatingLocation];
    
    //Set up forecaster kit
    _forecaster = [[Forecaster alloc] initWithAPIKey:kForecastApiKey];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *weatherLocation;
    if (locations.lastObject != nil) {
        weatherLocation = locations.lastObject;
    } else {
        weatherLocation = manager.location;
    }
    
    [self.forecaster getForecastForLatitude:weatherLocation.coordinate.latitude longitude:weatherLocation.coordinate.longitude success:^(NSDictionary *JSON) {
        NSDictionary *currentWeather = [[NSDictionary alloc] initWithDictionary:JSON[@"currently"]];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.weatherLabel.text = [NSString stringWithFormat:@"The current temperature is %ld Farenheit", (long)[currentWeather[@"temperature"] integerValue]];
        });
        
    } failure:^(NSError *error, id response) {
        NSLog(@"%@", error);
    }];
}


@end
