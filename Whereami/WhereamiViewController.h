//
//  WhereamiViewController.h
//  Whereami
//
//  Created by Lesko, Dereck on 1/27/14.
//  Copyright (c) 2014 Lesko, Dereck. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>


@interface WhereamiViewController : UIViewController <CLLocationManagerDelegate>
//<> says i confirm to the protocol
{
    CLLocationManager *locationManager;
}

//-(void)doSomethingWeird;


@end
