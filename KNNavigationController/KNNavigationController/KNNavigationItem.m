//
//  KNNavigationItem.m
//  KNNavigationController
//
//  Created by kwep_vbn on 15/11/23.
//  Copyright © 2015年 vbn. All rights reserved.
//

#import "KNNavigationItem.h"
#import "KNNavigationDefines.h"

@interface KNNavigationItem()

@property (nonatomic, copy) void (^actionBlock)(id);

@end

@implementation KNNavigationItem

- (instancetype)init {
    
    if (self = [super init]) {
        
    }
    
    return self;
}

- (instancetype)initWithItemSize:(CGSize)size
                           title:(NSString *)title
                           image:(UIImage *)image
                         handler:(void (^)(id))action {
    if ([self init]) {
        CGRect frame = self.frame;
        frame.size = size;
        self.frame = frame;
        UIButton *button = [[UIButton alloc] initWithFrame:self.bounds];
        [button setTitle:title forState:UIControlStateNormal];
        if (image) {
            [button setImage:image forState:UIControlStateNormal];
        }
        [button.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [button setTitleColor:kNavigationBarTintColor forState:UIControlStateNormal];
        [self addSubview:button];
        self.button = button;
        self.actionBlock = [action copy];
        
        [button addTarget:self action:@selector(handleTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        [button addTarget:self action:@selector(handleTouchDown:) forControlEvents:UIControlEventTouchDown];
        [button addTarget:self action:@selector(handleTouchUp:) forControlEvents:UIControlEventTouchCancel|UIControlEventTouchUpOutside|UIControlEventTouchDragOutside];
        
    }
    
    return self;
}

- (instancetype)initWithItemSize:(CGSize)size
                           title:(NSString *)title
                         handler:(void (^)(id))action {
    return [[KNNavigationItem alloc] initWithItemSize:size title:title image:nil handler:action];
}

- (void)setEnabled:(BOOL)enabled {
    _enabled = enabled;
    if (enabled) {
        self.userInteractionEnabled = YES;
        self.alpha = 1.0;
    } else {
        self.userInteractionEnabled = NO;
        self.alpha = 0.3;
    }
    
}

#pragma mark - Private Methods

- (void)handleTouchUpInside:(UIButton *)button {
    
    self.actionBlock(button);
    [UIView animateWithDuration:0.2 animations:^{
        button.alpha = 1.0;
    }];
    
}

- (void)handleTouchDown:(UIButton *)button {
    button.alpha = 0.3;
}

- (void)handleTouchUp:(UIButton *)button {
    [UIView animateWithDuration:0.3 animations:^{
        button.alpha = 1.0;
    }];
}


@end
