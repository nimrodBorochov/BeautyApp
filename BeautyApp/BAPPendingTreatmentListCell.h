//
//  BAPTratmentListCell.h
//  BeautyApp
//
//  Created by nimrod borochov on 9/7/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BAPOrderNotificationModel.h"

@interface BAPPendingTreatmentListCell : UITableViewCell

- (void)setupCellWithOrderNotification:(BAPOrderNotificationModel *)orderNotification;

@end
