//
//  ESPoints.h
//  MapApp
//
//  Created by Eduardo Sierra on 11/21/13.
//  Copyright (c) 2013 Sierra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface ESPoints : NSObject <MKAnnotation>

@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *mainTitle;

- (id) initWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString *)mainTitle;

@end
