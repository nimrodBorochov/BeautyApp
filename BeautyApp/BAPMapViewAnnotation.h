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

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSString* identity;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;


-(id) initWithTitle:(NSString *)title Identity:(NSString *)identity AndCoordinate:(CLLocationCoordinate2D)coordinate;

@end
