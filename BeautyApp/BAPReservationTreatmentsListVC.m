//
//  BACTreatmentVC.m
//  BeautyApp_Client
//
//  Created by Nimrod Borochov on 14/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPReservationTreatmentsListVC.h"
#import "BAPTreatmentCell.h"

static NSString* const SELECT_TREATMENT_HEB = @"בחר טיפול";

@interface BAPReservationTreatmentsListVC ()<UITableViewDataSource, UITableViewDelegate, TreatmentCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableTreatments;

@property (strong, nonatomic) NSArray* arrOfTreatments;
@property (strong, nonatomic) NSString* strTreatments;

@property (strong, nonatomic) NSMutableArray* mArrTreatmentCell;

@end

@implementation BAPReservationTreatmentsListVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableTreatments.dataSource = self;
    self.tableTreatments.delegate = self;
    
    self.navigationItem.title = SELECT_TREATMENT_HEB;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;//self.arrOfTreatments.count;
}

// Set the Cell
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    BAPTreatmentCell* treatmentTableCell = [tableView dequeueReusableCellWithIdentifier:@"BAPTreatmentCell"];
    
    if (!treatmentTableCell)
    {
        treatmentTableCell = [[NSBundle mainBundle] loadNibNamed:@"BAPTreatmentCell" owner:self options:nil][0];
    }
    
    treatmentTableCell.delegate = self;
    
    // Set the cell title for each row
    treatmentTableCell.lblTitleInTreatmentCell.text = @"טיפול";
    
    return treatmentTableCell;
}


- (void)didTappedTreatmentInfoWithTitle:(NSString *)title
{
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:title
                                                      message:@"הסבר על טיפול"
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    
    [message show];
//    [self openCommentViewWithTitle:title];
}

- (IBAction)SubmitTreatmentTapped:(id)sender
{
    [self updateStrTreatments];
    
    [self.delegate didTappedSubmitTreatmentsString:self.strTreatments treatmentMArray:self.mArrTreatmentCell];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)updateStrTreatments
{
    self.strTreatments = @"";
    
    NSMutableArray* mArrAllTreatmentsCell = [[NSMutableArray alloc] init];
    
    self.mArrTreatmentCell = [[NSMutableArray alloc] init];
    
    [self.mArrTreatmentCell removeAllObjects];
    
    for (NSInteger j = 0; j < [self.tableTreatments numberOfSections]; ++j)
    {
        for (NSInteger i = 0; i < [self.tableTreatments numberOfRowsInSection:j]; ++i)
        {
            [mArrAllTreatmentsCell addObject:[self.tableTreatments cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:j]]];
        }
    }
    
    for (BAPTreatmentCell *treatmentCell in mArrAllTreatmentsCell)
    {
        if ([treatmentCell.lblNumberOfTreatmentInAsk.text intValue] > 0)
        {
            self.strTreatments = [self.strTreatments stringByAppendingString:[NSString stringWithFormat:@"%@ (%@),  ", treatmentCell.lblTitleInTreatmentCell.text , treatmentCell.lblNumberOfTreatmentInAsk.text]];
            
            [self.mArrTreatmentCell addObject:treatmentCell];
        }
    }
    
    if ([self.strTreatments length] > 0) {
        self.strTreatments = [self.strTreatments substringToIndex:[self.strTreatments length] - 3];
    }
    NSLog(@"%@", self.strTreatments);
}
@end
