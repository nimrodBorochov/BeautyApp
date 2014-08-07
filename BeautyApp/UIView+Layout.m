//
//  UIView+Layout.m
//  CyberArk SafeShare
//
//  Created by Roei Oved on 8/7/13.
//  Copyright (c) 2013 for-each. All rights reserved.
//

#import "UIView+Layout.h"
//#import "GeneralHelpers.h"

@implementation UIView (Layout)

#pragma mark - Constraints

- (void)fillWithView:(UIView *)view
{
    [self fillWithView:view constraintPriority:UILayoutPriorityRequired];
}

- (void)fillWithView:(UIView *)view constraintPriority:(UILayoutPriority)priority;
{
    NSDictionary* viewDict = NSDictionaryOfVariableBindings(view);
    
    [self addConstraintsForViews:viewDict horisontalFormat:@"H:|[view]|" verticalFormat:@"V:|[view]|" constraintPriority:priority];
    
    [self layoutIfNeeded];
}

- (void)fillWithView:(UIView *)view
          marginLeft:(int)marginLeft
         marginRight:(int)marginRight
           marginTop:(int)marginTop
        marginBottom:(int)marginBottom
{
    [self fillWithView:view
            marginLeft:marginLeft marginRight:marginRight
             marginTop:marginTop marginBottom:marginBottom
    constraintPriority:UILayoutPriorityRequired];
}

- (void)fillWithView:(UIView *)view
          marginLeft:(int)marginLeft
         marginRight:(int)marginRight
           marginTop:(int)marginTop
        marginBottom:(int)marginBottom
  constraintPriority:(UILayoutPriority)priority
{
    NSString* horizontalVisualFormat = [NSString stringWithFormat:@"H:|-(%d)-[view]-(%d)-|", marginLeft, marginRight];
    NSString* verticalVisualFormat = [NSString stringWithFormat:@"V:|-(%d)-[view]-(%d)-|", marginTop, marginBottom];
    
    NSDictionary* viewDict = NSDictionaryOfVariableBindings(view);
    
    [self addConstraintsForViews:viewDict
                horisontalFormat:horizontalVisualFormat
                  verticalFormat:verticalVisualFormat
              constraintPriority:priority];
    
    [self layoutIfNeeded];
}

- (void)fillWithView:(UIView *)view
          marginLeft:(int)marginLeft
           marginTop:(int)marginTop
               width:(int)width
              height:(int)height
{
    NSString* horizontalVisualFormat = [NSString stringWithFormat:@"H:|-(%d)-[view(%d)]|", marginLeft, width];
    NSString* verticalVisualFormat = [NSString stringWithFormat:@"V:|-(%d)-[view(%d)]|", marginTop, height];
    
    NSDictionary* viewDict = NSDictionaryOfVariableBindings(view);
    
    [self addConstraintsForViews:viewDict horisontalFormat:horizontalVisualFormat verticalFormat:verticalVisualFormat];
    
    [self layoutIfNeeded];
}

//- (void)fillWithViews:(NSArray *)arrViews
//           edgeInsets:(UIEdgeInsets)edgeInsets
//{
//    // Create constraints for the firs view
//    NSString *horizontalVisualFormat = ADFormat(@"|-(%f)-[firstSection]", edgeInsets.left);
//    NSString *verticalVisualFormat = ADFormat(@"V:|-(%f)-[firstSection]-(%f)-|", edgeInsets.top, edgeInsets.bottom);
//    
//    UIView *firstSection = arrViews[0];
//    firstSection.translatesAutoresizingMaskIntoConstraints = NO;
//    [self addSubview:firstSection];
//    NSDictionary* viewDict = NSDictionaryOfVariableBindings(firstSection);
//    
//    [self addConstraintsForViews:viewDict horisontalFormat:horizontalVisualFormat verticalFormat:verticalVisualFormat];
//
//    // Loop through all views, and create constraints for them
//    for (NSInteger i = 1; i < arrViews.count; i++)
//    {
//        UIView *curSection = arrViews[i];
//        UIView *prevSection = arrViews[i-1];
//        
//        curSection.translatesAutoresizingMaskIntoConstraints = NO;
//        [self addSubview:curSection];
//        
//        viewDict = NSDictionaryOfVariableBindings(prevSection, curSection);
//        verticalVisualFormat = ADFormat(@"V:|-(%f)-[curSection]-(%f)-|", edgeInsets.top, edgeInsets.bottom);
//        
//        [self addConstraintsForViews:viewDict
//                    horisontalFormat:ADFormat(@"[prevSection][curSection(==prevSection)]")
//                      verticalFormat:verticalVisualFormat];
//    }
//    
//    // Create constraint for the last view
//    horizontalVisualFormat = ADFormat(@"[lastSection]-(%f)-|", edgeInsets.right);
//    
//    UIView *lastSection = [arrViews lastObject];
//    lastSection.translatesAutoresizingMaskIntoConstraints = NO;
//    viewDict = NSDictionaryOfVariableBindings(lastSection);
//    
//    [self addSubview:lastSection];
//    
//    [self addConstraintsForViews:viewDict horisontalFormat:horizontalVisualFormat verticalFormat:nil];
//    
//    [self layoutIfNeeded];
//}

- (void)centerWithView:(UIView *)view
{
    [self addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                     attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterY
                                                    multiplier:1.0
                                                      constant:0.0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1.0
                                                      constant:0.0]];
    [self layoutIfNeeded];
}

- (void)centerWithView:(UIView *)view
                 width:(int)width
                height:(int)height
{
    // Set view height and width
    [self addWidth:width andHeight:height toView:view];
    
    // Center the view
    [self centerWithView:view];
}

- (void)addToCenterBottomWithView:(UIView *)view
                 marginFromBottom:(int)marginBottom
                            width:(int)width
                           height:(int)height

{
    [self centerXView:view];
    
    // Set view height and width
    [self addWidth:width andHeight:height toView:view];
    
    NSDictionary* viewDict = NSDictionaryOfVariableBindings(view);
    
    NSString* verticalVisualFormat = [NSString stringWithFormat:@"V:[view]-%d-|", marginBottom];
    
    NSArray* constraints = [NSLayoutConstraint constraintsWithVisualFormat:verticalVisualFormat
                                                                   options:0
                                                                   metrics:nil
                                                                     views:viewDict];
    [self addConstraints:constraints];
}

- (void)addToCenterTopWithView:(UIView *)view
                 marginFromTop:(int)marginTop
                         width:(int)width
                        height:(int)height

{
    [self centerXView:view];
    
    // Set view height and width
    [self addWidth:width andHeight:height toView:view];
    
    NSDictionary* viewDict = NSDictionaryOfVariableBindings(view);
    
    NSString* verticalVisualFormat = [NSString stringWithFormat:@"V:|-%d-[view]", marginTop];
    
    NSArray* constraints = [NSLayoutConstraint constraintsWithVisualFormat:verticalVisualFormat
                                                                   options:0
                                                                   metrics:nil
                                                                     views:viewDict];
    [self addConstraints:constraints];
}

- (void)removeConstraintsRelatedToView:(UIView *)view
{
    NSMutableArray* constraintsToRemove = [NSMutableArray array];
    
    // Loop all constraints
    for (NSLayoutConstraint* constraint in self.constraints)
    {
        // If current constraint related to the loading view
        if (constraint.firstItem == view || constraint.secondItem == view)
        {
            // Mark to remove
            [constraintsToRemove addObject:constraint];
        }
    }
    
    // Remove constraints
    [self removeConstraints:constraintsToRemove];
}

- (void)addConstraintsForViews:(NSDictionary *)dictViews
              horisontalFormat:(NSString *)horisontalFormat
                verticalFormat:(NSString *)verticalFormat
{
    [self addConstraintsForViews:dictViews
                horisontalFormat:horisontalFormat
                  verticalFormat:verticalFormat
              constraintPriority:UILayoutPriorityRequired];
}

- (void)addConstraintsForViews:(NSDictionary *)dictViews
              horisontalFormat:(NSString *)horisontalFormat
                verticalFormat:(NSString *)verticalFormat
            constraintPriority:(UILayoutPriority)priority
{
    if (horisontalFormat)
    {
        NSArray* constraints = [NSLayoutConstraint constraintsWithVisualFormat:horisontalFormat
                                                                       options:0
                                                                       metrics:nil
                                                                         views:dictViews];
        for (NSLayoutConstraint* currCons in constraints)
        {
            currCons.priority = priority;
        }
        
        [self addConstraints:constraints];
    }
    
    if (verticalFormat)
    {
        NSArray* constraints = [NSLayoutConstraint constraintsWithVisualFormat:verticalFormat
                                                                       options:0
                                                                       metrics:nil
                                                                         views:dictViews];
        for (NSLayoutConstraint* currCons in constraints)
        {
            currCons.priority = priority;
        }
        
        [self addConstraints:constraints];
    }
}

- (void)makeSquare
{
    // Make button a square
    NSLayoutConstraint *constraint = [NSLayoutConstraint
                                      constraintWithItem:self
                                      attribute:NSLayoutAttributeWidth
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:self
                                      attribute:NSLayoutAttributeHeight
                                      multiplier:1
                                      constant:0];
    [self.superview addConstraint:constraint];
}

#pragma mark - Helpers

- (void)addWidth:(int)width andHeight:(int)height toView:(UIView *)view
{
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:view
                         attribute:NSLayoutAttributeWidth
                         relatedBy:NSLayoutRelationEqual
                         toItem:nil
                         attribute:NSLayoutAttributeWidth
                         multiplier:1
                         constant:width]];
    
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:view
                         attribute:NSLayoutAttributeHeight
                         relatedBy:NSLayoutRelationEqual
                         toItem:nil
                         attribute:NSLayoutAttributeHeight
                         multiplier:1
                         constant:height]];
    
}

- (void)centerXView:(UIView *)view
{
    [self addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1.0
                                                      constant:0.0]];
}

#pragma mark - Animations

- (void)animateLayoutWithDuration:(NSTimeInterval)duration
{
    [self animateLayoutWithDuration:duration completion:nil];
}

- (void)animateLayoutWithDuration:(NSTimeInterval)duration completion:(void (^)(BOOL finished))completion
{
    [UIView animateWithDuration:duration
                     animations:^{
                         [self layoutIfNeeded];
                     }
                     completion:completion];
}

+ (void)performBlock:(void (^)(void))animationBlock withAnimation:(BOOL)toAnimate
{
    [UIView performBlock:animationBlock withAnimation:toAnimate duration:0.25];
}

+ (void)performBlock:(void (^)(void))animationBlock withAnimation:(BOOL)toAnimate duration:(CGFloat)duration
{
    [UIView performBlock:animationBlock withAnimation:toAnimate duration:duration completionBlock:nil];
}

+ (void)performBlock:(void (^)(void))animationBlock withAnimation:(BOOL)toAnimate duration:(CGFloat)duration completionBlock:(void (^)(BOOL finished))completionBlock
{
    if (toAnimate)
    {
        [UIView
         animateWithDuration:duration
         animations:animationBlock
         completion:(completionBlock ? completionBlock : nil)];
    }
    else
    {
        animationBlock();
        if (completionBlock)
            completionBlock(YES);
    }
}



//- (NSArray *)hideViewBeneathContainer:(UIView *)container
//{
//    NSArray* constraintArray;
//    
//    // When adding this constraint the view will animate beneath the main view
//    NSString *verticalVisualFormat = ADFormat(@"V:[container]-(%f)-[view]", 10.0);
//    NSDictionary* viewDict = [[NSDictionary alloc] initWithObjectsAndKeys:self, @"view", container, @"container", nil];
//    
//    // Create the constraints array
//    constraintArray = [NSLayoutConstraint constraintsWithVisualFormat:verticalVisualFormat
//                                                              options:0
//                                                              metrics:nil
//                                                                views:viewDict];
//    
//    // Add the constrains to the view
//    [container addConstraints:constraintArray];
//    
//    // Return the array, so the cinstraint can be removed later
//    return constraintArray;
//}

- (void)springAnimationWithConstraint:(NSLayoutConstraint *)constraint
                             constant:(int)constant
                                  dur:(CGFloat)dur
{
    __block int blContant = constant;
    
    [UIView animateWithDuration:dur animations:^{
        
        blContant += 25;
        
        constraint.constant = blContant;
        [self layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:dur animations:^{
            
            blContant -= 25;
            
            constraint.constant = blContant;
            [self layoutIfNeeded];
            
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:dur animations:^{
                
                blContant += 15;
                
                constraint.constant = blContant;
                [self layoutIfNeeded];
                
            } completion:^(BOOL finished) {
                
                [UIView animateWithDuration:dur animations:^{
                    
                    blContant -= 15;
                    
                    constraint.constant = blContant;
                    [self layoutIfNeeded];
                    
                } completion:^(BOOL finished) {
                    
                    [UIView animateWithDuration:dur animations:^{
                        
                        blContant += 5;
                        
                        constraint.constant = blContant;
                        [self layoutIfNeeded];
                        
                    } completion:^(BOOL finished) {
                        
                        [UIView animateWithDuration:dur animations:^{
                            
                            blContant -= 5;
                            
                            constraint.constant = blContant;
                            [self layoutIfNeeded];
                            
                        } completion:^(BOOL finished) {
                            
                            
                        }];
                        
                        
                    }];
                    
                    
                }];
                
                
            }];
            
            
        }];
        
    }];
    
}


@end