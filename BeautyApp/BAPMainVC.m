//
//  BACMainVC.m
//  BeautyApp_Client
//
//  Created by Nimrod Borochov on 16/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPMainVC.h"
#import "BAPMapViewAnnotation.h"
#import "BAPStaticData.h"
#import "BAPBusinessOnMapCell.h"
#import "BAPBeauticianVC.h"
#import "BAPBeauticianSearchVC.h"
#import "BAPMenuV.h"
#import "UIView+Layout.h"
#import "BAPUserProfileVC.h"
#import "BAPUserTreatmentHistoryVC.h"
#import "BAPRegulationsCV.h"
#import "BAPWalkthroughVC.h"
#import "BAPReservationVC.h"

static NSInteger const SPACER_ITEM_WITH = 16;
static NSInteger const HEIGHT_CONTAINER_MENU = 143;

@interface BAPMainVC ()<MKMapViewDelegate, UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate, BACMenuDelegate>

// Outlets properties
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UITableView *tableBusinessOnScreen;
@property (weak, nonatomic) IBOutlet UIView *ContainerMenu;
@property (weak, nonatomic) IBOutlet UIView *dimView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintHeightMenu;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintHeightOfTable;

// Private properties
@property (strong, nonatomic) NSMutableArray* mArrBusiness;
@property (strong, nonatomic)NSMutableArray* mArrBusinessOnScreen;

@end

@implementation BAPMainVC

#pragma mark - UIViewController Life Circle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupNavigationBar];
    
    [self setupMap];
    
    [self showAnnotations];
    
    // Init mArrBusinessOnScreen
    self.mArrBusinessOnScreen = [NSMutableArray new];
    [self updateMArrBusinessOnScrenn];
    
    [self uiMenu];
    
    [self setupTableDelegate];
    
    [self addGesture];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self closeMenuWithAnimation:NO];
    
    self.constraintHeightOfTable.constant = 0;
}

#pragma mark - ViewDidLoad methods

- (void)setupNavigationBar
{
    /// Custom Menu Button
    // Set the frame with image
    UIImage *menuImage = [UIImage imageNamed:@"menuIcon.png"];
    UIButton *menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    menuButton.frame = CGRectMake(0, 0, menuImage.size.width, menuImage.size.height);
    [menuButton setImage:menuImage forState:UIControlStateNormal];
    
    // Set target method
    [menuButton addTarget:self action:@selector(menuButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    
    // Create the custom bar botton item
    UIBarButtonItem *menuBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:menuButton] ;
    
    
    
    /// Custom Beautician Search Button
    // Set the frame with image
    UIImage* beauticianSearchImage = [UIImage imageNamed:@"BeauticianSearch.png"];
    UIButton* beauticianSearchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    beauticianSearchButton.frame = CGRectMake(0, 0, beauticianSearchImage.size.width, beauticianSearchImage.size.height);
    [beauticianSearchButton setImage:beauticianSearchImage forState:UIControlStateNormal];
    
    // Set target method
    [beauticianSearchButton addTarget:self action:@selector(beauticianSearchTapped) forControlEvents:UIControlEventTouchUpInside];
    
    // Create the custom bar botton item
    UIBarButtonItem *beauticianSearchBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:beauticianSearchButton] ;
    
    /// Custom Beautician Search Button
    // Set the frame with image
    UIImage* tretmentOrderImage = [UIImage imageNamed:@"TretmentOrder.png"];
    UIButton* tretmentOrderButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    tretmentOrderButton.frame = CGRectMake(0, 0, tretmentOrderImage.size.width, tretmentOrderImage.size.height);
    [tretmentOrderButton setImage:tretmentOrderImage forState:UIControlStateNormal];
    
    // Set target method
    [tretmentOrderButton addTarget:self action:@selector(tretmentOrderTapped) forControlEvents:UIControlEventTouchUpInside];
    
    // Create the custom bar botton item
    UIBarButtonItem *tretmentOrderBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:tretmentOrderButton] ;
    
    // Create Spacer item
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    
    negativeSpacer.width = SPACER_ITEM_WITH;
    
    // Create Array wuth the button items
    NSArray *actionButtonItems = @[menuBarButtonItem, negativeSpacer, beauticianSearchBarButtonItem, negativeSpacer,tretmentOrderBarButtonItem];
    
    // Replace exist item button with custom arrButton items
    self.navigationItem.leftBarButtonItems = actionButtonItems;
}

- (void)setupMap
{
    self.mapView.mapType = MKMapTypeStandard;
    
    self.mapView.showsUserLocation = YES;
    
    self.mapView.delegate = self;
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.mapView.userLocation.coordinate, 800, 800);
    
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    
    [self.mapView setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
}

- (void)showAnnotations
{
    BAPStaticData* data = [BAPStaticData new];
    
    self.mArrBusiness = [data createStaticData];
    
    [self.mapView addAnnotations:[self createAnnotations]];
}

- (void)updateMArrBusinessOnScrenn
{
    [self.mArrBusinessOnScreen removeAllObjects];
    
    for (BAPBusiness* business in self.mArrBusiness)
    {
        //Create coordinates from the latitude and longitude values
        CLLocationCoordinate2D coord;
        coord.latitude = business.businessAdress.numBusinessLatitude;
        coord.longitude = business.businessAdress.numBusinessLongitude;
        
        if(MKMapRectContainsPoint(self.mapView.visibleMapRect, MKMapPointForCoordinate(coord)))
        {
            [self.mArrBusinessOnScreen addObject:business];
        }
    }
}

- (void)uiMenu
{
    BAPMenuV* menuV = [BAPMenuV new];
    
    menuV.translatesAutoresizingMaskIntoConstraints = NO;
    
    menuV.delegate = self;
    
    // Add to container
    [self.ContainerMenu addSubview:menuV];
    
    // fill with autolayout
    [self.ContainerMenu fillWithView:menuV];
    
    self.constraintHeightMenu.constant = 0 ;
    
    [self.view layoutIfNeeded];
}

- (void)setupTableDelegate
{
    self.tableBusinessOnScreen.dataSource = self;
    
    self.tableBusinessOnScreen.delegate = self;
}

- (void)addGesture
{
    UITapGestureRecognizer* tapDimview = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dimViewTapped)];
    
    [self.dimView addGestureRecognizer:tapDimview];
    
    tapDimview.delegate = self;
}

#pragma mark - Actions

- (void)dimViewTapped
{
    [self closeMenuWithAnimation:YES];
}

- (void)menuButtonTapped
{
    if (self.constraintHeightMenu.constant == 0)
    {
        [self showMenu];
    }
    else
    {
        [self closeMenuWithAnimation:YES];
    }
}

- (void)beauticianSearchTapped
{
    if (!self.dimView.hidden)
    {
        [self closeMenuWithAnimation:YES];
    }
    else
    {
        // Creating view controller to show
        BAPBeauticianSearchVC* beauticianSearchVC = [self.storyboard instantiateViewControllerWithIdentifier:@"BAPBeauticianSearchVC"];
        
        // Push to BACBeauticianSearchVC
        [self.navigationController pushViewController:beauticianSearchVC animated:YES];
    }
}

- (void)tretmentOrderTapped
{
    if (!self.dimView.hidden)
    {
        [self closeMenuWithAnimation:YES];
    }
    else
    {
        // Creating view controller to show
        BAPReservationVC* reservationVC = [self.storyboard instantiateViewControllerWithIdentifier:@"BAPReservationVC"];
        
        // Push to BACReservationVC
        [self.navigationController pushViewController:reservationVC animated:YES];
    }
}

- (IBAction)btnShowTableOfBusinessOnScreenTapped:(id)sender
{
    if (!self.dimView.hidden)
    {
        [self closeMenuWithAnimation:YES];
    }
    [self updateMArrBusinessOnScrenn];
    
    [self.tableBusinessOnScreen reloadData];
    
    [UIView animateWithDuration:1 animations:^{
        if (self.constraintHeightOfTable.constant == 0)
        {
            self.constraintHeightOfTable.constant = 460;
        }
        else
        {
            self.constraintHeightOfTable.constant = 0;
        }
        
        [self.view layoutIfNeeded];
    }];
}


#pragma mark - MapView delegate methods

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    
    static NSString* AnnotationIdentifier = @"Annotation";
    MKPinAnnotationView *pinView = (MKPinAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:AnnotationIdentifier];
    
    if (!pinView) {
        
        MKPinAnnotationView* customPinView = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:AnnotationIdentifier];
        
        if (annotation == self.mapView.userLocation) customPinView.image = [UIImage imageNamed:@"userLocationIcon.png"];
        //        else customPinView.image = [UIImage imageNamed:@"mySomeOtherImage.png"];
        customPinView.animatesDrop = NO;
        customPinView.canShowCallout = NO;
        return customPinView;
        
    } else {
        
        pinView.annotation = annotation;
    }
    
    return pinView;
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    BAPMapViewAnnotation *mapViewAnnotation = (BAPMapViewAnnotation *)view.annotation;
    
    BAPBeauticianVC *beauticianVC = [self.storyboard instantiateViewControllerWithIdentifier:@"BAPBeauticianVC"];
    
    for (BAPBusiness* business in self.mArrBusinessOnScreen)
    {
        /// TODO: change to id
        if ([business.strBusinessName isEqualToString:mapViewAnnotation.title]) {
            beauticianVC.business = business;
        }
    }
    
    [self.navigationController pushViewController:beauticianVC animated:YES];
    
    
    
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    /// TODO: take care about ifim :)
    [self updateMArrBusinessOnScrenn];
}

/// DEMO DATA ///
- (NSMutableArray *)createAnnotations
{
    NSMutableArray *annotations = [[NSMutableArray alloc] init];
    
    for (BAPBusiness* business in self.mArrBusiness)
    {
        //Create coordinates from the latitude and longitude values
        CLLocationCoordinate2D coord;
        coord.latitude = business.businessAdress.numBusinessLatitude;
        coord.longitude = business.businessAdress.numBusinessLongitude;
        
        BAPMapViewAnnotation *annotation = [[BAPMapViewAnnotation alloc] initWithTitle:business.strBusinessName AndCoordinate:coord];
        
        [annotations addObject:annotation];
    }
    
    return annotations;
}

#pragma mark - Table methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.mArrBusinessOnScreen.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BAPBusinessOnMapCell* businessOnMapCell = [tableView dequeueReusableCellWithIdentifier:@"businessOnMapCell"];
    
    if (!businessOnMapCell)
    {
        businessOnMapCell = [[NSBundle mainBundle] loadNibNamed:@"BAPBusinessOnMapCell" owner:self options:nil][0];
    }
    
    NSString* strBusinessName = ((BAPBusiness *)self.mArrBusinessOnScreen[indexPath.row]).strBusinessName;
    
    NSString* strBusinessAdress = ((BAPBusiness *)self.mArrBusinessOnScreen[indexPath.row]).strBusinessFullAdress;
    
    int numberOfstrRaters = [((BAPBusiness *)self.mArrBusinessOnScreen[indexPath.row]).businessRating.numBusinessRaters intValue];
    
    UIImage* imageOfBusiness = ((BAPBusiness *)self.mArrBusinessOnScreen[indexPath.row]).imageOfBusines;
    
    int numberBusinessRateAverage = [((BAPBusiness *)self.mArrBusinessOnScreen[indexPath.row]).businessRating.numBusinessRateAverage intValue];
    
    NSString* strFirstCertificate = ((BAPBusiness *)self.mArrBusinessOnScreen[indexPath.row]).strBeauticianFirstCertificate;
    
    NSString* strSecondCertificate = ((BAPBusiness *)self.mArrBusinessOnScreen[indexPath.row]).strBeauticianSecondCertificate;
    
    [businessOnMapCell setUpCellWithBusinesName:strBusinessName adress:strBusinessAdress firstCertificate:strFirstCertificate secondCertificate:strSecondCertificate andRating:numberBusinessRateAverage andRaters:numberOfstrRaters andImage:imageOfBusiness];
    
    return businessOnMapCell;
}

// Handel selection at row
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Creating view controller to show
    BAPBeauticianVC* beauticianVC = [self.storyboard instantiateViewControllerWithIdentifier:@"BAPBeauticianVC"];
    
    // Set view controller property
    beauticianVC.business = self.mArrBusinessOnScreen[indexPath.row];
    
    // Push to MSLEmployeeProfileVC
    [self.navigationController pushViewController:beauticianVC animated:YES];
}

#pragma mark - Menu Appearance

- (void)closeMenuWithAnimation:(BOOL)animation
{
    if (animation)
    {
        [UIView animateWithDuration:0.3 animations:^{
            
            self.constraintHeightMenu.constant = 0;
            
            self.dimView.alpha = 0;
            
            [self.view layoutIfNeeded];
            
        } completion:^(BOOL finished) {
            
            self.dimView.hidden = YES;
            
        }];
        
        return;
    }
    self.constraintHeightMenu.constant = 0;
    self.dimView.hidden = YES;
}

- (void)showMenu
{
    self.dimView.alpha = 0;
    self.dimView.hidden = NO;
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.constraintHeightMenu.constant = HEIGHT_CONTAINER_MENU;
        self.dimView.alpha = 0.5;
        
        [self.view layoutIfNeeded];
        
    }];
}

#pragma mark - BACMenuDelegate action methods
- (void)userTappdPersonalInfo
{
    // Creating view controller to show
    BAPUserProfileVC* userProfileVC = [self.storyboard instantiateViewControllerWithIdentifier:@"BAPUserProfileVC"];
    
    // Push to BACUserProfileVC
    [self.navigationController pushViewController:userProfileVC animated:YES];
}

- (void)userTappdTreatmentHistory
{
    // Creating view controller to show
    BAPUserTreatmentHistoryVC* userTreatmentHistoryVC = [self.storyboard instantiateViewControllerWithIdentifier:@"BAPUserTreatmentHistoryVC"];
    
    // Push to BACUserTreatmentHistoryVC
    [self.navigationController pushViewController:userTreatmentHistoryVC animated:YES];
}

- (void)userTappdExplanation
{
    // Creating view controller to show
    BAPWalkthroughVC* walkthroughVC = [self.storyboard instantiateViewControllerWithIdentifier:@"BAPWalkthroughVC"];
    
    // Present BACWalkthroughVC
    [self presentViewController:walkthroughVC animated:YES completion:nil];
}

- (void)userTappdRegulations
{
    // Creating view controller to show
    BAPRegulationsCV* regulationsCV = [self.storyboard instantiateViewControllerWithIdentifier:@"BAPRegulationsCV"];
    
    // Push to BACRegulationsCV
    [self.navigationController pushViewController:regulationsCV animated:YES];
}
@end


