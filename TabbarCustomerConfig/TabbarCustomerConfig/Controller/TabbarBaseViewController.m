//
//  TabbarBaseViewController.m
//  TabbarCustomerConfig
//
//  Created by 唐桂富 on 2017/11/25.
//  Copyright © 2017年 唐桂富. All rights reserved.
//

#import "TabbarBaseViewController.h"
#import <Masonry/Masonry.h>
#import "ICRouterManager.h"
#import "TabbarBaseViewModel.h"

@interface TabbarBaseViewController ()
@property(nonatomic,strong)TabbarBaseViewModel *viewModel;
@end

@implementation TabbarBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTabbarItems];
    UIButton *editBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [editBtn addTarget:self action:@selector(doTabbarItemEdit:) forControlEvents:UIControlEventTouchUpInside];
    [editBtn setTitle:@"EditItems" forState:UIControlStateNormal];
    [self.view addSubview:editBtn];
    __weak typeof(self) WS = self;
    [editBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(WS.view);
        make.size.mas_equalTo(CGSizeMake(80, 80));
        make.top.equalTo(WS.view).offset(44);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- tabbar init
-(void)initTabbarItems{
    if (!_viewModel) {
        _viewModel = [[TabbarBaseViewModel alloc]init];
    }
}

#pragma mark -- edit

-(void)doTabbarItemEdit:(UIButton *)sender{
    
    [ICRouterManager showViewWithAction:@"tabbaritem" parame:_viewModel.totalItems from:self.navigationController animation:YES];
    
}

@end
