//
//  UIViewController+KNNavigation.m
//  KNNavigationController
//
//  Created by kwep_vbn on 15/11/23.
//  Copyright © 2015年 vbn. All rights reserved.
//

#import "UIViewController+KNNavigation.h"
#import <objc/runtime.h>
#import "UIView+GHYView.h"

@implementation UIViewController (KNNavigation)
@dynamic kn_navigationBar;
@dynamic kn_navigationBarHidden;

- (BOOL)kn_navigationBarHidden {
    return [objc_getAssociatedObject(self, @selector(kn_navigationBarHidden) )boolValue];
}

- (void)setKn_navigationBarHidden:(BOOL)kn_navigationBarHidden {
    objc_setAssociatedObject(self, @selector(kn_navigationBarHidden), @(kn_navigationBarHidden), OBJC_ASSOCIATION_ASSIGN);
}


- (void)kn_navigationBarHidden:(BOOL)hidden animated:(BOOL)animated {
    if (hidden) {
        if (animated) {
            [UIView animateWithDuration:0.3 animations:^{
                self.kn_navigationBar.top = -64;
                self.kn_navigationBar.alpha = 0;
            } completion:^(BOOL finished) {
                self.kn_navigationBarHidden = YES;
            }];
        } else {
            self.kn_navigationBar.top = -64;
            self.kn_navigationBar.alpha = 0;
            self.kn_navigationBarHidden = YES;
        }
        
    } else if(animated) {
        [UIView animateWithDuration:0.3 animations:^{
            self.kn_navigationBar.top = 0;
            for (UIView *view in self.kn_navigationBar.subviews) {
                view.alpha = 1.0;
            }
        } completion:^(BOOL finished) {
            self.kn_navigationBarHidden = NO;
        }];
    } else {
        self.kn_navigationBar.top = 0;
        for (UIView *view in self.kn_navigationBar.subviews) {
            view.alpha = 1.0;
            self.kn_navigationBarHidden = NO;
        }
    }
}


- (KNNavigationBar *)kn_navigationBar {
    return objc_getAssociatedObject(self, @selector(kn_navigationBar));
}

- (void)setKn_navigationBar:(KNNavigationBar *)kn_navigationBar {
    objc_setAssociatedObject(self, @selector(kn_navigationBar), kn_navigationBar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
