//
//  BAPMessagesVC.m
//  BeautyApp
//
//  Created by nimrod borochov on 9/2/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPMessagesVC.h"

static NSString* const MESSAGES_HEB = @"הודעות";

@interface BAPMessagesVC ()

@end

@implementation BAPMessagesVC

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
    
    self.navigationItem.title = MESSAGES_HEB;
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
