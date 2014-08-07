//
//  BACTreatmentVC.m
//  BeautyApp_Client
//
//  Created by Nimrod Borochov on 14/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPTreatmentVC.h"
#import "BAPTreatmentCell.h"

static NSString* const SELECT_TREATMENT_HEB = @"בחר טיפול";

@interface BAPTreatmentVC ()<UITableViewDataSource, UITableViewDelegate, TreatmentCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableTreatments;

@property (strong, nonatomic) NSArray* arrOfTreatments;
@property (strong, nonatomic) NSString* strTreatments;

@end

@implementation BAPTreatmentVC

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
    
    BAPTreatmentCell* treatmentTableCell = [tableView dequeueReusableCellWithIdentifier:@"BACTreatmentTVC"];
    
    if (!treatmentTableCell)
    {
        treatmentTableCell = [[NSBundle mainBundle] loadNibNamed:@"BACTreatmentTVC" owner:self options:nil][0];
    }
    
    treatmentTableCell.delegate = self;
    
    // Set the cell title for each row
    treatmentTableCell.lblTitleInTreatmentCell.text = @"טיפול";
    
    return treatmentTableCell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    [self.delegate didTappedSubmitTreatments:self.strTreatments];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)updateStrTreatments
{
    self.strTreatments = @"";
    
    NSMutableArray *cells = [[NSMutableArray alloc] init];
    for (NSInteger j = 0; j < [self.tableTreatments numberOfSections]; ++j)
    {
        for (NSInteger i = 0; i < [self.tableTreatments numberOfRowsInSection:j]; ++i)
        {
            [cells addObject:[self.tableTreatments cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:j]]];
        }
    }
    
    for (BAPTreatmentCell *cell in cells)
    {
        if ([cell.lblNumberOfTreatmentInAsk.text intValue] > 0)
        {
            self.strTreatments = [self.strTreatments stringByAppendingString:[NSString stringWithFormat:@"%@ (%@),  ", cell.lblTitleInTreatmentCell.text , cell.lblNumberOfTreatmentInAsk.text]];
        }
    }
    if ([self.strTreatments length] > 0) {
        self.strTreatments = [self.strTreatments substringToIndex:[self.strTreatments length] - 3];
    }
    NSLog(@"%@", self.strTreatments);
}
@end
