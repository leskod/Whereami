//
//  WhereamiViewController.m
//  Whereami
//
//  Created by Lesko, Dereck on 1/27/14.
//  Copyright (c) 2014 Lesko, Dereck. All rights reserved.
//

#import "WhereamiViewController.h"
#import "BNRMapPoint.h"

@interface WhereamiViewController ()

@end

@implementation WhereamiViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"in viewDidLoad");
    
    
    locationManager = [[CLLocationManager alloc]init];
    
    //[self doSomethingWeird];
    
    [locationManager setDelegate:self];
    
    // use best accuracy
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    
    // start looking for location immediately
    // locationManager continues to send updates to me
    //[locationManager startUpdatingLocation];
    [worldView setShowsUserLocation:YES];
    
    
//    // set filter to 50 meters
//    [locationManager setDistanceFilter:50];
//    
//    //if ([locationManager headingAvailable])
//    if([CLLocationManager headingAvailable])
//    {
//        [locationManager startUpdatingHeading];
//    }
//    else{
//        NSLog(@"no compass in simulator");
//    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(void)doSomethingWeird
//{
//    NSLog(@"Line 1");
//    NSLog(@"Line 2");
//    NSLog(@"Line 3");
//}

//// this is deprecated
//-(void)locationManager:(CLLocationManager *) manager
//   didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
//{
//    NSLog(@"in the deprecated method");
//    
//    NSLog(@"%@",newLocation);
//}


-(void)locationManager:(CLLocationManager *)manager
    didUpdateLocations:(NSArray *)locations
{
    NSLog(@"in didUpdateLocations");
    
    CLLocation *location = [locations objectAtIndex:0];
    
    NSLog(@"%@", [location description]);
    
    
    // how long ago in seconds did the location get created
    NSTimeInterval t = [[location timestamp] timeIntervalSinceNow];
    
    // CLCLLocationManagers will return the last found location of the
    // device first, you don't want that data in this case.
    // If this location was made more than 3 minutes ago, ignore it
    if (t < -180)
    {
        // this is cached data, you don't want it, keep looking
        return;
    }
    
    [self foundLocation:location];
}

-(void)locationManager:(CLLocationManager *)manager
    didUpdateHeading:(CLHeading *)newHeading
{
    NSLog(@"in didUpdateHeading");
    
    //CLLocation *location = [locations objectAtIndex:0];
    
    //never get here
    NSLog(@"Heading Is:  %@", [newHeading description]);
    NSLog(@"Heading Is:  %@", newHeading);
}

-(void) locationManager:(CLLocationManager *) manager didFailWithError:(NSError *)error
{
    NSLog(@"Cound not find the location %@", [error localizedDescription]);
}

-(void)dealloc
{
    // tell the location manager to stop sending us messages
    [locationManager setDelegate:nil];
}






- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    [worldView setRegion:region animated:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self findLocation];
    [textField resignFirstResponder];
    return YES;
}

//create findLocation and foundLocation, go through chapter, put on github.  no need to do challenges


-(void)findLocation;
{
    [locationManager startUpdatingLocation];
    [activityIndicator startAnimating];
    [locationTitleField setHidden:YES];
}


-(void)foundLocation:(CLLocation *)loc;
{
    CLLocationCoordinate2D coord = [loc coordinate];
    
    // Create an instance of BNRMapPoint with the current data
    BNRMapPoint *mp = [[BNRMapPoint alloc] initWithCoordinate:coord
                                                       title:[locationTitleField text]];
    // add it to the map view
    [worldView addAnnotation:mp];
    
    // zoom
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 250, 250);
    [worldView setRegion:region animated:YES];
    
    //reset the UI
    [locationTitleField setText:@""];
    [activityIndicator stopAnimating];
    [locationTitleField setHidden:NO];
    [locationManager stopUpdatingLocation];
}

@end
