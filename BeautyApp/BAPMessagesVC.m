//
//  BAPMessagesVC.m
//  BeautyApp
//
//  Created by nimrod borochov on 9/4/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPMessagesVC.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface BAPMessagesVC ()

@property (weak, nonatomic) IBOutlet UIImageView *ivBeauticianImage;
@property (weak, nonatomic) IBOutlet UILabel *lblBeauticianFullName;
@property (weak, nonatomic) IBOutlet UILabel *lblBeauticianFullAdress;
@property (weak, nonatomic) IBOutlet UIView *vRate;
@property (weak, nonatomic) IBOutlet UILabel *lblBeauticianRatersAmont;

@property (weak, nonatomic) IBOutlet UILabel *lblTreatmentTime;
@property (weak, nonatomic) IBOutlet UITextView *tvTreatmentsAsked;
@property (weak, nonatomic) IBOutlet UILabel *lblTreatmentLocation;
@property (weak, nonatomic) IBOutlet UITextView *tvNots;
@property (weak, nonatomic) IBOutlet UILabel *lblTreatmentPrice;

@end

@implementation BAPMessagesVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self updateUI];
}

-(void)updateUI
{
    // Take care of images in table
    NSURL * imageURL = [NSURL URLWithString:self.orderNotificationModel.strONBeauticianImageUrl];
    
    [self.ivBeauticianImage sd_setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"imageCell"]];
    
    self.lblBeauticianFullName.text = self.orderNotificationModel.strONBeauticianName;
    self.lblBeauticianFullAdress.text = self.orderNotificationModel.strONBeauticianFullAdress;
}

- (IBAction)btnAproveTapped:(id)sender
{
    
}

- (IBAction)btnRejectedTapped:(id)sender
{
    
}


@end
