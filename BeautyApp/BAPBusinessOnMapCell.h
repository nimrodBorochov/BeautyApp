//
//  BABusinessOnMapCell.h
//  BeautyApp
//
//  Created by Nimrod Borochov on 02/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface BAPBusinessOnMapCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *ivBusinesImage;

- (void)setUpCellWithBusinesName:(NSString *)name
                            city:(NSString *)city
                          street:(NSString *)street
                       andRating:(float)rating
                       andRaters:(int)raters;

@end
