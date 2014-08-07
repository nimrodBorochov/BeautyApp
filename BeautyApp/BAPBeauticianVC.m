//
//  BACBeauticianVC.m
//  BeautyApp_Client
//
//  Created by Nimrod Borochov on 16/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPBeauticianVC.h"
#import "BAPReservationVC.h"

@interface BAPBeauticianVC ()

@property (weak, nonatomic) IBOutlet UILabel *lblBeauticianFullName;
@property (weak, nonatomic) IBOutlet UILabel *lblBeauticianFullAdress;
@property (weak, nonatomic) IBOutlet UIImageView *ivBeautician;
@property (weak, nonatomic) IBOutlet UILabel *lblRatersCount;
@property (weak, nonatomic) IBOutlet UITextView *tvBeaticianDegrees;
@property (weak, nonatomic) IBOutlet UILabel *lblBeauticianFirstCertificate;
@property (weak, nonatomic) IBOutlet UILabel *lblBeauticianSecondCertificate;
@property (weak, nonatomic) IBOutlet UITextView *tvBeauticianTreatments;

@property (weak, nonatomic) IBOutlet BAPRateView *rateView;

@property (weak, nonatomic) IBOutlet UIView *vTitle;
@property (weak, nonatomic) IBOutlet UIView *vRate;
@property (weak, nonatomic) IBOutlet UIView *vDegrees;
@property (weak, nonatomic) IBOutlet UIView *vCertificates;
@property (weak, nonatomic) IBOutlet UIView *vTreatments;
@property (weak, nonatomic) IBOutlet UIButton *btnOrderTreatments;

@end

@implementation BAPBeauticianVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self updateUI];
}

- (void)updateUI
{
    self.vTitle.layer.borderColor = [UIColor blackColor].CGColor;
    self.vTitle.layer.borderWidth = 1.0f;
    self.vRate.layer.borderColor = [UIColor blackColor].CGColor;
    self.vRate.layer.borderWidth = 1.0f;
    self.vDegrees.layer.borderColor = [UIColor blackColor].CGColor;
    self.vDegrees.layer.borderWidth = 1.0f;
    self.vCertificates.layer.borderColor = [UIColor blackColor].CGColor;
    self.vCertificates.layer.borderWidth = 1.0f;
    self.vTreatments.layer.borderColor = [UIColor blackColor].CGColor;
    self.vTreatments.layer.borderWidth = 1.0f;
    
    self.btnOrderTreatments.layer.borderWidth = 1.0f;
    self.btnOrderTreatments.layer.cornerRadius = 5;
    self.btnOrderTreatments.layer.borderColor = [UIColor blueColor].CGColor;
    
    self.lblBeauticianFullName.text = self.business.strBusinessName;
    self.lblBeauticianFullAdress.text = self.business.strBusinessFullAdress;
    self.lblRatersCount.text = self.business.businessRating.numBusinessRaters.stringValue;
    self.lblBeauticianFirstCertificate.text = self.business.strBeauticianFirstCertificate;
    self.lblBeauticianSecondCertificate.text = self.business.strBeauticianSecondCertificate;
    self.ivBeautician.image = self.business.imageOfBusines;
    
    self.rateView.notSelectedImage = [UIImage imageNamed:@"kermit_empty.png"];
    self.rateView.halfSelectedImage = [UIImage imageNamed:@"kermit_half.png"];
    self.rateView.fullSelectedImage = [UIImage imageNamed:@"kermit_full.png"];
    self.rateView.rating = [self.business.businessRating.numBusinessRateAverage intValue];
    self.rateView.editable = NO;
    self.rateView.maxRating = 5;
    
    self.lblRatersCount.text = [NSString stringWithFormat:@"%@ מדרגים", self.business.businessRating.numBusinessRateAverage];
    self.tvBeaticianDegrees.text = self.business.strBeauticianDegrees;
    self.tvBeauticianTreatments.text = @"בטיפול";
}

- (IBAction)btnMakeReservationTapped:(id)sender
{
    BAPReservationVC* reservationVC = [self.storyboard instantiateViewControllerWithIdentifier:@"BAPReservationVC"];
    
    [self.navigationController pushViewController:reservationVC animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
