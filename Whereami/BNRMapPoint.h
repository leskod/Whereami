//
//  BNRMapPoint.h
//  Whereami
//
//  Created by Lesko, Dereck on 1/29/14.
//  Copyright (c) 2014 Lesko, Dereck. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface BNRMapPoint : NSObject <MKAnnotation>

-(id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t;

//required for MKAnnotation
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

//optiional for MKAnnotation
@property (nonatomic, copy) NSString *title;

@end
