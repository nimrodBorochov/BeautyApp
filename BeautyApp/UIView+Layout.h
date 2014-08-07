//
//  UIView+Layout.h
//  CyberArk SafeShare
//
//  Created by Roei Oved on 8/7/13.
//  Copyright (c) 2013 for-each. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Layout)

#pragma mark - Constraints

- (void)fillWithView:(UIView *)view;
- (void)fillWithView:(UIView *)view constraintPriority:(UILayoutPriority)priority;

- (void)centerWithView:(UIView *)view;
- (void)addWidth:(int)width andHeight:(int)height toView:(UIView *)view;
- (void)fillWithView:(UIView *)view
          marginLeft:(int)marginLeft
         marginRight:(int)marginRight
           marginTop:(int)marginTop
        marginBottom:(int)marginBottom;
- (void)fillWithView:(UIView *)view
          marginLeft:(int)marginLeft
         marginRight:(int)marginRight
           marginTop:(int)marginTop
        marginBottom:(int)marginBottom
  constraintPriority:(UILayoutPriority)priority;

- (void)fillWithView:(UIView *)view
          marginLeft:(int)marginLeft
           marginTop:(int)marginTop
               width:(int)width
              height:(int)height;
- (void)centerWithView:(UIView *)view
                 width:(int)width
                height:(int)height;
- (void)addToCenterBottomWithView:(UIView *)view
                 marginFromBottom:(int)marginBottom
                            width:(int)width
                           height:(int)height;
- (void)addToCenterTopWithView:(UIView *)view
                 marginFromTop:(int)marginTop
                         width:(int)width
                        height:(int)height;
- (void)removeConstraintsRelatedToView:(UIView *)view;
//- (void)fillWithViews:(NSArray *)arrViews
//           edgeInsets:(UIEdgeInsets)edgeInsets;

- (void)addConstraintsForViews:(NSDictionary *)dictViews
              horisontalFormat:(NSString *)horisontalFormat
                verticalFormat:(NSString *)verticalFormat;
- (void)addConstraintsForViews:(NSDictionary *)dictViews
              horisontalFormat:(NSString *)horisontalFormat
                verticalFormat:(NSString *)verticalFormat
            constraintPriority:(UILayoutPriority)priority;

- (void)makeSquare;

#pragma mark - Animations

- (void)animateLayoutWithDuration:(NSTimeInterval)duration;
- (void)animateLayoutWithDuration:(NSTimeInterval)duration completion:(void (^)(BOOL finished))completion;

+ (void)performBlock:(void (^)(void))animationBlock withAnimation:(BOOL)toAnimate;
+ (void)performBlock:(void (^)(void))animationBlock withAnimation:(BOOL)toAnimate duration:(CGFloat)duration;
+ (void)performBlock:(void (^)(void))animationBlock withAnimation:(BOOL)toAnimate duration:(CGFloat)duration completionBlock:(void (^)(BOOL finished))completionBlock;

//- (NSArray *)hideViewBeneathContainer:(UIView *)container;
- (void)springAnimationWithConstraint:(NSLayoutConstraint *)constraint
                             constant:(int)constant
                                  dur:(CGFloat)dur;

@end
