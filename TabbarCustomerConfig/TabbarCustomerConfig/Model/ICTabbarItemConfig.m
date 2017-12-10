//
//  ICTabbarItemConfig.m
//  TabbarCustomerConfig
//
//  Created by 唐桂富 on 2017/11/26.
//  Copyright © 2017年 唐桂富. All rights reserved.
//

#import "ICTabbarItemConfig.h"

@implementation ICTabbarItemConfig

- (id)copyWithZone:(nullable NSZone *)zone{
    
    ICTabbarItemConfig *config = [[ICTabbarItemConfig allocWithZone:zone]init];
    config.title = self.title;
    config.controller = self.controller;
    config.image = self.image;
    config.selectImage = self.selectImage;
    config.show = self.show;
    return config;
    
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:_title forKey:@"title"];
    [aCoder encodeObject:_controller forKey:@"controller"];
    [aCoder encodeObject:_image forKey:@"image"];
    [aCoder encodeObject:_selectImage forKey:@"selectImage"];
    [aCoder encodeObject:_show forKey:@"show"];
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (!self) {
        return nil;
    }
    self.title = [aDecoder decodeObjectForKey:@"title"];
    self.controller = [aDecoder decodeObjectForKey:@"controller"];
    self.image = [aDecoder decodeObjectForKey:@"image"];
    self.selectImage = [aDecoder decodeObjectForKey:@"selectImage"];
    self.show  = [aDecoder decodeObjectForKey:@"show"];
    return self;
}

-(NSDictionary *)package{
    
    NSMutableDictionary *dic = [@{} mutableCopy];
    if (_title) {
        dic[@"title"] = _title;
    }
    if (_controller) {
        dic[@"controller"] = _controller;
    }
    if (_image) {
        dic[@"image"] = _image;
    }
    if (_selectImage) {
        dic[@"selectImage"] = _selectImage;
    }
    if (_show) {
        dic[@"show"] = _show;
    }
    return [dic copy];
    
}

-(void)changShowStatus{
    
    if (_show&&[_show isEqualToString:@"1"]) {
        _show = @"0";
    }else{
        _show = @"1";
    }
    
}

@end
