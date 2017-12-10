//
//  ICRouterManager.h
//  TabbarCustomerConfig
//
//  Created by 唐桂富 on 2017/11/26.
//  Copyright © 2017年 唐桂富. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICRouterManager : NSObject

+(id)packageViewControllerWithAction:(NSString *)action parame:(id)parame;
+(void)showViewWithAction:(NSString *)action parame:(id)parame from:(id)parentVC animation:(BOOL)animate;
@end
