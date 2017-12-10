//
//  TabbarViewController.m
//  TabbarCustomerConfig
//
//  Created by 唐桂富 on 2017/11/26.
//  Copyright © 2017年 唐桂富. All rights reserved.
//

#import "TabbarItemOrderViewController.h"
#import <HHRouter/HHRouter.h>

@interface TabbarItemOrderViewController ()
@property(nonatomic,strong)UIButton *button;
@end

@implementation TabbarItemOrderViewController

+(void)load{
    [[HHRouter shared] map:@"/tabbaritem/:items" toControllerClass:[self class]];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"自定义菜单";
    
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.button.frame = CGRectMake(100, 100, 50, 50);
    self.button.backgroundColor = [UIColor redColor];
    [self.button setTitle:@"触摸" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(begainTouch:withEvent:) forControlEvents:UIControlEventTouchDown];
    [self.button addTarget:self action:@selector(dragMoving:withEvent: )forControlEvents: UIControlEventTouchDragInside];
    [self.button addTarget:self action:@selector(dragEnded:withEvent: )forControlEvents:UIControlEventTouchUpOutside];
    [self.button addTarget:self action:@selector(buttonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:self.button];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setParams:(NSDictionary *)params{
    _params = params;
}

- (void) begainTouch: (UIControl *) c withEvent:ev
{
    CGPoint eventCenter = c.center;
    NSLog(@"x:%.0f,y:%.0f",eventCenter.x,eventCenter.y);
}

- (void) dragMoving: (UIControl *) c withEvent:ev
{
//    c.center = [[[ev allTouches] anyObject] locationInView:self.view];
}

- (void) dragEnded: (UIControl *) c withEvent:ev
{
//    c.center = [[[ev allTouches] anyObject] locationInView:self.view];
}

-(void)buttonAction:(UIButton *)sender
{
    NSLog(@"起飞");
}

@end
