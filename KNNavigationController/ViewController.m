//
//  ViewController.m
//  KNNavigationController
//
//  Created by kwep_vbn on 15/11/23.
//  Copyright © 2015年 vbn. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+KNNavigation.h"
#import "KNNavigationBar.h"
#import <CoreImage/CoreImage.h>

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController

static int count = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.view.backgroundColor = [UIColor whiteColor];
    self.kn_navigationBar.titleLabel.text = [NSString stringWithFormat:@"第%d个界面",count+1];
    KNNavigationItem *item1 = [[KNNavigationItem alloc] initWithItemSize:CGSizeMake(40, 44) title:@"1" handler:^(id sender) {
        count ++;
        ViewController *vc = [[ViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }];
    
    KNNavigationItem *item2 = [[KNNavigationItem alloc] initWithItemSize:CGSizeMake(40, 44) title:@"2" handler:^(id sender) {
        count ++;
        ViewController *vc = [[ViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }];
    self.kn_navigationBar.rightItems = @[item1,item2];
    [self.kn_navigationBar setBackGoundViewBlur:YES];
    UITableView *table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:table];
    table.contentInset = UIEdgeInsetsMake(44, 0, 0, 0);
    table.delegate = self;
    table.dataSource = self;
//    [self kn_navigationBarHidden:count %2 == 0 && count != 0 animated:NO];
//    if (count %2 == 0 && count != 0) {
//        self.kn_navigationBar.backGoundImageView.image = [UIImage new];
//    }
    
}

#pragma mark - TableViewDelegate && Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    cell.textLabel.text =@"bbb";
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (void)viewDidAppear:(BOOL)animated {
    
}

- (BOOL)needBackItem {
    
    return count == 0?NO:YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
