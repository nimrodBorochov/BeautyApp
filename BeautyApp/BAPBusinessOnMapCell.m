//
//  BABusinessOnMapCell.m
//  BeautyApp
//
//  Created by Nimrod Borochov on 02/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPBusinessOnMapCell.h"
#import "RateView.h"

static NSString* const RATERS = @"מדרגים";

@interface BAPBusinessOnMapCell ()<RateViewDelegate>


@property (weak, nonatomic) IBOutlet UILabel *lblBusinesName;
@property (weak, nonatomic) IBOutlet UILabel *lblBusinesAdress;
@property (weak, nonatomic) IBOutlet UILabel *lblFirstCertificate;
@property (weak, nonatomic) IBOutlet UILabel *lblSecondCertificate;
@property (weak, nonatomic) IBOutlet UILabel *lblRatersAmount;

@property (weak, nonatomic) IBOutlet UIView *vRate;

@property (strong, nonatomic) RateView* rateView;

@end

@implementation BAPBusinessOnMapCell

//- (instancetype)init
//{
//    self = [super init];
//    
//    NSArray* nibs = [[NSBundle mainBundle]
//                     loadNibNamed:@"BAPBusinessOnMapCell" owner:self options:nil];
//    
//    self = nibs.firstObject;
//    return self;
//}
//
//
//- (void)awakeFromNib
//{
//    [self awakeFromNib];
//    
//    [self setupRateVeiw];
//}

- (void)setupRateVeiw
{
    self.rateView = [[RateView alloc]initWithFrame:CGRectMake(0, 0, 117, 38)];
    
    self.rateView.tag = 88888;
    
    [self.vRate addSubview:self.rateView];
    
    ///
    self.rateView.starSize = 22;
    
    self.rateView.starNormalColor = [UIColor colorWithRed:255/255.0f green:255/255.0f
                                                     blue:255/255.0 alpha:1.0];
    self.rateView.starFillColor = [UIColor colorWithRed:255/255.0f green:209/255.0f
                                                   blue:23/255.0 alpha:1.0];
    self.rateView.starBorderColor = [UIColor colorWithRed:38/255.0f green:38/255.0f
                                                     blue:38/255.0 alpha:1.0];
}

- (void)setUpCellWithBusinesName:(NSString *)name
                          city:(NSString *)city
                          street:(NSString *)street
                       andRating:(float)rating
                       andRaters:(int)raters
{
    [self setupRateVeiw];
    
    self.lblBusinesName.text = name;
    self.lblBusinesAdress.text = [NSString stringWithFormat:@"%@ %@", city , street];
    self.lblRatersAmount.text = [NSString stringWithFormat:@"(%@ %d)", RATERS, raters];
    self.rateView.rating = rating;
}



@end
