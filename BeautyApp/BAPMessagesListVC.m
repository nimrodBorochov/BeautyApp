//
//  BAPMessagesVC.m
//  BeautyApp
//
//  Created by nimrod borochov on 9/2/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPMessagesListVC.h"
#import "BAPMessagesCell.h"
#import "BAPOrderNotificationModel.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "BAPMessagesVC.h"

static NSString* const MESSAGES_HEB = @"הודעות";

@interface BAPMessagesListVC ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableMessages;

@end

@implementation BAPMessagesListVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableMessages.dataSource = self;
    self.tableMessages.delegate = self;
    
    self.navigationItem.title = MESSAGES_HEB;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    ///TODE: REAL
    return 1;
}
// Set the Cell
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellIdentifier = @"BAPMessagesCell";
    BAPOrderNotificationModel* orderNotificationModel = [BAPOrderNotificationModel new];
    
    BAPMessagesCell* messagesCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (messagesCell == nil)
    {
        messagesCell = [[NSBundle mainBundle] loadNibNamed:@"BAPMessagesCell" owner:self options:nil][0];
    }
    
    [messagesCell setupCellWithOrderNotification:orderNotificationModel];
    
    // Take care of images in table
    NSURL * imageURL = [NSURL URLWithString:orderNotificationModel.strONBeauticianImageUrl];
    
    [messagesCell.ivBeauticianImage sd_setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"imageCell"]];
    
    return messagesCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Creating view controller to show
    BAPMessagesVC* messagesVC = [self.storyboard instantiateViewControllerWithIdentifier:@"BAPMessagesVC"];
    
    // Set view controller property
    messagesVC.orderNotificationModel = [BAPOrderNotificationModel new];
    
    // Push to MSLEmployeeProfileVC
    [self.navigationController pushViewController:messagesVC animated:YES];
    
}

    @end
