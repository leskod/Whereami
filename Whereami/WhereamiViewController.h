//
//  WhereamiViewController.h
//  Whereami
//
//  Created by Lesko, Dereck on 1/27/14.
//  Copyright (c) 2014 Lesko, Dereck. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>


@interface WhereamiViewController : UIViewController <CLLocationManagerDelegate,
    MKMapViewDelegate,
    UITextFieldDelegate>
//<> says i confirm to the protocol
{
    CLLocationManager *locationManager;
    IBOutlet MKMapView *worldView;
    IBOutlet UIActivityIndicatorView *activityIndicator;
    IBOutlet UITextField *locationTitleField;
}

//-(void)doSomethingWeird;

-(void)findLocation;
-(void)foundLocation:(CLLocation *)loc;


@end
