//
//  BACSearchResultsBeauticianVC.m
//  BeautyApp_Client
//
//  Created by Nimrod Borochov on 23/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPBeauticianSearchResultsVC.h"
#import "BAPBusinessOnMapCell.h"

@interface BAPBeauticianSearchResultsVC ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *lblResultsAmount;
@property (weak, nonatomic) IBOutlet UITableView *tableBeautiResults;

@end

@implementation BAPBeauticianSearchResultsVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - Table methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BAPBusinessOnMapCell* businessOnMapCell = [tableView dequeueReusableCellWithIdentifier:@"businessOnMapCell"];
    
    if (!businessOnMapCell)
    {
        businessOnMapCell = [[NSBundle mainBundle] loadNibNamed:@"BAPBusinessOnMapCell" owner:self options:nil][0];
    }
    
    
    
//    NSString* strBusinessName = @"";
//    
//    NSString* strBusinessAdress = @"";
//    
//    int numberOfstrRaters = 0;
//    
//    UIImage* imageOfBusiness = [UIImage imageNamed:@""];
//    
//    int numberBusinessRateAverage = 0;
//    
//    NSString* strFirstCertificate = @"";
//    
//    NSString* strSecondCertificate = @"";
    
//    [businessOnMapCell setUpCellWithBusinesName:strBusinessName adress:strBusinessAdress firstCertificate:strFirstCertificate secondCertificate:strSecondCertificate andRating:numberBusinessRateAverage andRaters:numberOfstrRaters andImage:imageOfBusiness];
    
    return businessOnMapCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
}


@end
