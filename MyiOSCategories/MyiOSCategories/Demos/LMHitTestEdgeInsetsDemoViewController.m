//
//  LMHitTestEdgeInsetsDemoViewController.m
//  MyiOSCategories
//
//  Created by Lyman on 2018/2/8.
//  Copyright © 2018年 Lyman. All rights reserved.
//

#import "LMHitTestEdgeInsetsDemoViewController.h"

#import "UIButton+LMHitTestEdgeInsets.h"

@interface LMHitTestEdgeInsetsDemoViewController ()

@property (weak, nonatomic) IBOutlet UIButton *addButton;

@end

@implementation LMHitTestEdgeInsetsDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // 将加号按钮的响应区域的4个方向都加10个pt
    self.addButton.lm_hitTestEdgeInsets = UIEdgeInsetsMake(-10, -10, -10, -10);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addButtonAction:(UIButton *)sender {
    
    NSLog(@"点击了加号....");
}


@end
