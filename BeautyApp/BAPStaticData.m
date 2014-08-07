//
//  BAStaticData.m
//  BeautyApp
//
//  Created by Nimrod Borochov on 03/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPStaticData.h"

@implementation BAPStaticData

-(NSMutableArray *)createStaticData
{
    BAPBusinessServices* ameliaServices;
    BAPBusinessServices* oliviaServices;
    BAPBusinessServices* jessicaServices;
    BAPBusinessServices* emilyServices;
    BAPBusinessServices* lilyServices;
    
    BAPBusiness* ameliaBusiness;
    BAPBusiness* oliviaBusiness;
    BAPBusiness* jessicaBusiness;
    BAPBusiness* emilyBusiness;
    BAPBusiness* lilyBusiness;
    
    BAPBusinessRating* ameliaRating;
    BAPBusinessRating* oliviaRating;
    BAPBusinessRating* jessicaRating;
    BAPBusinessRating* emilyRating;
    BAPBusinessRating* lilyRating;
    
    BAPBusinessAdress* ameliaAdress;
    BAPBusinessAdress* oliviaAdress;
    BAPBusinessAdress* jessicaAdress;
    BAPBusinessAdress* emilyAdress;
    BAPBusinessAdress* lilyAdress;
    
    ameliaRating = [[BAPBusinessRating alloc]initWithBusinessRateAverage:[NSNumber numberWithInt:3] raters:[NSNumber numberWithInt:24]];
    oliviaRating = [[BAPBusinessRating alloc]initWithBusinessRateAverage:[NSNumber numberWithFloat:2] raters:[NSNumber numberWithInt:3]];
    jessicaRating = [[BAPBusinessRating alloc]initWithBusinessRateAverage:[NSNumber numberWithFloat:5] raters:[NSNumber numberWithInt:1]];
    emilyRating = [[BAPBusinessRating alloc]initWithBusinessRateAverage:[NSNumber numberWithFloat:2] raters:[NSNumber numberWithInt:22]];
    lilyRating = [[BAPBusinessRating alloc]initWithBusinessRateAverage:[NSNumber numberWithFloat:4] raters:[NSNumber numberWithInt:8]];
    
    ameliaAdress = [[BAPBusinessAdress alloc]initWithBusinessCity:@"תל-אביב" streetName:@"" longitude:34.783419 latitude:32.069575];
    oliviaAdress = [[BAPBusinessAdress alloc]initWithBusinessCity:@"תל-אביב" streetName:@"" longitude:34.776939 latitude:32.065374];
    jessicaAdress = [[BAPBusinessAdress alloc]initWithBusinessCity:@"תל-אביב" streetName:@"" longitude:34.781617 latitude:32.064464];
    emilyAdress = [[BAPBusinessAdress alloc]initWithBusinessCity:@"תל-אביב" streetName:@"" longitude:34.787432 latitude:32.067592];
    lilyAdress = [[BAPBusinessAdress alloc]initWithBusinessCity:@"תל-אביב" streetName:@"" longitude:34.779085 latitude:32.058481];
    
    ameliaServices = [[BAPBusinessServices alloc]initWithDoFaceCare:YES DoBeautyCare:YES DoCosmeticPedicure:YES DoPedicuresForDiabeti:YES DoPedicureTreatments:YES DoManicure:YES DoAcrylicNail:YES DoImmersionNail:YES DoGelNail:YES DoGelNailPolish:YES DoLegsWaxHairRemovalFW:YES DoHandsWaxHairRemovalFW:YES DoUnderarmWaxHairRemovalFW:YES DoStomachWaxHairRemovalFW:YES DoGroinWaxHairRemovalFW:YES DoMustacheWaxHairRemovalFW:YES DoFaceWaxHairRemovalFW:YES DoEyebrowsWaxHairRemovalFW:YES DoWaxHairRemovalFM:YES DoEyebrowDesign:YES DoApplyingNailPolish:YES DoBotox:YES DoWrinkleFillers:YES DoMiniPedicure:YES DoMiniManicure:YES DoFillNail:YES DoMakeupForEvent:YES DoPermanentMakeup:YES];
    
    oliviaServices = [[BAPBusinessServices alloc]initWithDoFaceCare:NO DoBeautyCare:NO DoCosmeticPedicure:YES DoPedicuresForDiabeti:YES DoPedicureTreatments:YES DoManicure:YES DoAcrylicNail:NO DoImmersionNail:YES DoGelNail:YES DoGelNailPolish:YES DoLegsWaxHairRemovalFW:NO DoHandsWaxHairRemovalFW:NO DoUnderarmWaxHairRemovalFW:NO DoStomachWaxHairRemovalFW:NO DoGroinWaxHairRemovalFW:NO DoMustacheWaxHairRemovalFW:NO DoFaceWaxHairRemovalFW:NO DoEyebrowsWaxHairRemovalFW:NO DoWaxHairRemovalFM:NO DoEyebrowDesign:YES DoApplyingNailPolish:YES DoBotox:NO DoWrinkleFillers:NO DoMiniPedicure:YES DoMiniManicure:YES DoFillNail:NO DoMakeupForEvent:NO DoPermanentMakeup:NO];
    
    jessicaServices = [[BAPBusinessServices alloc]initWithDoFaceCare:YES DoBeautyCare:YES DoCosmeticPedicure:YES DoPedicuresForDiabeti:NO DoPedicureTreatments:YES DoManicure:YES DoAcrylicNail:YES DoImmersionNail:YES DoGelNail:YES DoGelNailPolish:YES DoLegsWaxHairRemovalFW:YES DoHandsWaxHairRemovalFW:YES DoUnderarmWaxHairRemovalFW:NO DoStomachWaxHairRemovalFW:YES DoGroinWaxHairRemovalFW:YES DoMustacheWaxHairRemovalFW:YES DoFaceWaxHairRemovalFW:YES DoEyebrowsWaxHairRemovalFW:YES DoWaxHairRemovalFM:YES DoEyebrowDesign:NO DoApplyingNailPolish:YES DoBotox:YES DoWrinkleFillers:YES DoMiniPedicure:YES DoMiniManicure:YES DoFillNail:YES DoMakeupForEvent:NO DoPermanentMakeup:YES];
    
    emilyServices = [[BAPBusinessServices alloc]initWithDoFaceCare:NO DoBeautyCare:YES DoCosmeticPedicure:NO DoPedicuresForDiabeti:YES DoPedicureTreatments:NO DoManicure:YES DoAcrylicNail:NO DoImmersionNail:YES DoGelNail:YES DoGelNailPolish:YES DoLegsWaxHairRemovalFW:YES DoHandsWaxHairRemovalFW:YES DoUnderarmWaxHairRemovalFW:YES DoStomachWaxHairRemovalFW:YES DoGroinWaxHairRemovalFW:YES DoMustacheWaxHairRemovalFW:YES DoFaceWaxHairRemovalFW:NO DoEyebrowsWaxHairRemovalFW:NO DoWaxHairRemovalFM:NO DoEyebrowDesign:YES DoApplyingNailPolish:YES DoBotox:YES DoWrinkleFillers:YES DoMiniPedicure:YES DoMiniManicure:YES DoFillNail:YES DoMakeupForEvent:YES DoPermanentMakeup:YES];
    
    lilyServices = [[BAPBusinessServices alloc]initWithDoFaceCare:YES DoBeautyCare:YES DoCosmeticPedicure:NO DoPedicuresForDiabeti:NO DoPedicureTreatments:NO DoManicure:YES DoAcrylicNail:YES DoImmersionNail:YES DoGelNail:YES DoGelNailPolish:NO DoLegsWaxHairRemovalFW:NO DoHandsWaxHairRemovalFW:NO DoUnderarmWaxHairRemovalFW:YES DoStomachWaxHairRemovalFW:YES DoGroinWaxHairRemovalFW:NO DoMustacheWaxHairRemovalFW:NO DoFaceWaxHairRemovalFW:YES DoEyebrowsWaxHairRemovalFW:YES DoWaxHairRemovalFM:NO DoEyebrowDesign:NO DoApplyingNailPolish:NO DoBotox:NO DoWrinkleFillers:NO DoMiniPedicure:YES DoMiniManicure:YES DoFillNail:YES DoMakeupForEvent:YES DoPermanentMakeup:NO];
    
    UIImage* ameliaImage = [UIImage imageNamed:@"ameliaImage"];
    UIImage* emilyImage = [UIImage imageNamed:@"emilyImage"];
    UIImage* jessicaImage = [UIImage imageNamed:@"jessicaImage"];
    UIImage* lilyImage = [UIImage imageNamed:@"lilyImage"];
    UIImage* oliviaImage = [UIImage imageNamed:@"oliviaImage"];
    
    ameliaBusiness = [[BAPBusiness alloc] initWithID:@"1" name:@"אמיליה" image:ameliaImage adress:ameliaAdress rating:ameliaRating beauticianDegrees:@"רשימה של תארים" beauticianFirstCertificate:@"תעודה ראשונה" beauticianSecondCertificate:@"תעונה שניה" services:ameliaServices];
    
    emilyBusiness = [[BAPBusiness alloc] initWithID:@"2" name:@"יופי אמלי" image:emilyImage adress:emilyAdress rating:emilyRating beauticianDegrees:@"רשימה של תארים" beauticianFirstCertificate:@"תעודה ראשונה" beauticianSecondCertificate:@"תעונה שניה" services:emilyServices];
    
    jessicaBusiness = [[BAPBusiness alloc] initWithID:@"3" name:@"מכון יופי - ג׳סיקה" image:jessicaImage adress:jessicaAdress rating:jessicaRating beauticianDegrees:@"רשימה של תארים" beauticianFirstCertificate:@"תעודה ראשונה" beauticianSecondCertificate:@"תעונה שניה" services:jessicaServices];
    
    lilyBusiness = [[BAPBusiness alloc] initWithID:@"4" name:@"לילי" image:lilyImage adress:lilyAdress rating:lilyRating beauticianDegrees:@"רשימה של תארים" beauticianFirstCertificate:@"תעודה ראשונה" beauticianSecondCertificate:@"תעונה שניה" services:lilyServices];
    
    oliviaBusiness = [[BAPBusiness alloc] initWithID:@"5" name:@"אוליביה קוסמטיק" image:oliviaImage adress:oliviaAdress rating:oliviaRating beauticianDegrees:@"רשימה של תארים" beauticianFirstCertificate:@"תעודה ראשונה" beauticianSecondCertificate:@"תעונה שניה" services:oliviaServices];
    
    
    NSMutableArray* arrBusiness = [[NSMutableArray alloc]initWithObjects:ameliaBusiness, oliviaBusiness, jessicaBusiness, emilyBusiness, lilyBusiness, nil];
    
    return arrBusiness;
}


@end
