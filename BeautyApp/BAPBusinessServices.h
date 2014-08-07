//
//  BABusinessServices.h
//  BeautyApp
//
//  Created by Nimrod Borochov on 24/06/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BAPBusinessServices : NSObject


@property (nonatomic) BOOL doFaceCare;
@property (nonatomic) BOOL doBeautyCare;
@property (nonatomic) BOOL doCosmeticPedicure;
@property (nonatomic) BOOL doPedicuresForDiabetics;
@property (nonatomic) BOOL doPedicureTreatments;
@property (nonatomic) BOOL doManicure;
@property (nonatomic) BOOL doAcrylicNail;
@property (nonatomic) BOOL doImmersionNail;
@property (nonatomic) BOOL doGelNail;
@property (nonatomic) BOOL doGelNailPolish;
@property (nonatomic) BOOL doLegsWaxHairRemovalFW;
@property (nonatomic) BOOL doHandsWaxHairRemovalFW;
@property (nonatomic) BOOL doUnderarmWaxHairRemovalFW;
@property (nonatomic) BOOL doStomachWaxHairRemovalFW;
@property (nonatomic) BOOL doGroinWaxHairRemovalFW;
@property (nonatomic) BOOL doMustacheWaxHairRemovalFW;
@property (nonatomic) BOOL doFaceWaxHairRemovalFW;
@property (nonatomic) BOOL doEyebrowsWaxHairRemovalFW;
@property (nonatomic) BOOL doWaxHairRemovalFM;
@property (nonatomic) BOOL doEyebrowDesign;
@property (nonatomic) BOOL doApplyingNailPolish;
@property (nonatomic) BOOL doBotox;
@property (nonatomic) BOOL doWrinkleFillers;
@property (nonatomic) BOOL doMiniPedicure;
@property (nonatomic) BOOL doMiniManicure;
@property (nonatomic) BOOL doFillNail;
@property (nonatomic) BOOL doMakeupForEvent;
@property (nonatomic) BOOL doPermanentMakeup;

-(id)initWithDoFaceCare:(BOOL)doFaceCare
           DoBeautyCare:(BOOL)doBeautyCare
     DoCosmeticPedicure:(BOOL)doCosmeticPedicure
  DoPedicuresForDiabeti:(BOOL)doPedicuresForDiabeti
   DoPedicureTreatments:(BOOL)doPedicureTreatments
             DoManicure:(BOOL)doManicure
          DoAcrylicNail:(BOOL)doAcrylicNail
        DoImmersionNail:(BOOL)doImmersionNail
              DoGelNail:(BOOL)doGelNail
        DoGelNailPolish:(BOOL)doGelNailPolish
 DoLegsWaxHairRemovalFW:(BOOL)doLegsWaxHairRemovalFW
DoHandsWaxHairRemovalFW:(BOOL)doHandsWaxHairRemovalFW
DoUnderarmWaxHairRemovalFW:(BOOL)doUnderarmWaxHairRemovalFW
DoStomachWaxHairRemovalFW:(BOOL)doStomachWaxHairRemovalFW
DoGroinWaxHairRemovalFW:(BOOL)doGroinWaxHairRemovalFW
DoMustacheWaxHairRemovalFW:(BOOL)doMustacheWaxHairRemovalFW
 DoFaceWaxHairRemovalFW:(BOOL)doFaceWaxHairRemovalFW
DoEyebrowsWaxHairRemovalFW:(BOOL)doEyebrowsWaxHairRemovalFW
     DoWaxHairRemovalFM:(BOOL)doWaxHairRemovalFM
        DoEyebrowDesign:(BOOL)doEyebrowDesign
   DoApplyingNailPolish:(BOOL)doApplyingNailPolish
                DoBotox:(BOOL)doBotox
       DoWrinkleFillers:(BOOL)doWrinkleFillers
         DoMiniPedicure:(BOOL)doMiniPedicure
         DoMiniManicure:(BOOL)doMiniManicure
             DoFillNail:(BOOL)doFillNail
       DoMakeupForEvent:(BOOL)doMakeupForEvent
      DoPermanentMakeup:(BOOL)doPermanentMakeup;

@end
