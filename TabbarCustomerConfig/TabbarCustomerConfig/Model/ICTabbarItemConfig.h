//
//  ICTabbarItemConfig.h
//  TabbarCustomerConfig
//
//  Created by 唐桂富 on 2017/11/26.
//  Copyright © 2017年 唐桂富. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICTabbarItemConfig : NSObject<NSCopying,NSCoding>

@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *controller;
@property(nonatomic,copy)NSString *image;
@property(nonatomic,copy)NSString *selectImage;
@property(nonatomic,copy)NSString *show;

-(void)changShowStatus;
-(NSDictionary *)package;

@end
