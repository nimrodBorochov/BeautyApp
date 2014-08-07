//
//  BACTreatmentTVC.h
//  BeautyApp_Client
//
//  Created by Nimrod Borochov on 14/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TreatmentCellDelegate <NSObject>
- (void)didTappedTreatmentInfoWithTitle:(NSString *)title;
@end

@interface BAPTreatmentCell : UITableViewCell

@property (assign, nonatomic)id<TreatmentCellDelegate> delegate;

@property (weak, nonatomic) IBOutlet UILabel *lblTitleInTreatmentCell;
@property (weak, nonatomic) IBOutlet UILabel *lblNumberOfTreatmentInAsk;

@end
