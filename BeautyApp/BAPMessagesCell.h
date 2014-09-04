//
//  BAPMessagesCell.h
//  BeautyApp
//
//  Created by nimrod borochov on 9/2/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BAPOrderNotificationModel.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface BAPMessagesCell : UITableViewCell

- (void)setupCellWithOrderNotification:(BAPOrderNotificationModel *)orderNotification;

@property (weak, nonatomic) IBOutlet UIImageView *ivBeauticianImage;

@end
