//
//  UIView+GHYView.h
//  HZDLHuiXianXia
//
//  Created by hzdlapple2 on 15/4/7.
//  Copyright (c) 2015年 hzdlapple2. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (GHYView)
@property (readonly) CGPoint bottomLeft;
@property (readonly) CGPoint bottomRight;
@property (readonly) CGPoint topRight;
@property (readonly) CGPoint topLeft;

@property CGFloat height;
@property CGFloat width;

@property CGFloat top;
@property CGFloat left;

@property CGFloat bottom;
@property CGFloat right;

- (void) moveBy: (CGPoint) delta;
- (void) scaleBy: (CGFloat) scaleFactor;
- (void) fitInSize: (CGSize) aSize;

-(void)removeAllSubViews;
-(void)resAllInputViews;
-(UIView*)findFirstResponder;
- (UIView*)findFirstResponderBeneathView:(UIView*)view;
- (void)showDebug;
- (void)showDebugWithColor:(UIColor *)color;

- (UITapGestureRecognizer *)addTapGesTureRecognizerWithTarget:(id)target action:(SEL)selector;
- (UIPanGestureRecognizer *)addPanGesTureRecognizerWithTarget:(id)target action:(SEL)selector;
- (UILongPressGestureRecognizer *)addLongPressGestureRecognizerWithTarget:(id)target action:(SEL)selector;


@end
