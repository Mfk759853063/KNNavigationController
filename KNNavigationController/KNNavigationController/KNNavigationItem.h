//
//  KNNavigationItem.h
//  KNNavigationController
//
//  Created by kwep_vbn on 15/11/23.
//  Copyright © 2015年 vbn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KNNavigationItem : UIView

@property (strong, nonatomic) UIButton *button;

@property (nonatomic, assign, getter = isEnabled) BOOL enabled;

- (instancetype)initWithItemSize:(CGSize)size title:(NSString *)title handler:(void(^)(id sender))action;

- (instancetype)initWithItemSize:(CGSize)size title:(NSString *)title image:(UIImage *)image handler:(void (^)(id))action;

@end
