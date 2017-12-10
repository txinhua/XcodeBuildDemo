//
//  ICTabbarItemEditor.h
//  TabbarCustomerConfig
//
//  Created by 唐桂富 on 2017/11/25.
//  Copyright © 2017年 唐桂富. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TabbarItemEditorDatasource <NSObject>
@required

@optional

@end

@protocol TabbarItemEditorDelegate <NSObject>
@optional

@end

@interface ICTabbarItemEditor : UIView

@property(nonatomic,weak)id<TabbarItemEditorDatasource> datasource;
@property(nonatomic,weak)id<TabbarItemEditorDelegate> delegate;

@end
