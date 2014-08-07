//
//  BABusinessOnMapCell.m
//  BeautyApp
//
//  Created by Nimrod Borochov on 02/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPBusinessOnMapCell.h"


@interface BAPBusinessOnMapCell ()<RateViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *ivBusinesImage;
@property (weak, nonatomic) IBOutlet UILabel *lblBusinesName;
@property (weak, nonatomic) IBOutlet UILabel *lblBusinesAdress;
@property (weak, nonatomic) IBOutlet UILabel *lblFirstCertificate;
@property (weak, nonatomic) IBOutlet UILabel *lblSecondCertificate;


@property (weak, nonatomic) IBOutlet BAPRateView *rateView;
@property (weak, nonatomic) IBOutlet UILabel *lblNumOfRaters;

@end

@implementation BAPBusinessOnMapCell

- (void)setUpCellWithBusinesName:(NSString *)name
                       adress:(NSString *)adress
                       firstCertificate:(NSString *)firstCertificate
                       secondCertificate:(NSString *)secondCertificate
                       andRating:(int)rating
                       andRaters:(int)raters
                        andImage:(UIImage *)image
{
    self.ivBusinesImage.image = image;
    self.lblBusinesName.text = name;
    self.lblBusinesAdress.text = adress;
    self.lblFirstCertificate.text = firstCertificate;
    self.lblSecondCertificate.text = secondCertificate;
    self.lblNumOfRaters.text = [NSString stringWithFormat:@"%d", raters];
    self.rateView.notSelectedImage = [UIImage imageNamed:@"kermit_empty.png"];
    self.rateView.halfSelectedImage = [UIImage imageNamed:@"kermit_half.png"];
    self.rateView.fullSelectedImage = [UIImage imageNamed:@"kermit_full.png"];
    self.rateView.rating = rating;
    self.rateView.editable = NO;
    self.rateView.maxRating = 5;
}



@end
