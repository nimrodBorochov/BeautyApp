//
//  BAPMessagesVC.m
//  BeautyApp
//
//  Created by nimrod borochov on 9/4/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPMessagesVC.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "RateView.h"

static NSString* const RATERS = @"מדרגים";
static NSString* const TODAY_HEB = @"היום";
static NSString* const AT_TIME_HEB = @" בשעה  ";
static NSString* const NIS_HEB = @"ש״ח";

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

@property (nonatomic, strong) RateView* rateView;

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
    
    [self setupRateVeiw];
    
    self.rateView.rating  = self.orderNotificationModel.fltONBeauticianRateAvrg;
    
    self.lblBeauticianRatersAmont.text = [NSString stringWithFormat:@"(%@ %d)", RATERS, self.orderNotificationModel.intONBeauticianRatersAmount];
    
    [self setupWhenText];
    
    ///TODO: Change to Treatments codes
    self.tvTreatmentsAsked.text = @"";
    
    self.lblTreatmentLocation.text = self.orderNotificationModel.strONTreatmentLocation;
    
    self.tvNots.text = self.orderNotificationModel.strONTreatmentNots;
    
    self.lblTreatmentPrice.text = [NSString stringWithFormat:@"%d %@", self.orderNotificationModel.intONPrice, NIS_HEB];
}

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



- (void)setupWhenText
{
    NSDate* today = [NSDate date];
    
    NSDate* dateOfMessages = [[NSDate alloc]initWithTimeIntervalSince1970:self.orderNotificationModel.timeIntervalGetOrder];
    
    BOOL istoday = [self isSameDay:today otherDay:dateOfMessages];
    
    NSString* strDayDate = @"";
    if (istoday)
    {
        strDayDate = TODAY_HEB;
    }
    else
    {
        NSDateFormatter *dayDateFormatter = [[NSDateFormatter alloc] init];
        
        [dayDateFormatter setDateFormat:@"dd/MM/yy"];
        
        strDayDate = [dayDateFormatter stringFromDate:dateOfMessages];
    }
    
    NSString* strTreatmentTime = [strDayDate stringByAppendingString:AT_TIME_HEB];
    
    NSDateFormatter *timeDateFormatter = [[NSDateFormatter alloc] init];
    
    [timeDateFormatter setDateFormat:@"- HH:mm"];
    
    strDayDate = [timeDateFormatter stringFromDate:dateOfMessages];
    
    strTreatmentTime = [strTreatmentTime stringByAppendingString:strDayDate];
    
    self.lblTreatmentTime.text = strTreatmentTime;
}

- (BOOL)isSameDay:(NSDate*)date1 otherDay:(NSDate*)date2 {
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    NSDateComponents* comp1 = [calendar components:unitFlags fromDate:date1];
    NSDateComponents* comp2 = [calendar components:unitFlags fromDate:date2];
    
    return [comp1 day]   == [comp2 day] &&
    [comp1 month] == [comp2 month] &&
    [comp1 year]  == [comp2 year];}

- (IBAction)btnAproveTapped:(id)sender
{
    
}

- (IBAction)btnRejectedTapped:(id)sender
{
    
}


@end
