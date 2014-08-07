//
//  BACTreatmentHistoryCell.h
//  BeautyApp_Client
//
//  Created by nimrod borochov on 7/30/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TreatmentHistoryCellDelegate <NSObject>
- (void)userDidTappedTreatmentHistoryRate;
- (void)userDidTappedTreatmentHistoryReorder;
@end

@interface BAPTreatmentHistoryCell : UITableViewCell

@property (nonatomic, assign) id<TreatmentHistoryCellDelegate> delegate;

- (void)setUpCellWithDate:(NSString *)date
           beauticianName:(NSString *)beauticianName
               treatments:(NSString *)treatments
                 location:(NSString *)location
                    price:(NSString *)price;

@end
