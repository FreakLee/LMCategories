//
//  MainViewController.m
//  MyiOSCategories
//
//  Created by Lyman on 16/9/12.
//  Copyright © 2016年 Lyman. All rights reserved.
//

#import "MainViewController.h"

#import "LMHitTestEdgeInsetsDemoViewController.h"
@interface MainViewController ()

@property (nonatomic, strong) NSDictionary *items;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Demo List";
    self.items = @{@"UIButton":@[@"LMHitTestEdgeInsetsDemoViewController"]};
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    self.tableView.tableFooterView = [UIView new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[_items allKeys] count];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [_items allKeys][section];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[_items objectForKey:[_items allKeys][section]] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text =  [_items objectForKey:[_items allKeys][indexPath.section]][indexPath.row];
    cell.textLabel.adjustsFontSizeToFitWidth = YES;
    cell.textLabel.minimumScaleFactor = 0.6;
    return cell;
}

#pragma mark - TableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *className = cell.textLabel.text;
    
    Class aClass = NSClassFromString(className);
    if (aClass && [aClass isSubclassOfClass:[UIViewController class]]) {
        UIViewController *descVC = [[aClass alloc] init];
        descVC.title = [self destinationViewControllerTitleFromClassName:className];
        [self.navigationController pushViewController:descVC animated:YES];
    }
}

#pragma mark - Private Method
- (NSString *)destinationViewControllerTitleFromClassName:(NSString *)name {
    
    if ([name containsString:@"Demo"]) {
        NSRange demoRange = [name rangeOfString:@"Demo"];
        return [name substringToIndex:demoRange.location];
    }
    
    return nil;
}

@end
