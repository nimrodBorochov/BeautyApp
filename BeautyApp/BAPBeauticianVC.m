//
//  BACBeauticianVC.m
//  BeautyApp_Client
//
//  Created by Nimrod Borochov on 16/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPBeauticianVC.h"
#import "BAPReservationVC.h"
#import "RateView.h"

static NSString* const RATERS = @"מדרגים";

@interface BAPBeauticianVC ()

@property (weak, nonatomic) IBOutlet UILabel *lblBeauticianFullName;
@property (weak, nonatomic) IBOutlet UILabel *lblBeauticianFullAdress;
@property (weak, nonatomic) IBOutlet UIImageView *ivBeautician;
@property (weak, nonatomic) IBOutlet UILabel *lblRatersCount;
@property (weak, nonatomic) IBOutlet UITextView *tvBeaticianDegrees;
@property (weak, nonatomic) IBOutlet UILabel *lblBeauticianFirstCertificate;
@property (weak, nonatomic) IBOutlet UILabel *lblBeauticianSecondCertificate;
@property (weak, nonatomic) IBOutlet UITextView *tvBeauticianTreatments;
@property (weak, nonatomic) IBOutlet UIView *vTitle;
@property (weak, nonatomic) IBOutlet UIView *vRate;
@property (weak, nonatomic) IBOutlet UIView *vDegrees;
@property (weak, nonatomic) IBOutlet UIView *vCertificates;
@property (weak, nonatomic) IBOutlet UIView *vTreatments;
@property (weak, nonatomic) IBOutlet UIButton *btnOrderTreatments;
@property (weak, nonatomic) IBOutlet UIView *vRateView;

@property (strong, nonatomic) RateView* rateView;

@end

@implementation BAPBeauticianVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self arrangeUI];
    
    [self updateUIWithBeautician:self.beauticianModel];
}

- (void)arrangeUI
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
    
    [self setupRateVeiw];
}

- (void)updateUIWithBeautician:(BAPBeauticianModel *)beautician
{
    // Init outlets with data
    
    if (beautician.strBeauticianImageURL.length > 0)
    {
        NSURL* imageURL = [NSURL URLWithString:beautician.strBeauticianImageURL];
        NSData* imageData = [NSData dataWithContentsOfURL:imageURL];
        self.ivBeautician.image = [UIImage imageWithData:imageData];
    }
    else
    {
        self.ivBeautician.image = [UIImage imageNamed:@"imageCell"];
    }
    
    if (beautician.strBeauticianName.length > 0)
    {
        self.lblBeauticianFullName.text = beautician.strBeauticianName;
    }
    else
    {
        self.lblBeauticianFullName.text = @"";
    }
    
    if (beautician.beauticianAdressModel.strBeauticianCity.length > 0)
    {
        if (beautician.beauticianAdressModel.strBeauticianStreet.length > 0)
        {
            self.lblBeauticianFullAdress.text = [NSString stringWithFormat:@"%@ %@", beautician.beauticianAdressModel.strBeauticianCity, beautician.beauticianAdressModel.strBeauticianStreet];
        }
        else
        {
            self.lblBeauticianFullAdress.text = beautician.beauticianAdressModel.strBeauticianCity;
        }
    }
    else
    {
        self.lblBeauticianFullAdress.text = @"";
    }
    
    if (beautician.beauticianRatingModel.intRaters > 0)
    {
        if (beautician.beauticianRatingModel.fltRate > 0)
        {
            self.rateView.rating = beautician.beauticianRatingModel.fltRate;
        }
        else
        {
            self.rateView.rating = 0;
        }
        
        self.lblRatersCount.text = [NSString stringWithFormat:@"(%@ %d)",RATERS, beautician.beauticianRatingModel.intRaters];
    }
    else
    {
        self.rateView.rating = 0;
        self.lblRatersCount.text = @"";
    }
    
    if (beautician.strBeauticianDescription.length > 0)
    {
        self.tvBeauticianTreatments.text = beautician.strBeauticianDescription;
    }
    else
    {
        self.tvBeauticianTreatments.text = @"";
    }
    
    if ([beautician.arrBeauticianDegrees count] == 2)
    {
        self.lblBeauticianFirstCertificate.text = beautician.arrBeauticianDegrees[0];
        self.lblBeauticianSecondCertificate.text = beautician.arrBeauticianDegrees[1];
    }
    else  if ([beautician.arrBeauticianDegrees count] == 1)
    {
        self.lblBeauticianFirstCertificate.text = beautician.arrBeauticianDegrees[0];
        self.lblBeauticianSecondCertificate.text = @"";
    }
    else
    {
        self.lblBeauticianFirstCertificate.text = @"";
        self.lblBeauticianSecondCertificate.text = @"";
    }
    
    if ([beautician.arrBeauticianTreatments count] > 0)
    {
        ///TODO: Treatments list
        
        for (int indexArrBeauticianTreatments = 0; indexArrBeauticianTreatments == [beautician.arrBeauticianTreatments count]; indexArrBeauticianTreatments++)
        {
            if (indexArrBeauticianTreatments%2 == 0 && indexArrBeauticianTreatments > 0)
            {
                self.tvBeauticianTreatments.text = [self.tvBeauticianTreatments.text stringByAppendingString:@"\n"];
            }
            self.tvBeauticianTreatments.text = [self.tvBeauticianTreatments.text stringByAppendingString:[NSString stringWithFormat:@" •%d", (int)beautician.arrBeauticianTreatments[indexArrBeauticianTreatments]]];
        }
        
    }
    else
    {
        self.tvBeauticianTreatments.text = @"";
    }
}

- (void)setupRateVeiw
{
    self.rateView = [[RateView alloc]initWithFrame:CGRectMake(0, 0, 117, 38)];
    
    self.rateView.tag = 88888;
    
    [self.vRateView addSubview:self.rateView];
    
    ///
    self.rateView.starSize = 22;
    
    self.rateView.starNormalColor = [UIColor colorWithRed:255/255.0f green:255/255.0f
                                                     blue:255/255.0 alpha:1.0];
    self.rateView.starFillColor = [UIColor colorWithRed:255/255.0f green:209/255.0f
                                                   blue:23/255.0 alpha:1.0];
    self.rateView.starBorderColor = [UIColor colorWithRed:38/255.0f green:38/255.0f
                                                     blue:38/255.0 alpha:1.0];
}

- (IBAction)btnMakeReservationTapped:(id)sender
{
    //    BAPReservationVC* reservationVC = [self.storyboard instantiateViewControllerWithIdentifier:@"BAPReservationVC"];
    //
    //    [self.navigationController pushViewController:reservationVC animated:YES];
    
}

@end
