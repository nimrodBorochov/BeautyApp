//
//  BAPTreatmentListVC.m
//  BeautyApp
//
//  Created by nimrod borochov on 9/7/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPPendingTreatmentListVC.h"
#import "BAPPendingTreatmentListCell.h"
#import "BAPOrderNotificationModel.h"
#import "BAPReservationVC.h"
#import "BAPPendingTreatmentVC.h"

static NSString* const TREATMENTS_HEB = @"טיפולים";

@interface BAPPendingTreatmentListVC ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tablePendingTreatment;

@end

@implementation BAPPendingTreatmentListVC


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tablePendingTreatment.dataSource = self;
    self.tablePendingTreatment.delegate = self;
    
    [self setupNavigation];
}

- (void)setupNavigation
{
    self.navigationItem.title = TREATMENTS_HEB;
    
    /// Custom Beautician tretment Button
    // Set the frame with image
    UIImage* tretmentOrderImage = [UIImage imageNamed:@"TretmentOrder.png"];
    UIButton* tretmentOrderButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    tretmentOrderButton.frame = CGRectMake(0, 0, tretmentOrderImage.size.width, tretmentOrderImage.size.height);
    [tretmentOrderButton setImage:tretmentOrderImage forState:UIControlStateNormal];
    
    // Set target method
    [tretmentOrderButton addTarget:self action:@selector(tretmentOrderButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    
    // Create the custom bar botton item
    UIBarButtonItem *tretmentOrderButtonItem = [[UIBarButtonItem alloc] initWithCustomView:tretmentOrderButton] ;
    
    self.navigationItem.rightBarButtonItem = tretmentOrderButtonItem;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    ///TODE: REAL
    return 1;
}

// Set the Cell
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellIdentifier = @"BAPPendingTreatmentListCell";
    BAPOrderNotificationModel* orderNotificationModel = [BAPOrderNotificationModel new];
    
    BAPPendingTreatmentListCell* pendingTreatmentListCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (pendingTreatmentListCell == nil)
    {
        pendingTreatmentListCell = [[NSBundle mainBundle] loadNibNamed:@"BAPPendingTreatmentListCell" owner:self options:nil][0];
    }
    
    [pendingTreatmentListCell setupCellWithOrderNotification:orderNotificationModel];
    return pendingTreatmentListCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Creating view controller to show
    BAPPendingTreatmentVC* pendingTreatmentVC = [self.storyboard instantiateViewControllerWithIdentifier:@"BAPPendingTreatmentVC"];

    // Set view controller property
    pendingTreatmentVC.orderNotificationModel = [BAPOrderNotificationModel new];

    // Push to MSLEmployeeProfileVC
    [self.navigationController pushViewController:pendingTreatmentVC animated:YES];

}

- (void)tretmentOrderButtonTapped
{
    // Creating view controller to show
    BAPReservationVC* reservationVC = [self.storyboard instantiateViewControllerWithIdentifier:@"BAPReservationVC"];
   
    // Push to MSLEmployeeProfileVC
       [self.navigationController pushViewController:reservationVC animated:YES];
}

@end