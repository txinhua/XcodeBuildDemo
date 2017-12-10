//
//  ICRouterManager.m
//  TabbarCustomerConfig
//
//  Created by 唐桂富 on 2017/11/26.
//  Copyright © 2017年 唐桂富. All rights reserved.
//

#import "ICRouterManager.h"
#import <HHRouter/HHRouter.h>

@implementation ICRouterManager

+(void)showViewWithAction:(NSString *)action parame:(id)parame from:(id)parentVC animation:(BOOL)animate{
    if (!parentVC) {
        return;
    }else{
        UIViewController *vc = [self packageViewControllerWithAction:action parame:parame];
        [self presentVC:vc from:parentVC animation:animate];
    }
}

+(void)presentVC:(id)vc from:(id)parent animation:(BOOL)animate{
    if ([parent isKindOfClass:[UINavigationController class]]) {
        UINavigationController *nav = parent;
        [nav pushViewController:vc animated:animate];
    }else{
        UIViewController *nav = parent;
        [nav presentViewController:vc animated:animate completion:nil];
    }
}

+(id)packageViewControllerWithAction:(NSString *)action parame:(id)parame{
    NSString *paStr = [self parameToString:parame];
    NSString *map = nil;
    if (paStr) {
        map = [NSString stringWithFormat:@"/%@/%@",action,paStr];
    }else{
        map = [NSString stringWithFormat:@"/%@",action];
    }
    return [[HHRouter shared]matchController:map];
}

+(NSString *)parameToString:(id)parame{
    
    if (!parame||[parame isEqual:[NSNull null]]) {
        return nil;
    }else if ([parame isKindOfClass:[NSString class]]) {
        return parame;
    }else if ([parame isKindOfClass:[NSDictionary class]]||[parame isKindOfClass:[NSArray class]]) {
        return [self objectToJSONString:parame];
    }else{
        NSLog(@"不支持的参数类型");
        return nil;
    }
    
}

+(NSString*)objectToJSONString:(id)object
{
    if (![NSJSONSerialization isValidJSONObject:object]) {
        return nil;
    }
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                       options:NSJSONReadingAllowFragments | NSJSONReadingMutableLeaves | NSJSONReadingMutableContainers
                                                         error:&error];
    if (!jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        jsonString = [jsonString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\r" withString:@""];
        jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    }
    return jsonString;
}

@end
