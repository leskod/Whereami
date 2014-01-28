//
//  WhereamiViewController.m
//  Whereami
//
//  Created by Lesko, Dereck on 1/27/14.
//  Copyright (c) 2014 Lesko, Dereck. All rights reserved.
//

#import "WhereamiViewController.h"

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
    [locationManager startUpdatingLocation];
    
    // set filter to 50 meters
    [locationManager setDistanceFilter:50];
    
    //if ([locationManager headingAvailable])
    if([CLLocationManager headingAvailable])
    {
        [locationManager startUpdatingHeading];
    }
    else{
        //http://stackoverflow.com/questions/8059725/ios-simulator-and-xcode-to-simulate-compass
        NSLog(@"no compass in simulator");
    }
    
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



@end
