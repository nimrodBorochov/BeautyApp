//
//  BAPTeamPepoleAmount.h
//  BeautyApp
//
//  Created by nimrod borochov on 9/8/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GroupPeopleAmountDelegate <NSObject>

-(void)userSelectGroupPeopleAmount:(NSString *)amount;

@end

@interface BAPGroupPeopleAmountV : UIView

@property (nonatomic, assign)id<GroupPeopleAmountDelegate> delegate;

@end
