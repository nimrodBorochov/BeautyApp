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
#import "BAPBeauticiansLocationFeed.h"
#import "BAPGetBeauticiansLocationByPostCoordinates.h"
#import "BAPBeauticianLocationModel.h"

static NSInteger const SPACER_ITEM_WITH = 16;
static NSInteger const HEIGHT_CONTAINER_MENU = 143;
static long const MAPVIEW_DIV_FACTOR = 1.4375;
static NSInteger const MAPVIEW_HEIGHT_4I = 460;

@interface BAPMainVC ()<MKMapViewDelegate, UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate, BACMenuDelegate, CLLocationManagerDelegate>

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

@property (strong, nonatomic) NSMutableArray* mArrbeauticiansLocation;
@property (strong, nonatomic) NSMutableArray* mArrbeauticiansLocationOnScreen;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLLocation *startLocation;

@property (strong, nonatomic) BAPBeauticiansLocationFeed* beauticiansLocationFeed;
//@property (strong, nonatomic) BAPGetBeauticiansLocationByPostCoordinates* getBeauticiansLocationByPostCoordinates;

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
    
    self.mArrbeauticiansLocationOnScreen = [NSMutableArray new];
    [self updateMArrBusinessOnScrenn];
    
    [self uiMenu];
    
    [self setupTableDelegate];
    
    [self addGesture];
}

- (void)viewWillDisappear:(BOOL)animated
{
    /// Close appering subviews when exit from view
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
    
    // Create Array with the button items
    NSArray *actionButtonItems = @[menuBarButtonItem, negativeSpacer, beauticianSearchBarButtonItem, negativeSpacer,tretmentOrderBarButtonItem];
    
    // Replace exist item button with custom arrButton items
    self.navigationItem.leftBarButtonItems = actionButtonItems;
}

- (void)setupMap
{
    [self updateUserLocation];
    // Make view as delegate
    self.mapView.delegate = self;
    
    // Set the map type
    self.mapView.mapType = MKMapTypeStandard;
    
    // Make user location visible
    self.mapView.showsUserLocation = YES;
    
    // set traking mode for the user
    [self.mapView setUserTrackingMode:MKUserTrackingModeFollow animated:NO];
    
    // Set region around user
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.startLocation.coordinate, MAPVIEW_HEIGHT_4I / 8, MAPVIEW_HEIGHT_4I / 8 / MAPVIEW_DIV_FACTOR);
    
    // set the map view with the region
    [self.mapView setRegion:region animated:YES];
}

- (void)updateUserLocation
{
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.delegate = self;
    [self.locationManager startUpdatingLocation];
    self.startLocation = self.locationManager.location;
}
#pragma mark CLLocationManagerDelegate


/// Whit for WS ///
- (void)showAnnotations
{
    BAPStaticData* data = [BAPStaticData new];
    
    self.mArrBusiness = [data createStaticData];
    
    [self.mapView addAnnotations:[self createAnnotations]];
//    CLLocation* currentLocation;
//    
//    if (self.mapView.userLocation.location.coordinate.latitude != 0)
//    {
//        currentLocation = self.mapView.userLocation.location;
//    }
//    else
//    {
//        currentLocation = self.startLocation;
//    }
//    
//    ///TODO: Replace mokdata with web service
//    BAPGetBeauticiansLocationByPostCoordinates* getBeauticiansLocationByPostCoordinates;
//    
//    self.beauticiansLocationFeed = [BAPBeauticiansLocationFeed new];
//    getBeauticiansLocationByPostCoordinates = [BAPGetBeauticiansLocationByPostCoordinates new];
//    
//    [getBeauticiansLocationByPostCoordinates getBeauticiansLocationForLatitude:currentLocation.coordinate.latitude longitude:currentLocation.coordinate.longitude successBlock:^(id jsonObject) {
//        
//        self.beauticiansLocationFeed = jsonObject;
//        
//        NSLog(@"num of object: %lu", (unsigned long)self.beauticiansLocationFeed.arrBeauticiansLocation.count);
//        
//        [self.mapView addAnnotations:[self createAnnotations]];
//    
//    } failerBlock:^(NSError *error) {
//        
//        NSLog(@"Error getjson:%@", error);
//        
//    }];
//    
//    
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
//    [self.mArrbeauticiansLocationOnScreen removeAllObjects];
//    
//    for (BAPBeauticianLocationModel* beauticianLocationModel in self.beauticiansLocationFeed.arrBeauticiansLocation)
//    {
//        //Create coordinates from the latitude and longitude values
//        CLLocationCoordinate2D coord;
//        coord.latitude = beauticianLocationModel.numBeauticianLocationLatitude;
//        coord.longitude = beauticianLocationModel.numBeauticianLocationLongitude;
//        
//        if(MKMapRectContainsPoint(self.mapView.visibleMapRect, MKMapPointForCoordinate(coord)))
//        {
//            [self.mArrbeauticiansLocationOnScreen addObject:beauticianLocationModel];
//        }
//    }
}

- (void)uiMenu
{
    /// Make the menu but make his constraintHeight = 0 for Invisible
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
    // Add tap gesture to dim view
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
    
    // Collect all business on visible map view
    [self updateMArrBusinessOnScrenn];
    
    // reload table data with that array
    [self.tableBusinessOnScreen reloadData];
    
    // Show the table with animation
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
        
        // Set images to annotation and user location
        if (annotation == self.mapView.userLocation)
        {
            customPinView.image = [UIImage imageNamed:@"userLocationIcon.png"];
        }
        ///TODO?? which image
        //else{ customPinView.image = [UIImage imageNamed:@"mySomeOtherImage.png"];
        ///TODO chack with adak
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

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    self.mapView.showsUserLocation = YES;
}

/// DEMO DATA ///
- (NSMutableArray *)createAnnotations
{
    NSMutableArray *annotations = [[NSMutableArray alloc] init];
    
    for (BAPBusiness* business in self.mArrBusiness)
//    for (BAPBeauticianLocationModel* beauticianLocationModel in self.beauticiansLocationFeed.arrBeauticiansLocation)
    {
        //Create coordinates from the latitude and longitude values
        CLLocationCoordinate2D coord;
        coord.latitude = business.businessAdress.numBusinessLatitude;
        coord.longitude = business.businessAdress.numBusinessLongitude;
        
        BAPMapViewAnnotation *annotation = [[BAPMapViewAnnotation alloc] initWithTitle:business.strBusinessName AndCoordinate:coord];
//        coord.latitude = beauticianLocationModel.numBeauticianLocationLatitude;
//        coord.longitude = beauticianLocationModel.numBeauticianLocationLongitude;
//        
//        BAPMapViewAnnotation *annotation = [[BAPMapViewAnnotation alloc] initWithIdentity:beauticianLocationModel.strBeauticianLocationID AndCoordinate:coord];
        
        [annotations addObject:annotation];
    }
    
    return annotations;
}

#pragma mark - Table methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return self.mArrbeauticiansLocationOnScreen.count;
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


