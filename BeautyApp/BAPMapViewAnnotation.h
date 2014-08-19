//
//  BAMapViewAnnotation.h
//  BeautyApp
//
//  Created by Nimrod Borochov on 30/06/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface BAPMapViewAnnotation : NSObject<MKAnnotation>

//@property (nonatomic, strong) NSString* identity;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, assign) int identity;

-(id) initWithIdentity:(int)identity AndCoordinate:(CLLocationCoordinate2D)coordinate;


@end
