//
//  KNNavigationBar.h
//  KNNavigationController
//
//  Created by kwep_vbn on 15/11/23.
//  Copyright © 2015年 vbn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KNNavigationItem.h"

@interface KNNavigationBar : UIView

@property (strong, nonatomic) UIView *shadowView;

@property (strong, nonatomic) UIImageView *backGoundImageView;

@property (strong, nonatomic) UILabel *titleLabel;

@property (strong, nonatomic) KNNavigationItem *leftItem;

@property (strong, nonatomic) NSArray *leftItems;

@property (strong, nonatomic) KNNavigationItem *rightItem;

@property (strong, nonatomic) NSArray *rightItems;

- (void)setBackGoundImageViewBlur:(BOOL)blur;

@end
