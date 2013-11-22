//
//  ESViewController.h
//  MapApp
//
//  Created by Eduardo Sierra on 11/20/13.
//  Copyright (c) 2013 Sierra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "ESPoints.h"

@interface ESViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

@property (nonatomic, retain) IBOutlet MKMapView *location;
@property (nonatomic, retain) CLLocationManager *locationMgr;

- (IBAction)refreshLocation:(id)sender;

@end
