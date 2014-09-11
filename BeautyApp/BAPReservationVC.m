//
//  BACReservationVC.m
//  BeautyApp_Client
//
//  Created by Nimrod Borochov on 14/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPReservationVC.h"
#import "BAPForHowSelectionV.h"
#import "BAPWhenSelectionV.h"
#import "BAPLocationSelectionV.h"
#import "BAPReservationTreatmentsListVC.h"
#import "BAPDateSelectionV.h"
#import "BAPGroupPeopleAmountV.h"
#import "BAPGetOrderIdByPostReservation.h"
#import "BAPOrderTreatmenFeed.h"

static NSString *const FOR_HOW_HEB = @"עבור";
static NSString *const FOR_ME_HEB = @"עבורי";
static NSString *const GROUP_HEB = @"קבוצה";

@interface BAPReservationVC ()<UIGestureRecognizerDelegate, ForHowSelectionViewDelegate, WhenSelectionViewDelegate, LocationSelectionViewDelegate, TreatmentVCDelegate, DateSelectionDelegate, GroupPeopleAmountDelegate>

// Outlets Properties
@property (weak, nonatomic) IBOutlet UIView *vHow;
@property (weak, nonatomic) IBOutlet UILabel *lblHow;
@property (weak, nonatomic) IBOutlet UIView *vWhen;
@property (weak, nonatomic) IBOutlet UILabel *lblWhen;
@property (weak, nonatomic) IBOutlet UIView *vTreatment;
@property (weak, nonatomic) IBOutlet UILabel *lblTreatment;
@property (weak, nonatomic) IBOutlet UIView *vLocation;
@property (weak, nonatomic) IBOutlet UILabel *lblLocation;
@property (weak, nonatomic) IBOutlet UIView *vComments;
@property (weak, nonatomic) IBOutlet UILabel *lblcomments;
@property (weak, nonatomic) IBOutlet UIView *vInvitation;

// Private Property
@property (strong, nonatomic) NSString* strSelectedVeiw;
@property (strong, nonatomic) NSArray* arrTreatments;
@property (strong, nonatomic) NSDate* dateTreatment;

@property (strong, nonatomic) BAPOrderTreatmenFeed* OrderTreatmenFeed;

// View's Properties
@property (strong, nonatomic) BAPForHowSelectionV* forHowSelectionV;
@property (strong, nonatomic) BAPWhenSelectionV* whenSelectionV;
@property (strong, nonatomic) BAPLocationSelectionV* locationSelectionV;
@property (strong, nonatomic) BAPDateSelectionV* dateSelectionV;
@property (strong, nonatomic) BAPGroupPeopleAmountV* groupPeopleAmountV;

@end

@implementation BAPReservationVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addTapGestures];
    
//    [self initDimView];
}

#pragma mark - Action

- (void)howViewTapped
{
    [self dimerViewAction];
    
    NSString* strSelection;
    NSString *prefix = nil;
    
    if ([self.lblHow.text length] >= 5)
    {
        prefix = [self.lblHow.text substringToIndex:5];
    }
    else
    {
        prefix = self.lblHow.text;
    }
    
    if ([self.lblHow.text isEqualToString:FOR_HOW_HEB])
    {
        strSelection = FOR_HOW_HEB;
    }
    else if ([self.lblHow.text isEqualToString:FOR_ME_HEB])
    {
        strSelection = FOR_ME_HEB;
    }
    else if ([prefix isEqualToString:GROUP_HEB])
    {
        strSelection = GROUP_HEB;
    }
    else
    {
        strSelection = OTHER_HEB;
    }
    
    // Init BAForHowSelectionV with title
    self.forHowSelectionV = [[BAPForHowSelectionV alloc]initWithFrame:CGRectZero Selection:strSelection];
    
    // Set subview delegate as self
    self.forHowSelectionV.delegate = self;
    
    [self addPropertiesToView:self.forHowSelectionV];
    
    // Update selection string
    self.strSelectedVeiw = HOW;
    
    [UIView animateWithDuration:0.5 animations:^{
        
        // Animation To Show Subview
        self.forHowSelectionV.alpha = 1;
        self.dimView.alpha = 0.5;
        
    }];
}

- (void)whenViewTapped
{
    [self dimerViewAction];
    
    // Init BAWhenSelectionV with title
    self.whenSelectionV = [[BAPWhenSelectionV alloc]initWithFrame:CGRectZero Selection:self.lblWhen.text];
    
    // Set subview delegate as self
    self.whenSelectionV.delegate = self;
    
    [self addPropertiesToView:self.whenSelectionV];
    
    self.strSelectedVeiw = WHEN;
    
    [UIView animateWithDuration:0.5 animations:^{
        
        self.whenSelectionV.alpha = 1;
        self.dimView.alpha = 0.5;
    }];
}

- (void)treatmentViewTapped
{
    
    BAPReservationTreatmentsListVC* treatmentVC = [self.storyboard instantiateViewControllerWithIdentifier:@"BAPReservationTreatmentsListVC"];
    
    treatmentVC.delegate = self;
    
    [self.navigationController pushViewController:treatmentVC animated:YES];
}

- (void)locationViewTapped
{
    [self dimerViewAction];
    
    self.locationSelectionV = [[BAPLocationSelectionV alloc]initWithFrame:CGRectZero Selection:self.lblLocation.text];
    
    self.locationSelectionV.delegate = self;
    
    [self addPropertiesToView:self.locationSelectionV];
    
    self.strSelectedVeiw = LOCATION;
    
    [UIView animateWithDuration:0.5 animations:^{
        
        self.locationSelectionV.alpha = 1;
        self.dimView.alpha = 0.5;
        
    }];
}

- (void)commentsViewTapped
{
    
    [self openCommentViewWithTitle:COMMENT_HEB];
    
    self.strSelectedVeiw = COMMENT;
    
}

- (void)invitationViewTapped
{
    // Creates Variable to chek if there is a text to search
    NSString *textValueForHow = [self.lblHow.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *textValueWhen = [self.lblWhen.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *textValueTreatment = [self.lblTreatment.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *textValueLocation = [self.lblLocation.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if ([textValueForHow length] == 0 ||  [textValueWhen length] == 0 ||  [textValueTreatment length] == 0 ||  [textValueLocation length] == 0)
    {
        [self showAlartWithTitle:@"חסר מידע"];
    }
    else
    {
        BAPGetOrderIdByPostReservation* getOrderIdByPostReservation = [BAPGetOrderIdByPostReservation new];
        
        self.OrderTreatmenFeed = [BAPOrderTreatmenFeed new];
        
        
        ///TODO: Uid and treatmentCode
        [getOrderIdByPostReservation getOrderIdForUserId:@"Bo&^rK33o" reservationFor:self.lblHow.text reservationDate:[self.dateTreatment timeIntervalSince1970] reservationLocation:self.lblLocation.text reservationComments:self.lblcomments.text reservationTreatments:self.arrTreatments successBlock:^(id jsonObject) {
            
            self.OrderTreatmenFeed = jsonObject;
            
            self.reservationOn = YES;
            
            [self.navigationController popToRootViewControllerAnimated:YES];
            
            
        } failerBlock:^(NSError *error) {
            
            NSLog(@"Error getjson:%@", error);
            
        }];
        
    }
    
}

#pragma mark - SubViews deleget methods

// How view
- (void)userSelecteForMeHowOption:(NSString *)option
{
    [self closeView];
    
    self.lblHow.text = option;
    
    self.vHow.backgroundColor = [UIColor greenColor];
}

-(void)userSelecteForGroupHowOption
{
    self.groupPeopleAmountV = [[BAPGroupPeopleAmountV alloc]initWithFrame:CGRectZero];
    
    self.groupPeopleAmountV.delegate = self;
    
    [self addPropertiesToView:self.groupPeopleAmountV];
    
    [UIView animateWithDuration:0.5 animations:^{
        
        self.groupPeopleAmountV.alpha = 1;
        self.dimView.alpha = 0.5;
        
    }];
}

- (void)userSelecteOtherHowOption
{
    [self openCommentViewWithTitle:OTHER_HEB];
}

// When view
- (void)userSelectedWhenOption:(NSString *)option
{
    [self closeView];
    
    self.lblWhen.text = option;
    
    self.vWhen.backgroundColor = [UIColor greenColor];
}

- (void)userSelectedOtherWhenOption
{
    self.dateSelectionV = [[BAPDateSelectionV alloc]initWithFrame:CGRectZero];
    
    self.dateSelectionV.delegate = self;
    
    [self addPropertiesToView:self.dateSelectionV];
    
    [UIView animateWithDuration:0.5 animations:^{
        
        self.dateSelectionV.alpha = 1;
        self.dimView.alpha = 0.5;
        
    }];
}

// Tretment view
- (void)didTappedSubmitTreatmentsString:(NSString *)strTreatments treatmentMArray:(NSMutableArray *)mArrTreatment
{
    self.lblTreatment.text = strTreatments;
    self.vTreatment.backgroundColor = [UIColor greenColor];
    self.arrTreatments = [NSArray arrayWithArray:mArrTreatment];
}

// Loction view
- (void)userSelectLoctionOption:(NSString *)option
{
    [self closeView];
    
    self.lblLocation.text = option;
    
    self.vLocation.backgroundColor = [UIColor greenColor];
}

// Comment View
- (void)userBeginEditing
{
    [UIView animateWithDuration:0.5 animations:^{
        self.constraintCommentViewY.constant = -45;
        [self.view layoutIfNeeded];
    }];
    
}

- (void)userTappedReturnBtn
{
    [self closeView];
}

- (void)userTappedSubmitComment:(NSString *)comment
{
    [self closeView];
    
    if ([self.strSelectedVeiw isEqualToString:HOW])
    {
        self.lblHow.text = comment;
        
        self.vHow.backgroundColor = [UIColor greenColor];
    }
    else if ([self.strSelectedVeiw isEqualToString:WHEN])
    {
        self.lblWhen.text = comment;
        
        self.vWhen.backgroundColor = [UIColor greenColor];
    }
    else if ([self.strSelectedVeiw isEqualToString:LOCATION])
    {
        self.lblLocation.text = comment;
        
        self.vLocation.backgroundColor = [UIColor greenColor];
    }
    else if ([self.strSelectedVeiw isEqualToString:COMMENT])
    {
        self.lblcomments.text = comment;
        
        self.vComments.backgroundColor = [UIColor greenColor];
    }
}

// Group Amount view
-(void)userSelectGroupPeopleAmount:(NSString *)amount
{
    [self closeView];
    self.lblHow.text = amount;
    self.vHow.backgroundColor = [UIColor greenColor];
}

// When selection view
- (void)userTappedSubmitDateString:(NSString *)StrDate date:(NSDate *)date
{
    [self closeView];
    self.lblWhen.text = StrDate;
    self.vWhen.backgroundColor = [UIColor greenColor];
    self.dateTreatment = date;
}


#pragma mark - Private methods

- (void)addTapGestures
{
    UITapGestureRecognizer* tapHowView = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(howViewTapped)];
    
    [self.vHow addGestureRecognizer:tapHowView];
    
    tapHowView.delegate = self;
    
    UITapGestureRecognizer* tapWhenView = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(whenViewTapped)];
    
    [self.vWhen addGestureRecognizer:tapWhenView];
    
    tapWhenView.delegate = self;
    
    UITapGestureRecognizer* tapTreatmentView = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(treatmentViewTapped)];
    
    [self.vTreatment addGestureRecognizer:tapTreatmentView];
    
    tapTreatmentView.delegate = self;
    
    UITapGestureRecognizer* tapLocationView = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(locationViewTapped)];
    
    [self.vLocation addGestureRecognizer:tapLocationView];
    
    tapLocationView.delegate = self;
    
    UITapGestureRecognizer* tapCommentsView = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(commentsViewTapped)];
    
    [self.vComments addGestureRecognizer:tapCommentsView];
    
    tapCommentsView.delegate = self;
    
    UITapGestureRecognizer* tapInvitationView = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(invitationViewTapped)];
    
    [self.vInvitation addGestureRecognizer:tapInvitationView];
    
    tapInvitationView.delegate = self;
}

- (void)addPropertiesToView:(UIView *)view
{
    view.translatesAutoresizingMaskIntoConstraints = NO;
    view.alpha = 0;
    [self.view addSubview:view];
    
    [self.view centerWithView:view width:view.frame.size.width height:view.frame.size.height];
}

- (void)closeView
{
    [UIView animateWithDuration:0.5 animations:^{
        
        self.forHowSelectionV.alpha = 0;
        self.whenSelectionV.alpha = 0;
        self.locationSelectionV.alpha = 0;
        self.commentsV.alpha = 0;
        self.dateSelectionV.alpha = 0;
        self.groupPeopleAmountV.alpha = 0;
        
        self.dimView.alpha = 0;
        
        
        
    } completion:^(BOOL finished) {
        
        [self.forHowSelectionV removeFromSuperview];
        [self.whenSelectionV removeFromSuperview];
        [self.locationSelectionV removeFromSuperview];
        [self.commentsV removeFromSuperview];
        [self.dateSelectionV removeFromSuperview];
        [self.groupPeopleAmountV removeFromSuperview];
        [self.dimView removeFromSuperview];
    }];
}

@end

