//
//  BACSearchResultsBeauticianVC.m
//  BeautyApp_Client
//
//  Created by Nimrod Borochov on 23/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPBeauticianSearchResultsVC.h"
#import "BAPBusinessOnMapCell.h"
#import "BAPBeauticianVC.h"

@interface BAPBeauticianSearchResultsVC ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *lblResultsAmount;
@property (weak, nonatomic) IBOutlet UITableView *tableBeautiResults;

@end

@implementation BAPBeauticianSearchResultsVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableBeautiResults.dataSource = self;
    
    self.tableBeautiResults.delegate = self;
}

#pragma mark - Table methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.beauticiansArrayFeed.arrBeauticiansModel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BAPBusinessOnMapCell* businessOnMapCell = [tableView dequeueReusableCellWithIdentifier:@"businessOnMapCell"];
    
    if (!businessOnMapCell)
    {
        businessOnMapCell = [[NSBundle mainBundle] loadNibNamed:@"BAPBusinessOnMapCell" owner:self options:nil][0];
    }
    // Take care of images in table
    NSURL * imageURL = [NSURL URLWithString:((BAPBeauticianModel *)self.beauticiansArrayFeed.arrBeauticiansModel[indexPath.row]).strBeauticianImageURL];
    
    [businessOnMapCell.ivBusinesImage sd_setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"imageCell"]];

    
    NSString* strBusinessName = ((BAPBeauticianModel *)self.beauticiansArrayFeed.arrBeauticiansModel[indexPath.row]).strBeauticianName;
    
    NSString* strBusinessCity = ((BAPBeauticianModel *)self.beauticiansArrayFeed.arrBeauticiansModel[indexPath.row]).beauticianAdressModel.strBeauticianCity;
    
    NSString* strBusinessStreet = ((BAPBeauticianModel *)self.beauticiansArrayFeed.arrBeauticiansModel[indexPath.row]).beauticianAdressModel.strBeauticianStreet;
    
    int numberOfstrRaters = ((BAPBeauticianModel *)self.beauticiansArrayFeed.arrBeauticiansModel[indexPath.row]).beauticianRatingModel.intRaters;
    
    float numberBusinessRateAverage = ((BAPBeauticianModel *)self.beauticiansArrayFeed.arrBeauticiansModel[indexPath.row]).beauticianRatingModel.fltRate;
    
    [businessOnMapCell setUpCellWithBusinesName:strBusinessName city:strBusinessCity street:strBusinessStreet andRating:numberBusinessRateAverage andRaters:numberOfstrRaters];
    
    return businessOnMapCell;
}


// Handel selection at row
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // Creating view controller to show
    BAPBeauticianVC* beauticianVC = [self.storyboard instantiateViewControllerWithIdentifier:@"BAPBeauticianVC"];
    
    // Set view controller property
    beauticianVC.beauticianModel = self.beauticiansArrayFeed.arrBeauticiansModel[indexPath.row];
    
    // Push to MSLEmployeeProfileVC
    [self.navigationController pushViewController:beauticianVC animated:YES];
    
}


@end
