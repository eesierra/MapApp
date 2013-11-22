//
//  ESPoints.m
//  MapApp
//
//  Created by Eduardo Sierra on 11/21/13.
//  Copyright (c) 2013 Sierra. All rights reserved.
//

#import "ESPoints.h"

@implementation ESPoints

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString *)mainTitle;
{
    self = [super init];
    self.mainTitle = mainTitle;
    self.coordinate = coordinate;
    
    return self;
}


@end
