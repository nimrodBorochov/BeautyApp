//
//  BACMainVC.m
//  BeautyApp_Client
//
//  Created by Nimrod Borochov on 16/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPMainVC.h"
#import "BAPMapViewAnnotation.h"
#import "BAPBusinessOnMapCell.h"
#import "BAPBeauticianVC.h"
#import "BAPBeauticianSearchVC.h"
#import "BAPMenuV.h"
#import "UIView+Layout.h"
#import "BAPUserProfileVC.h"
#import "BAPUserTreatmentHistoryVC.h"
#import "BAPRegulationsVC.h"
#import "BAPWalkthroughVC.h"
#import "BAPReservationVC.h"
#import "BAPBeauticiansLocationFeed.h"
#import "BAPGetBeauticiansLocationByPostCoordinates.h"
#import "BAPBeauticianLocationModel.h"
#import "BAPGetBeauticansArrayForPostBeauticansIdsArray.h"
#import "BAPBeauticiansArrayFeed.h"
#import "BAPBeauticianModel.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "UIBarButtonItem+Badge.h"
#import "BAPMessagesListVC.h"
#import "BAPPendingTreatmentListVC.h"


static NSInteger const SPACER_ITEM_WITH = 22;
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

@property (strong, nonatomic) NSMutableArray* mArrbeauticiansLocation;
@property (strong, nonatomic) NSMutableArray* mArrIdsOfbeauticiansOnScreen;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLLocation *startLocation;

@property (strong, nonatomic) BAPBeauticiansLocationFeed* beauticiansLocationFeed;
@property (strong, nonatomic) BAPBeauticiansArrayFeed* beauticiansArrayFeed;

@end

@implementation BAPMainVC

#pragma mark - UIViewController Life Circle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mArrIdsOfbeauticiansOnScreen = [NSMutableArray new];
    
    [self setupNavigationBar];
    
    [self setupMap];
    
    [self showAnnotations];
    
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
    
    /// Custom Posts Button
    // Set the frame with image
    UIImage* postsImage = [UIImage imageNamed:@"Posts.png"];
    UIButton* postsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    postsButton.frame = CGRectMake(0, 0, postsImage.size.width, postsImage.size.height);
    [postsButton setImage:postsImage forState:UIControlStateNormal];
    
    // Set target method
    [postsButton addTarget:self action:@selector(postsButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    
    // Create the custom bar botton item
    UIBarButtonItem *postsBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:postsButton] ;
    
    /// TODO: connect to real number (how many massages user have)
    postsBarButtonItem.badgeValue = @"2";
    
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
    
    /// Custom Beautician tretment Button
    // Set the frame with image
    UIImage* tretmentsImage = [UIImage imageNamed:@"treatments.png"];
    UIButton* tretmentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    tretmentButton.frame = CGRectMake(0, 0, tretmentsImage.size.width, tretmentsImage.size.height);
    [tretmentButton setImage:tretmentsImage forState:UIControlStateNormal];
    
    // Set target method
    [tretmentButton addTarget:self action:@selector(tretmentButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    
    // Create the custom bar botton item
    UIBarButtonItem *tretmentOrderBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:tretmentButton] ;
    
    /// Custom Beautician tretment Button
    // Set the frame with image
    UIImage* logoImage = [UIImage imageNamed:@"logo.png"];
    UIButton* logoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    logoButton.frame = CGRectMake(0, 0, logoImage.size.width, logoImage.size.height);
    [logoButton setImage:logoImage forState:UIControlStateNormal];
    
    
    
    // Create the custom bar botton item
    UIBarButtonItem *logoBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:logoButton] ;
    
    
    ///
    // Create Spacer item
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    
    negativeSpacer.width = SPACER_ITEM_WITH;
    
    // Create Array with the button items
    NSArray *actionButtonItems = @[logoBarButtonItem, negativeSpacer, tretmentOrderBarButtonItem, negativeSpacer,beauticianSearchBarButtonItem, negativeSpacer, postsBarButtonItem, negativeSpacer, menuBarButtonItem];
    
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

- (void)showAnnotations
{
    CLLocation* currentLocation;
    
    if (self.mapView.userLocation.location.coordinate.latitude != 0)
    {
        currentLocation = self.mapView.userLocation.location;
    }
    else
    {
        currentLocation = self.startLocation;
    }
    
    BAPGetBeauticiansLocationByPostCoordinates* getBeauticiansLocationByPostCoordinates;
    
    getBeauticiansLocationByPostCoordinates = [BAPGetBeauticiansLocationByPostCoordinates new];
    
    self.beauticiansLocationFeed = [BAPBeauticiansLocationFeed new];
    
    [getBeauticiansLocationByPostCoordinates getBeauticiansLocationForLatitude:(double)currentLocation.coordinate.latitude longitude:(double)currentLocation.coordinate.longitude successBlock:^(id jsonObject) {
        
        self.beauticiansLocationFeed = jsonObject;
        
        NSLog(@"num of object: %lu", (unsigned long)self.beauticiansLocationFeed.arrBeauticiansLocation.count);
        
        [self.mapView addAnnotations:[self createAnnotations]];
        
    } failerBlock:^(NSError *error) {
        
        NSLog(@"Error getjson:%@", error);
        
    }];
}

- (void)updateMArrIdsBusinessOnScrenn
{
    [self.mArrIdsOfbeauticiansOnScreen removeAllObjects];
    
    for (BAPBeauticianLocationModel* beauticianLocationModel in self.beauticiansLocationFeed.arrBeauticiansLocation)
    {
        //Create coordinates from the latitude and longitude values
        CLLocationCoordinate2D coord;
        coord.latitude = beauticianLocationModel.dblBeauticianLocationLatitude;
        coord.longitude = beauticianLocationModel.dblBeauticianLocationLongitude;
        
        if(MKMapRectContainsPoint(self.mapView.visibleMapRect, MKMapPointForCoordinate(coord)))
        {
            [self.mArrIdsOfbeauticiansOnScreen addObject:beauticianLocationModel.strBeauticianID];
        }
    }
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

- (void)postsButtonTapped
{
    if (!self.dimView.hidden)
    {
        [self closeMenuWithAnimation:YES];
    }
    else
    {
        // Creating view controller to show
        BAPMessagesListVC* messagesListVC = [self.storyboard instantiateViewControllerWithIdentifier:@"BAPMessagesListVC"];
        
        // Push to BACRegulationsCV
        [self.navigationController pushViewController:messagesListVC animated:YES];
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

- (void)tretmentButtonTapped
{
    if (!self.dimView.hidden)
    {
        [self closeMenuWithAnimation:YES];
    }
    else
    {
        // Creating view controller to show
        BAPPendingTreatmentListVC* pendingTreatmentListVC = [self.storyboard instantiateViewControllerWithIdentifier:@"BAPPendingTreatmentListVC"];
        
        // Push to BACReservationVC
        [self.navigationController pushViewController:pendingTreatmentListVC animated:YES];
    }
}

- (IBAction)btnShowTableOfBusinessOnScreenTapped:(id)sender
{
    if (!self.dimView.hidden)
    {
        [self closeMenuWithAnimation:YES];
    }
    else if (self.constraintHeightOfTable.constant > 0)
    {
        [UIView animateWithDuration:1 animations:^{
            self.constraintHeightOfTable.constant = 0;
            
            [self.view layoutIfNeeded];
        }];
    }
    else
    {
        // Collect all business on visible map view
        [self updateMArrIdsBusinessOnScrenn];
        
        BAPGetBeauticansArrayForPostBeauticansIdsArray* getBeauticansArrayForPostBeauticansIdsArray = [BAPGetBeauticansArrayForPostBeauticansIdsArray new];
        
        self.beauticiansArrayFeed = [BAPBeauticiansArrayFeed new];
        
        [getBeauticansArrayForPostBeauticansIdsArray getBeauticiansArrayForBeauticansIdsArray:self.mArrIdsOfbeauticiansOnScreen successBlock:^(id jsonObject) {
            
            self.beauticiansArrayFeed = jsonObject;
            
            // reload table data with that array
            [self.tableBusinessOnScreen reloadData];
            
            // Show the table with animation
            [UIView animateWithDuration:1 animations:^{
                
                self.constraintHeightOfTable.constant = 460;
                
                
                [self.view layoutIfNeeded];
            }];
            
        } failerBlock:^(NSError *error) {
            
            NSLog(@"error loading jason: %@", error);
            
        }];
        
    }
}

- (void)pushToBeauticianVCWithBeauticianModel:(BAPBeauticianModel *)beauticianModel
{
    // Creating view controller to show
    BAPBeauticianVC* beauticianVC = [self.storyboard instantiateViewControllerWithIdentifier:@"BAPBeauticianVC"];
    
    // Set view controller property
    beauticianVC.beauticianModel = beauticianModel;
    
    // Push to MSLEmployeeProfileVC
    [self.navigationController pushViewController:beauticianVC animated:YES];
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
        customPinView.canShowCallout = YES;
        customPinView.leftCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        return customPinView;
        
    } else {
        
        pinView.annotation = annotation;
    }
    
    return pinView;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    BAPMapViewAnnotation* mapViewAnnotation = (BAPMapViewAnnotation *)view.annotation;
    
    NSArray* arrBeauticanId = [NSArray arrayWithObject:mapViewAnnotation.identity];
    
    BAPGetBeauticansArrayForPostBeauticansIdsArray* getBeauticansArrayForPostBeauticansIdsArray = [BAPGetBeauticansArrayForPostBeauticansIdsArray new];
    
    [getBeauticansArrayForPostBeauticansIdsArray getBeauticiansArrayForBeauticansIdsArray:arrBeauticanId successBlock:^(id jsonObject) {
        
        self.beauticiansArrayFeed = jsonObject;
        
        [self pushToBeauticianVCWithBeauticianModel:self.beauticiansArrayFeed.arrBeauticiansModel.firstObject];
        
    } failerBlock:^(NSError *error) {
        
        NSLog(@"error loading jason: %@", error);
        
    }];
    
    
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    //    BAPMapViewAnnotation *mapViewAnnotation = (BAPMapViewAnnotation *)view.annotation;
    //
    //    BAPBeauticianVC *beauticianVC = [self.storyboard instantiateViewControllerWithIdentifier:@"BAPBeauticianVC"];
    //
    //    //    for (BAPBusiness* business in self.mArrBusinessOnScreen)
    //    //    {
    //    //        /// TODO: change to id
    //    //        if ([business.strBusinessName isEqualToString:mapViewAnnotation.title]) {
    //    //            beauticianVC.business = business;
    //    //        }
    //    //    }
    //
    //    [self.navigationController pushViewController:beauticianVC animated:YES];
    
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    /// TODO: take care about ifim :)
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    self.mapView.showsUserLocation = YES;
}

/// DEMO DATA ///
- (NSMutableArray *)createAnnotations
{
    NSMutableArray *annotations = [[NSMutableArray alloc] init];
    
    
    for (BAPBeauticianLocationModel* beauticianLocationModel in self.beauticiansLocationFeed.arrBeauticiansLocation)
    {
        //Create coordinates from the latitude and longitude values
        CLLocationCoordinate2D coord;
        
        coord.latitude = beauticianLocationModel.dblBeauticianLocationLatitude;
        coord.longitude = beauticianLocationModel.dblBeauticianLocationLongitude;
        
        BAPMapViewAnnotation *annotation = [[BAPMapViewAnnotation alloc]initWithTitle:beauticianLocationModel.strBeauticianName Identity:beauticianLocationModel.strBeauticianID AndCoordinate:coord];
        
        [annotations addObject:annotation];
    }
    
    return annotations;
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
    
    //
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
    
    [self pushToBeauticianVCWithBeauticianModel:self.beauticiansArrayFeed.arrBeauticiansModel[indexPath.row]];
    
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
    BAPRegulationsVC* regulationsCV = [self.storyboard instantiateViewControllerWithIdentifier:@"BAPRegulationsVC"];
    
    // Push to BACRegulationsCV
    [self.navigationController pushViewController:regulationsCV animated:YES];
}
@end


