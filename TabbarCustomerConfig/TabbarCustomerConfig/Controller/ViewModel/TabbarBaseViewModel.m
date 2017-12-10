//
//  TabbarBaseViewModel.m
//  TabbarCustomerConfig
//
//  Created by 唐桂富 on 2017/11/26.
//  Copyright © 2017年 唐桂富. All rights reserved.
//

#import "TabbarBaseViewModel.h"
#import "ICTabbarItemConfig.h"

@implementation TabbarBaseViewModel
@synthesize totalItems = _totalItems;

-(NSArray *)showItems{
    if (!_totalItems) {
        [self initTotalItems];
    }
    NSMutableArray *showItemArray = [@[] mutableCopy];
    [_totalItems enumerateObjectsUsingBlock:^(ICTabbarItemConfig  * config, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([config.show isEqualToString:@"1"]) {
            [showItemArray addObject:[config package]];
        }
    }];
    return [showItemArray copy];
}

-(void)initTotalItems{
    
    NSMutableArray * allItemArray = [@[] mutableCopy];
    ICTabbarItemConfig *config = [[ICTabbarItemConfig alloc]init];
    config.title = @"晴天";
    config.image = @"clear";
    config.selectImage = @"clear";
    config.controller = @"weather";
    config.show = @"1";
    [allItemArray addObject:config];
    ICTabbarItemConfig *rain = [[ICTabbarItemConfig alloc]init];
    rain.title = @"雨天";
    rain.image = @"rain";
    rain.selectImage = @"rain";
    rain.controller = @"weather";
    rain.show = @"1";
    [allItemArray addObject:rain];
    ICTabbarItemConfig *sleet = [[ICTabbarItemConfig alloc]init];
    sleet.title = @"雨夹雪";
    sleet.image = @"sleet";
    sleet.selectImage = @"sleet";
    sleet.controller = @"weather";
    sleet.show = @"1";
    [allItemArray addObject:sleet];
    ICTabbarItemConfig *snow = [[ICTabbarItemConfig alloc]init];
    snow.title = @"雪";
    snow.image = @"snow";
    snow.selectImage = @"snow";
    snow.controller = @"weather";
    snow.show = @"0";
    [allItemArray addObject:snow];
    ICTabbarItemConfig *wind = [[ICTabbarItemConfig alloc]init];
    wind.title = @"大风";
    wind.image = @"wind";
    wind.selectImage = @"wind";
    wind.controller = @"weather";
    wind.show = @"0";
    [allItemArray addObject:wind];
    _totalItems = [allItemArray copy];
    
}

-(void)setTotalItems:(NSArray *)totalItems{
    
}

-(NSArray *)totalItems{
    
    if (!_totalItems) {
        [self initTotalItems];
    }
    NSMutableArray *totalItemArray = [@[] mutableCopy];
    [_totalItems enumerateObjectsUsingBlock:^(ICTabbarItemConfig  * config, NSUInteger idx, BOOL * _Nonnull stop) {
        [totalItemArray addObject:[config package]];
    }];
    return [totalItemArray copy];
    
}

@end
