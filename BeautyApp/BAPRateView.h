//
//  RateView.h
//  CustomViewTest
//
//  Created by Nimrod Borochov on 02/07/14.
//  Copyright (c) 2014 pictureit. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BAPRateView;

// Set up a delegate so we can notify our view controller when the rating changes
@protocol RateViewDelegate
@optional
- (void)rateView:(BAPRateView *)rateView ratingDidChange:(float)rating;

@end

@interface BAPRateView : UIView

// Three UIImages to represent not selected, half selected, and fully selected.
@property (strong, nonatomic) UIImage *notSelectedImage;
@property (strong, nonatomic) UIImage *halfSelectedImage;
@property (strong, nonatomic) UIImage *fullSelectedImage;

// A variable to keep track of our current rating.
@property (assign, nonatomic) float rating;

// A boolean to keep track of whether this view should be editable or not. For example, sometimes we may wish to just display a rating without letting the user edit it.
@property (assign) BOOL editable;

// An array to keep track of the image views we’ll have as children of this view.
@property (strong) NSMutableArray * imageViews;

// The maximum value for a rating. This actually allows us to support other numbers of stars than 5 – for example, maybe we want 3 stars, or 10 stars? Also note the minimum is an assumed 0.
@property (assign, nonatomic) int maxRating;

// Variables to keep track of spacing in case our user wants to change it: the margin between images, the left margin, and a minimum image size.
@property (assign) int midMargin;
@property (assign) int leftMargin;
@property (assign) CGSize minImageSize;


// A variable to keep track of our delegate.
@property (assign) id <RateViewDelegate> delegate;

@end


