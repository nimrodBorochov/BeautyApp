//
//  BACBaseVC.m
//  BeautyApp_Client
//
//  Created by Nimrod Borochov on 23/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPBaseVC.h"

@interface BAPBaseVC ()

@end

@implementation BAPBaseVC



- (void)viewDidLoad
{
    [super viewDidLoad];
}


// simple alart view
- (void)showAlartWithTitle:(NSString *)title
{
    
    UIAlertView *warningAlert = [[UIAlertView alloc] initWithTitle:@"" message:title delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [warningAlert show];
}


@end
