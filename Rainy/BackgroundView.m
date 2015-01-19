//
//  BackgroundView.m
//  Rainy
//
//  Created by Pasan Premaratne on 1/19/15.
//  Copyright (c) 2015 Pasan Premaratne. All rights reserved.
//

#import "BackgroundView.h"

@implementation BackgroundView

- (void)drawRect:(CGRect)rect {
    
    CGRect parentContainer = [super bounds];
    
    // Drawing code
    
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* color0 = [UIColor colorWithRed: 0.138 green: 0.037 blue: 0.619 alpha: 0.739];
    UIColor* color4 = [UIColor colorWithRed: 0.547 green: 0 blue: 0.084 alpha: 0.373];
    UIColor* color1 = [UIColor colorWithRed: 0.729 green: 0.317 blue: 0.806 alpha: 1];
    UIColor* color3 = [UIColor colorWithRed: 0.939 green: 0.218 blue: 0.302 alpha: 0.627];
    
    //// Gradient Declarations
    CGFloat linearGradient2Locations[] = {0, 1};
    CGGradientRef linearGradient2 = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)color3.CGColor, (id)color4.CGColor], linearGradient2Locations);
    CGFloat linearGradient1Locations[] = {0, 1};
    CGGradientRef linearGradient1 = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)color0.CGColor, (id)color1.CGColor], linearGradient1Locations);
    
    //// Page-1
    {
        //// Portrait
        {
            //// Rectangle-1
            {
                //// path-3 Drawing
                UIBezierPath* path3Path = [UIBezierPath bezierPathWithRect: parentContainer];
                CGContextSaveGState(context);
                [path3Path addClip];
                CGContextDrawLinearGradient(context, linearGradient1,
                                            CGPointMake(0, 0),
                                            CGPointMake(326.4, 573.68),
                                            kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
                CGContextRestoreGState(context);
                
                
                //// path- Drawing
                UIBezierPath* pathPath = [UIBezierPath bezierPathWithRect: parentContainer];
                CGContextSaveGState(context);
                [pathPath addClip];
                CGContextDrawLinearGradient(context, linearGradient2,
                                            CGPointMake(39.81, 398.37),
                                            CGPointMake(232.94, 136.69),
                                            kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
                CGContextRestoreGState(context);
            }
        }
    }
    
    
    //// Cleanup
    CGGradientRelease(linearGradient2);
    CGGradientRelease(linearGradient1);
    CGColorSpaceRelease(colorSpace);


}

@end
