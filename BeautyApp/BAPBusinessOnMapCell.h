//
//  BABusinessOnMapCell.h
//  BeautyApp
//
//  Created by Nimrod Borochov on 02/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BAPRateView.h"

@interface BAPBusinessOnMapCell : UITableViewCell

- (void)setUpCellWithBusinesName:(NSString *)name
                          adress:(NSString *)adress
                firstCertificate:(NSString *)firstCertificate
               secondCertificate:(NSString *)secondCertificate
                       andRating:(int)rating
                       andRaters:(int)raters
                        andImage:(UIImage *)image;

@end
