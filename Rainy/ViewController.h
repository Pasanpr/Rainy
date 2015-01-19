//
//  ViewController.h
//  Rainy
//
//  Created by Pasan Premaratne on 1/19/15.
//  Copyright (c) 2015 Pasan Premaratne. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@class Currently;
@class Forecaster;

@interface ViewController : UIViewController <CLLocationManagerDelegate>

//Outlets
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;


//Properties
@property (strong, nonatomic) Forecaster *forecaster;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) Currently *currently;



@end

