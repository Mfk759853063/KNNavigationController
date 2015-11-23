//
//  KNNavigationBar.m
//  KNNavigationController
//
//  Created by kwep_vbn on 15/11/23.
//  Copyright © 2015年 vbn. All rights reserved.
//

#import "KNNavigationBar.h"
#import "KNNavigationDefines.h"

@implementation KNNavigationBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backGoundImageView.image = [UIImage imageNamed:@"bg_navigator_ios7"];
        
        self.shadowView.backgroundColor = kNavigationBarShadowColor;
    }
    return self;
}


#pragma mark - getter && setter

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:17];
        _titleLabel.textColor = kNavigationBarTitleLabelColor;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        [self addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.centerY.equalTo(self).offset(10);
        }];
    }
    return _titleLabel;
}

- (void)setLeftItem:(KNNavigationItem *)leftItem {
    [_leftItem removeFromSuperview];
    _leftItem = leftItem;
    _leftItem.button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self addSubview:leftItem];
    [leftItem mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self).offset(10);
        make.left.equalTo(self).offset(8);
        make.width.equalTo(@(CGRectGetWidth(leftItem.bounds)));
        make.height.equalTo(@(CGRectGetHeight(leftItem.bounds)));
    }];
    [self layoutIfNeeded];
}

- (void)setLeftItems:(NSArray *)leftItems {
    [_leftItem removeFromSuperview];
    _leftItems = leftItems;
    __block KNNavigationItem *preItem = nil;
    [leftItems enumerateObjectsUsingBlock:^(KNNavigationItem * _Nonnull item, NSUInteger idx, BOOL * _Nonnull stop) {
        [self addSubview:item];
        if (!preItem) {
            [item mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self).offset(10);
                make.left.equalTo(self).offset(8);
                make.width.equalTo(@(CGRectGetWidth(item.bounds)));
                make.height.equalTo(@(CGRectGetHeight(item.bounds)));
            }];
        } else {
            [item mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self).offset(10);
                make.left.equalTo(preItem.mas_right).offset(8);
                make.width.equalTo(@(CGRectGetWidth(item.bounds)));
                make.height.equalTo(@(CGRectGetHeight(item.bounds)));
            }];
        }
        preItem = item;
    }];
}

- (void)setRightItem:(KNNavigationItem *)rightItem {
    [_rightItem removeFromSuperview];
    _rightItem = rightItem;
    _rightItem.button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [self addSubview:rightItem];
    [rightItem mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self).offset(10);
        make.trailing.equalTo(self).offset(-8);
        make.width.equalTo(@(CGRectGetWidth(rightItem.bounds)));
        make.height.equalTo(@(CGRectGetHeight(rightItem.bounds)));
    }];
    [self layoutIfNeeded];
}

- (void)setRightItems:(NSArray *)rightItems {
    [_rightItem removeFromSuperview];
    _rightItems = rightItems;
    __block KNNavigationItem *preItem = nil;
    [_rightItems enumerateObjectsUsingBlock:^(KNNavigationItem * _Nonnull item, NSUInteger idx, BOOL * _Nonnull stop) {
        [self addSubview:item];
        if (!preItem) {
            [item mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self).offset(10);
                make.trailing.equalTo(self).offset(-8);
                make.width.equalTo(@(CGRectGetWidth(item.bounds)));
                make.height.equalTo(@(CGRectGetHeight(item.bounds)));
            }];
        } else {
            [item mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self).offset(10);
                make.trailing.equalTo(preItem.mas_leading).offset(-8);
                make.width.equalTo(@(CGRectGetWidth(item.bounds)));
                make.height.equalTo(@(CGRectGetHeight(item.bounds)));
            }];
        }
        preItem = item;
    }];
}

- (UIImageView *)backGoundImageView
{
    if (!_backGoundImageView) {
        _backGoundImageView = [[UIImageView alloc] init];
        [self insertSubview:_backGoundImageView atIndex:0];
        [_backGoundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return _backGoundImageView;
}

- (UIView *)shadowView
{
    if (!_shadowView) {
        _shadowView = [UIView new];
        [self addSubview:_shadowView];
        [_shadowView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self);
            make.left.and.right.equalTo(self);
            make.height.equalTo(@0.5);
        }];
    }
    return _shadowView;
}

@end
