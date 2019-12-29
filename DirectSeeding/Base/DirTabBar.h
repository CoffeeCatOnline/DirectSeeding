//
//  DirTabBar.h
//  DirectSeeding
//
//  Created by apple on 2019/12/29.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger,DirItemType){
    Typelaunch = 10,
    TypeLive =100,
    TypeMe,
};

@class DirTabBar;
typedef void(^TabBlock)(DirTabBar *tabbar,DirItemType idx);

@protocol DirTbaBarDelegate <NSObject>

- (void)tabbar:(DirTabBar *)tabbar clickIndex:(DirItemType)idx;

@end

@interface DirTabBar : UIView

@property (nonatomic, weak) id<DirTbaBarDelegate>deldgate;
@property (nonatomic, copy) TabBlock block;

@property (nonatomic, strong) NSArray * datalist;

@property (nonatomic, strong) UIButton * lastItem;

@property (nonatomic, strong) UIImageView * tabBgView;

@property (nonatomic, strong) UIButton * cameraBtn;

@end

NS_ASSUME_NONNULL_END
