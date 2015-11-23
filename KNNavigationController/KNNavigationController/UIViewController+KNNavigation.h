//
//  UIViewController+KNNavigation.h
//  KNNavigationController
//
//  Created by kwep_vbn on 15/11/23.
//  Copyright © 2015年 vbn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KNNavigationBar.h"

@interface UIViewController (KNNavigation)

@property (strong, nonatomic) KNNavigationBar *kn_navigationBar;

@property (assign, nonatomic,getter=isKn_navigationBarHidden,readonly) BOOL kn_navigationBarHidden;

- (void)kn_navigationBarHidden:(BOOL)hidden animated:(BOOL)animated;

@end
