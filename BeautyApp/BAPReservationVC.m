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
#import "BAPTreatmentVC.h"
#import "BAPDateSelectionV.h"

@interface BAPReservationVC ()<UIGestureRecognizerDelegate, ForHowSelectionViewDelegate, WhenSelectionViewDelegate, LocationSelectionViewDelegate, TreatmentVCDelegate, DateSelectionDelegate>

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

// View's Properties
@property (strong, nonatomic) BAPForHowSelectionV* forHowSelectionV;
@property (strong, nonatomic) BAPWhenSelectionV* whenSelectionV;
@property (strong, nonatomic) BAPLocationSelectionV* locationSelectionV;
@property (strong, nonatomic) BAPDateSelectionV* dateSelectionV;

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
    
    // Init BAForHowSelectionV with title
    self.forHowSelectionV = [[BAPForHowSelectionV alloc]initWithFrame:CGRectZero Selection:self.lblHow.text];
    
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
    
    BAPTreatmentVC* treatmentVC = [self.storyboard instantiateViewControllerWithIdentifier:@"BAPTreatmentVC"];
    
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

}

#pragma mark - Views deleget methods
- (void)userSelecteForHowOption:(NSString *)option
{
    [self closeView];
    
    self.lblHow.text = option;
    
    self.vHow.backgroundColor = [UIColor greenColor];
}

- (void)userSelecteOtherHowOption
{
    [self openCommentViewWithTitle:OTHER_HEB];
}

- (void)userSelectedWhenOption:(NSString *)option
{
    [self closeView];
    
    self.lblWhen.text = option;
    
    self.vWhen.backgroundColor = [UIColor greenColor];
}

- (void)userBeginEditing
{
    [UIView animateWithDuration:0.5 animations:^{
        self.constraintCommentViewY.constant = -45;
        [self.view layoutIfNeeded];
    }];
    
}

- (void)userSelectLoctionOption:(NSString *)option
{
    [self closeView];
    
    self.lblLocation.text = option;
    
    self.vLocation.backgroundColor = [UIColor greenColor];
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

- (void)userTappedReturnBtn
{
    [self closeView];
}

- (void)didTappedSubmitTreatments:(NSString *)treatments
{
    self.lblTreatment.text = treatments;
    self.vTreatment.backgroundColor = [UIColor greenColor];
}

- (void)userSelectedOtherWhenOption
{
    self.dateSelectionV = [[BAPDateSelectionV alloc]initWithFrame:CGRectZero];
    
    self.dateSelectionV.delegate = self;
    
    [self addPropertiesToView:self.dateSelectionV];
    
//    self.strSelectedVeiw = DATE;
    
    [UIView animateWithDuration:0.5 animations:^{
        
        self.dateSelectionV.alpha = 1;
        self.dimView.alpha = 0.5;
        
    }];
}

- (void)userTappedSubmitDate:(NSString *)date
{
    [self closeView];
    self.lblWhen.text = date;
    self.vWhen.backgroundColor = [UIColor greenColor];
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
        self.dimView.alpha = 0;
        
        
    } completion:^(BOOL finished) {
        
        [self.forHowSelectionV removeFromSuperview];
        [self.whenSelectionV removeFromSuperview];
        [self.locationSelectionV removeFromSuperview];
        [self.commentsV removeFromSuperview];
        [self.dateSelectionV removeFromSuperview];
        [self.dimView removeFromSuperview];
    }];
}

@end

