//
//  BAPVerificationVC.m
//  BeautyApp
//
//  Created by nimrod borochov on 9/18/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPVerificationVC.h"

const int TIMER_STARTIN_SECONDS = 120;

@interface BAPVerificationVC ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtVerificationCode;
@property (weak, nonatomic) IBOutlet UILabel *lblCountdown;

@property (strong, nonatomic) NSTimer* countdownTimer;
@property (nonatomic       ) int secondsCount;
@end

@implementation BAPVerificationVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.txtVerificationCode.delegate = self;
    
    [self setTimer];
}

- (void)setTimer
{
    self.secondsCount = TIMER_STARTIN_SECONDS;
    
    self.countdownTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
}

- (void)timerRun
{
    self.secondsCount--;
    
    int minuts = self.secondsCount / 60;
    int seconds = self.secondsCount - (minuts * 60);
    
    NSString* timerOutput = [NSString stringWithFormat:@"%2d:%.2d", minuts, seconds];
    self.lblCountdown.text = timerOutput;
    
    if (self.secondsCount == 0)
    {
        [self.countdownTimer invalidate];
        self.countdownTimer = nil;
    }
}


- (IBAction)btnContinueTapped:(id)sender
{
    if (selc.secondsCount == 0)
    {
        return;
    }
    
    
    
}

- (IBAction)btnNewCodeTapped:(id)sender
{
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

@end
