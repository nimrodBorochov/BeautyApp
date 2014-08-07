//
//  BACSearchBeauticianVC.m
//  BeautyApp_Client
//
//  Created by Nimrod Borochov on 22/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPBeauticianSearchVC.h"

static NSString *const NAME_HEB = @"שם";
static NSString *const ENTER_NAME_SEARCH_HEB = @"הכנס שם לחיפוש";
static NSInteger const NAME_SEARCH_TAG = 1;

static NSString *const LOCATIN_HEB = @"מיקום";
static NSString *const ENTER_LOCATIN_SEARCH_HEB = @"הכנס מיקום לחיפוש";
static NSInteger const LOCATIN_SEARCH_TAG = 2;

static NSString *const CLASSIFICATION_HEB = @"סיווג";
static NSString *const TREATMENT_HEB = @"סוג שירות";

static NSString *const BEUTICIAN_HEB = @"קוסמטיקאית";
static NSString *const PEDICURIST_HEB = @"פדיקוריסטית";
static NSString *const MANICURIST_HEB = @"מניקוריסטית";
static NSString *const NAIL_BUILDING_HEB = @"בונת ציפורניים";
static NSString *const TREATS_HEB = @"מטפלת";

static NSString *const FACE_CARE_HEB = @"טיפול פנים";
static NSString *const BEAUTY_CARE_HEB = @"טיפול יופי";
static NSString *const COSMETIC_PEDICURE_HEB = @"פדיקור קוסמטי";
static NSString *const PEDUCURES_FOR_DIABETICS_HEB = @"פדיקור לסוכרתיים";
static NSString *const PEDICURE_TREATMENTS_HEB = @"פדיקור טיפולי";
static NSString *const MANICURE_HEB = @"מניקור";
static NSString *const ACRYLIC_NAIL_HEB = @"בניית ציפורניים - אקריל";
static NSString *const IMMERSION_NAIL_HEB = @"בניית ציפורניים - טבילה";
static NSString *const GEL_NAIL_HEB = @"בניית ציפורניים - ג'ל";
static NSString *const GEL_NAIL_POLISH_HEB = @"לק ג'ל";
static NSString *const LEGS_WAX_HAIR_REMOVAL_FW_HEB = @"הסרת שיער שעווה רגליים - נשים";
static NSString *const HANDS_WAX_HAIR_REMOVAL_FW_HEB = @"הסרת שיער שעווה ידיים - נשים";
static NSString *const UNDERARM_WAX_HAIR_REMOVAL_FW_HEB = @"הסרת שיער שעווה בית שחי - נשים";
static NSString *const STOMACH_WAX_HAIR_REMOVAL_FW_HEB = @"הסרת שיער שעווה בטן - נשים";
static NSString *const GROIN_WAX_HAIR_REMOVAL_FW_HEB = @"הסרת שיער שעווה מפשעה - נשים";
static NSString *const MUSTACHE_WAX_HAIR_REMOVAL_FW_HEB = @"הסרת שיער שעווה שפם - נשים";
static NSString *const FACE_WAX_HAIR_REMOVAL_FW_HEB = @"הסרת שיער שעווה פנים - נשים";
static NSString *const EYEBROWS_WAX_HAIR_REMOVAL_FW_HEB = @"הסרת שיער שעווה גבות - נשים";
static NSString *const WAX_HAIR_REMOVAL_FM_HEB = @"הסרת שיער בשעווה לגברים";
static NSString *const EYEBROW_DESIGN_HEB = @"עיצוב גבות";
static NSString *const APPLYING_NAIL_POLISH_HEB = @"מריחת לק";
static NSString *const BOTOX_HEB = @"בוטוקס";
static NSString *const WRINKLE_FILLERS_HEB = @"מילוי קמטים";
static NSString *const MINI_PEDICURE_HEB = @"מיני פדיקור";
static NSString *const MINI_MANICURE_HEB = @"מיני מניקור";
static NSString *const FILL_NAIL_HEB = @"מילוי ציפורניים";
static NSString *const MAKEUP_FOR_EVENT_HEB = @"איפור לאירוע";
static NSString *const PERMANENT_MAKEUP_HEB = @"איפור קבוע";

static NSInteger const TABLE_CLASSIFICATION_HEIGHT = 290;
static NSInteger const TABLE_TREATMENT_HEIGHT = 360;

@interface BAPBeauticianSearchVC ()<UIGestureRecognizerDelegate, UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *vNameSearch;
@property (weak, nonatomic) IBOutlet UILabel *lblNameSearch;
@property (weak, nonatomic) IBOutlet UIView *vLocationSearch;
@property (weak, nonatomic) IBOutlet UILabel *lblLocationSearch;
@property (weak, nonatomic) IBOutlet UIView *vClassificationSearch;
@property (weak, nonatomic) IBOutlet UILabel *lblClassificationSearch;
@property (weak, nonatomic) IBOutlet UIView *vTreatmentSerach;
@property (weak, nonatomic) IBOutlet UILabel *lblTreatmentSearch;
@property (weak, nonatomic) IBOutlet UIView *vSearch;

@property (weak, nonatomic) IBOutlet UIView *dimView;

@property (weak, nonatomic) IBOutlet UIView *vContainerTablePopup;
@property (weak, nonatomic) IBOutlet UILabel *lblPopTablePopupTitle;
@property (weak, nonatomic) IBOutlet UITableView *tablePopup;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *consrtaintHeightTable;

@property (nonatomic, strong) NSArray* arrClassifications;
@property (nonatomic, strong) NSArray* arrTreatments;

@end

@implementation BAPBeauticianSearchVC


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addTapGestures];
    
    [self updateUI];
    
    [self setArrays];
    
   }

-(void)updateUI
{
    
    self.dimView.alpha = 0;
    self.dimView.hidden = YES;
    
    self.vContainerTablePopup.hidden = YES;
    self.vContainerTablePopup.alpha = 0;
    
    self.tablePopup.dataSource = self;
    self.tablePopup.delegate = self;
}

-(void)addTapGestures
{
    
    // Add UITapGestureRecognizer to vNameSearch
    UITapGestureRecognizer* tapVNameSearch = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(vNameSearchTapped)];
    
    [self.vNameSearch addGestureRecognizer:tapVNameSearch];

    // Add UITapGestureRecognizer to vLocationSearch
    UITapGestureRecognizer* tapVLocationSearch = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(vLocationSearchTapped)];
    
    [self.vLocationSearch addGestureRecognizer:tapVLocationSearch];

    // Add UITapGestureRecognizer to vClassificationSearch
    UITapGestureRecognizer* tapVClassificationSearch = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(vClassificationSearchTapped)];
    
    [self.vClassificationSearch addGestureRecognizer:tapVClassificationSearch];

    // Add UITapGestureRecognizer to vTreatmentSerach
    UITapGestureRecognizer* tapVTreatmentSerach = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(vTreatmentSerachTapped)];
    
    [self.vTreatmentSerach addGestureRecognizer:tapVTreatmentSerach];

    // Add UITapGestureRecognizer to vSearch
    UITapGestureRecognizer* tapVSearch = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(vSearchTapped)];
    
    [self.vSearch addGestureRecognizer:tapVSearch];
    
    // Add UITapGestureRecognizer to dimView
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]initWithTarget:self
                                                                         action:@selector(closeView)];
    [self.dimView addGestureRecognizer:tap];

}

-(void)vNameSearchTapped
{
    [self showAlertWithTitle:NAME_HEB message:ENTER_NAME_SEARCH_HEB tag:NAME_SEARCH_TAG];
}

-(void)vLocationSearchTapped
{
    [self showAlertWithTitle:LOCATIN_HEB message:ENTER_LOCATIN_SEARCH_HEB tag:LOCATIN_SEARCH_TAG];
}

-(void)vClassificationSearchTapped
{
    [self showPopupTableWithTitle:CLASSIFICATION_HEB tableHeigth:TABLE_CLASSIFICATION_HEIGHT];
}

-(void)vTreatmentSerachTapped
{
    [self showPopupTableWithTitle:TREATMENT_HEB tableHeigth:TABLE_TREATMENT_HEIGHT];
}

-(void)vSearchTapped
{
    
}

- (void)showPopupTableWithTitle:(NSString *)title tableHeigth:(NSInteger)tableHeigth
{
    self.consrtaintHeightTable.constant = tableHeigth;
    
    self.dimView.hidden = NO;
    self.vContainerTablePopup.hidden = NO;
    
    self.lblPopTablePopupTitle.text = title;
    
    [self.tablePopup reloadData];
    
    
    [UIView animateWithDuration:0.5 animations:^{
        
        self.dimView.alpha = 0.5;
        
        self.vContainerTablePopup.alpha = 1;
        
    }];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (alertView.tag == NAME_SEARCH_TAG)
    {
    // When OK button tapped
    if (buttonIndex == 1) {
        // Creates Variable to chek if there is a text to search
        NSString *textValue = [[alertView textFieldAtIndex:0].text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        
        if ([textValue length] == 0)
        {
            self.lblNameSearch.text = NAME_HEB;
            self.vNameSearch.backgroundColor = [UIColor redColor];
            
            [self closeView];
            
            return;
        }
        self.lblNameSearch.text = [alertView textFieldAtIndex:0].text;
        self.vNameSearch.backgroundColor = [UIColor greenColor];
    }
    }
    
    if (alertView.tag == LOCATIN_SEARCH_TAG)
    {
        // When OK button tapped
        if (buttonIndex == 1) {
            // Creates Variable to chek if there is a text to search
            NSString *textValue = [[alertView textFieldAtIndex:0].text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
            
            if ([textValue length] == 0)
            {
                self.lblLocationSearch.text = LOCATIN_HEB;
                self.vLocationSearch.backgroundColor = [UIColor redColor];
                
                [self closeView];
                
                return;
            }
            self.lblLocationSearch.text = [alertView textFieldAtIndex:0].text;
            self.vLocationSearch.backgroundColor = [UIColor greenColor];
        }
    }
    
    [self closeView];
}

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message tag:(NSInteger)tag
{
    
    self.dimView.hidden = NO;
    
    // Create AlertView With textInput(textField)
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:title
                                                     message:message
                                                    delegate:self
                                           cancelButtonTitle:@"ביטול"
                                           otherButtonTitles:@"אישור",  nil];
    
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    // Init tag for delegate
    alert.tag = tag;
    
    // Create Connection to the alertTextField
    UITextField * alertTextField = [alert textFieldAtIndex:0];
    
    // For Heb
    alertTextField.textAlignment = NSTextAlignmentRight;
    
    [alert show];
    
    [UIView animateWithDuration:0.5 animations:^{
        
        
        self.dimView.alpha = 0.5;
        
        

        
    }];
    
}

#pragma mark - Table methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([self.lblPopTablePopupTitle.text isEqualToString:CLASSIFICATION_HEB])
    {
        return self.arrClassifications.count;
    }
    else
    {
        return self.arrTreatments.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier;
    
    cellIdentifier = @"rowCell";
    [self.tablePopup registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    cell.textLabel.textAlignment = NSTextAlignmentRight;
    
    if ([self.lblPopTablePopupTitle.text isEqualToString:CLASSIFICATION_HEB])
    {
        cell.textLabel.text = [self.arrClassifications objectAtIndex:indexPath.row];
    }
    else
    {
        cell.textLabel.text = [self.arrTreatments objectAtIndex:indexPath.row];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if ([self.lblPopTablePopupTitle.text isEqualToString:CLASSIFICATION_HEB])
    {
        self.lblClassificationSearch.text = cell.textLabel.text;
        self.vClassificationSearch.backgroundColor = [UIColor greenColor];
    }
    else
    {
        self.lblTreatmentSearch.text = cell.textLabel.text;
        self.vTreatmentSerach.backgroundColor = [UIColor greenColor];
    }
    
    [self closeView];
    
}

- (void)closeView
{
    [UIView animateWithDuration:0.5 animations:^{
        
        self.dimView.alpha = 0;
        self.vContainerTablePopup.alpha = 0;
        
    } completion:^(BOOL finished) {
        
        self.vContainerTablePopup.hidden = YES;
        self.dimView.hidden = YES;
        
        
    }];
}

- (IBAction)btnCancelInTablePopupTapped:(id)sender
{
    if ([self.lblPopTablePopupTitle.text isEqualToString:CLASSIFICATION_HEB])
    {
        self.lblClassificationSearch.text = CLASSIFICATION_HEB;
        self.vClassificationSearch.backgroundColor = [UIColor redColor];
    }
    else
    {
        self.lblTreatmentSearch.text = TREATMENT_HEB;
        self.vTreatmentSerach.backgroundColor = [UIColor redColor];
    }
    
    [self closeView];
}

-(void)setArrays
{
    self.arrClassifications = [NSArray arrayWithObjects:BEUTICIAN_HEB, PEDICURIST_HEB, MANICURIST_HEB, NAIL_BUILDING_HEB, TREATS_HEB, nil];
    
    self.arrTreatments = [NSArray arrayWithObjects:FACE_CARE_HEB, BEAUTY_CARE_HEB, COSMETIC_PEDICURE_HEB, PEDUCURES_FOR_DIABETICS_HEB, PEDICURE_TREATMENTS_HEB,MANICURE_HEB, ACRYLIC_NAIL_HEB, IMMERSION_NAIL_HEB, GEL_NAIL_HEB, GEL_NAIL_POLISH_HEB, LEGS_WAX_HAIR_REMOVAL_FW_HEB, HANDS_WAX_HAIR_REMOVAL_FW_HEB, UNDERARM_WAX_HAIR_REMOVAL_FW_HEB, STOMACH_WAX_HAIR_REMOVAL_FW_HEB, GROIN_WAX_HAIR_REMOVAL_FW_HEB, MUSTACHE_WAX_HAIR_REMOVAL_FW_HEB, FACE_WAX_HAIR_REMOVAL_FW_HEB, EYEBROWS_WAX_HAIR_REMOVAL_FW_HEB, WAX_HAIR_REMOVAL_FM_HEB, EYEBROW_DESIGN_HEB, APPLYING_NAIL_POLISH_HEB, BOTOX_HEB, WRINKLE_FILLERS_HEB, MINI_PEDICURE_HEB, MINI_MANICURE_HEB, FILL_NAIL_HEB, MAKEUP_FOR_EVENT_HEB, PERMANENT_MAKEUP_HEB, nil];
}

@end
