//
//  BACRegulationsCV.m
//  BeautyApp_Client
//
//  Created by nimrod borochov on 7/30/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPRegulationsVC.h"

static NSString* const REGULATIONS_HEB = @"תקנון";

@interface BAPRegulationsVC ()

@property (weak, nonatomic) IBOutlet UITextView *tvRegulations;

@end

@implementation BAPRegulationsVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = REGULATIONS_HEB;
}

@end
