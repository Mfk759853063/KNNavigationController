//
//  KNBaseViewController.m
//  KNNavigationController
//
//  Created by kwep_vbn on 15/11/23.
//  Copyright © 2015年 vbn. All rights reserved.
//

#import "KNBaseViewController.h"

@implementation KNBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self needBackItem]) {
        UIImage *backImage = [UIImage imageNamed:@"bton_back_normal"];
        __weak KNBaseViewController *weakSelf = self;
        self.kn_navigationBar.leftItem = [[KNNavigationItem alloc] initWithItemSize:CGSizeMake(100, 44) title:@"" image:backImage handler:^(id sender) {
            [weakSelf.navigationController popViewControllerAnimated:YES];
        }];
    }
}

- (BOOL)needBackItem {
    return YES;
}
@end
