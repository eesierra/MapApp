//
//  ESViewController.m
//  MapApp
//
//  Created by Eduardo Sierra on 11/20/13.
//  Copyright (c) 2013 Sierra. All rights reserved.
//

#import "ESViewController.h"

@interface ESViewController ()

@end

@implementation ESViewController
{
    CLAuthorizationStatus _status;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.location.delegate = self;
    
    [self setLocationMgr:[[CLLocationManager alloc] init]];
    [_locationMgr setDelegate:self];
    [_locationMgr setDistanceFilter:kCLDistanceFilterNone];
    [_locationMgr setDesiredAccuracy:kCLLocationAccuracyBest];
    [_locationMgr startUpdatingLocation];
    
    [self.location setShowsUserLocation:YES];
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion theRegion = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 5000, 5000);
    [self.location setRegion:theRegion animated:YES];
    
    CLLocationCoordinate2D user = userLocation.location.coordinate;
    
    for (int i=0; i<=10; i++) {
        CGFloat lat = rand()*.04/RAND_MAX -.025;
        CGFloat lng = rand()*.03/RAND_MAX -.015;
        
        CLLocationCoordinate2D new = { user.latitude + lat, user.longitude +lng };
        ESPoints *place = [[ESPoints alloc] initWithCoordinate:new title:@"Hello"];
        
        [self.location addAnnotation:place];
    }
    
    
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    static NSString *identifier = @"ESPoints";
    
    if ([annotation isKindOfClass:[ESPoints class]])
        return nil;
    {
        MKPinAnnotationView *pins = (MKPinAnnotationView *) [self.location dequeueReusableAnnotationViewWithIdentifier:identifier];
        
        if (!pins)
        {
            pins = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
            pins.pinColor = MKPinAnnotationColorPurple;
            pins.enabled = YES;
            pins.animatesDrop = YES;
            pins.canShowCallout = YES;
            
        } else {
            pins.annotation = annotation;
        }
        return pins;
    }
    
}

- (IBAction)refreshLocation:(id)sender
{
    [self.location setCenterCoordinate:self.location.centerCoordinate animated:YES];
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if (status == kCLAuthorizationStatusDenied) {
        [self authMessage];
    } else if (status == kCLAuthorizationStatusAuthorized) {
        NSLog(@"We're good here!");
    }
}

- (void) authMessage
{
    UIAlertView *authAlert = [[UIAlertView alloc] initWithTitle:@"Hello!" message:@"Let us know where you are! Please turn on your Location Services to maximize the app usage!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [authAlert show];
                              
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
