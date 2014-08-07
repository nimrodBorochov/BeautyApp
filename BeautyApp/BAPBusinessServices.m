//
//  BABusinessServices.m
//  BeautyApp
//
//  Created by Nimrod Borochov on 24/06/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import "BAPBusinessServices.h"

@implementation BAPBusinessServices


- (id)initWithDoFaceCare:(BOOL)doFaceCare DoBeautyCare:(BOOL)doBeautyCare DoCosmeticPedicure:(BOOL)doCosmeticPedicure DoPedicuresForDiabeti:(BOOL)doPedicuresForDiabeti DoPedicureTreatments:(BOOL)doPedicureTreatments DoManicure:(BOOL)doManicure DoAcrylicNail:(BOOL)doAcrylicNail DoImmersionNail:(BOOL)doImmersionNail DoGelNail:(BOOL)doGelNail DoGelNailPolish:(BOOL)doGelNailPolish DoLegsWaxHairRemovalFW:(BOOL)doLegsWaxHairRemovalFW DoHandsWaxHairRemovalFW:(BOOL)doHandsWaxHairRemovalFW DoUnderarmWaxHairRemovalFW:(BOOL)doUnderarmWaxHairRemovalFW DoStomachWaxHairRemovalFW:(BOOL)doStomachWaxHairRemovalFW DoGroinWaxHairRemovalFW:(BOOL)doGroinWaxHairRemovalFW DoMustacheWaxHairRemovalFW:(BOOL)doMustacheWaxHairRemovalFW DoFaceWaxHairRemovalFW:(BOOL)doFaceWaxHairRemovalFW DoEyebrowsWaxHairRemovalFW:(BOOL)doEyebrowsWaxHairRemovalFW DoWaxHairRemovalFM:(BOOL)doWaxHairRemovalFM DoEyebrowDesign:(BOOL)doEyebrowDesign DoApplyingNailPolish:(BOOL)doApplyingNailPolish DoBotox:(BOOL)doBotox DoWrinkleFillers:(BOOL)doWrinkleFillers DoMiniPedicure:(BOOL)doMiniPedicure DoMiniManicure:(BOOL)doMiniManicure DoFillNail:(BOOL)doFillNail DoMakeupForEvent:(BOOL)doMakeupForEvent DoPermanentMakeup:(BOOL)doPermanentMakeup
{
    self = [super init];
    if (self)
    {
        _doFaceCare = doFaceCare;
        _doBeautyCare = doBeautyCare;
        _doCosmeticPedicure = doCosmeticPedicure;
        _doPedicuresForDiabetics = doPedicuresForDiabeti;
        _doPedicureTreatments = doPedicureTreatments;
        _doManicure = doManicure;
        _doAcrylicNail = doAcrylicNail;
        _doImmersionNail = doImmersionNail;
        _doGelNail = doGelNail;
        _doGelNailPolish = doGelNailPolish;
        _doLegsWaxHairRemovalFW = doLegsWaxHairRemovalFW;
        _doHandsWaxHairRemovalFW = doHandsWaxHairRemovalFW;
        _doUnderarmWaxHairRemovalFW = doUnderarmWaxHairRemovalFW;
        _doStomachWaxHairRemovalFW = doStomachWaxHairRemovalFW;
        _doGroinWaxHairRemovalFW = doGroinWaxHairRemovalFW;
        _doMustacheWaxHairRemovalFW = doMustacheWaxHairRemovalFW;
        _doFaceWaxHairRemovalFW = doFaceWaxHairRemovalFW;
        _doEyebrowsWaxHairRemovalFW = doEyebrowsWaxHairRemovalFW;
        _doWaxHairRemovalFM = doWaxHairRemovalFM;
        _doEyebrowDesign = doEyebrowDesign;
        _doApplyingNailPolish = doApplyingNailPolish;
        _doBotox = doBotox;
        _doWrinkleFillers = doWrinkleFillers;
        _doMiniPedicure = doMiniPedicure;
        _doMiniManicure = doMiniManicure;
        _doFillNail = doFillNail;
        _doMakeupForEvent = doMakeupForEvent;
        _doPermanentMakeup = doPermanentMakeup;
    }
    return self;
}


@end
