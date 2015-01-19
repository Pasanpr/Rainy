//
//  ViewController.m
//  Rainy
//
//  Created by Pasan Premaratne on 1/19/15.
//  Copyright (c) 2015 Pasan Premaratne. All rights reserved.
//

#import "ViewController.h"
#import "Currently.h"
#import <WeatherKit/Forecaster.h>

NSString *const kForecastApiKey = @"e7d8d21f3e7c1c515d68fba89aa058ba";

@interface ViewController () {
    CLGeocoder *_geoCoder;
    CLLocation *_weatherLocation;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    
    //Set up location manager and start monitoring location
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers;
    
    _geoCoder = [[CLGeocoder alloc]init];
    
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
        [_locationManager requestAlwaysAuthorization];
    }
    
    [_locationManager startMonitoringSignificantLocationChanges];
    
    //Set up forecaster kit
    _forecaster = [[Forecaster alloc] initWithAPIKey:kForecastApiKey];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    if (locations.lastObject != nil) {
        _weatherLocation = locations.lastObject;
    } else {
        _weatherLocation = manager.location;
    }
    
    [self.forecaster getForecastForLatitude:_weatherLocation.coordinate.latitude longitude:_weatherLocation.coordinate.longitude success:^(NSDictionary *JSON) {
        dispatch_async(dispatch_get_main_queue(), ^{
            Currently *currentWeather = [[Currently alloc] initWithDictionary:JSON[@"currently"]];
            self.weatherIcon.image = currentWeather.icon;
            self.temperatureLabel.text = [NSString stringWithFormat:@"%ld", (long)[currentWeather.temperature integerValue]];
        });
        
    } failure:^(NSError *error, id response) {
        NSLog(@"%@", error);
    }];
    
    [_geoCoder reverseGeocodeLocation:_weatherLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        CLPlacemark *placemark = placemarks.firstObject;
        dispatch_async(dispatch_get_main_queue(), ^{
            self.cityLabel.text = [NSString stringWithFormat:@"%@, %@", placemark.locality, placemark.administrativeArea];
        });
        
    }];
}



@end
