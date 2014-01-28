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
    
    [locationManager setDelegate:self];
    
    // use best accuracy
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    
    // start looking for location immediately
    [locationManager startUpdatingHeading];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//// this is deprecated
//-(void)locationManager:(CLLocationMAnager *) manager
//   didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
//{
//    NSLog(@"%@",newLocation);
//}


-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSLog(@"in locationManager");
    
    CLLocation *location = [locations objectAtIndex:0];
    
    NSLog(@"%@", [location description]);
}

-(void) locationManager:(CLLocationManager *) manager didFailWithError:(NSError *)error
{
    NSLog(@"Cound not find the location %@", [error localizedDescription]);
}



@end
