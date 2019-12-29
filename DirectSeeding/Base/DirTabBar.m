//
//  DirTabBar.m
//  DirectSeeding
//
//  Created by apple on 2019/12/29.
//  Copyright © 2019 apple. All rights reserved.
//

#import "DirTabBar.h"

@implementation DirTabBar

- (NSArray *)detalist
{
    if (!_datalist) {
        _datalist = @[@"tab_live",@"tab_me"];
    }
    return _datalist;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat width = self.frame.size.width/self.datalist.count;
    for (UIView *btn in self.subviews) {
        if (btn.tag >= TypeLive) {
            btn.frame = CGRectMake((btn.tag-TypeLive)*width, 0, width, self.frame.size.height);
        }
    }
    self.tabBgView.frame = self.frame;
    self.cameraBtn.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2-20);
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.tabBgView];
        for (int i =0; i<self.datalist.count; i++) {
            UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
            //是否显示高亮状态
            item.adjustsImageWhenHighlighted = NO;
            
            [item setImage:[UIImage imageNamed:self.datalist[i]] forState:UIControlStateNormal];
            
            [item setImage:[UIImage imageNamed:[self.datalist[i]stringByAppendingString:@"_p"]] forState:UIControlStateSelected];
            
            if (i==0) {
                item.selected = YES;
                self.lastItem = item;
            }
            
            item.tag = TypeLive +i;
            
            [item addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
            
            [self addSubview:item];
        }
        //装载相机
        [self addSubview:self.cameraBtn];
    }
    return self;
}

- (UIButton *)cameraBtn
{
    if (!_cameraBtn) {
        
        _cameraBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_cameraBtn setImage:[UIImage imageNamed:@"tab_launch"] forState:UIControlStateNormal];
        //sizeToFit: 会计算出最优的 size 而且会改变自己的size
        //sizeThatFits: 会计算出最优的 size 但是不会改变 自己的size
        [_cameraBtn sizeToFit];
        
        [_cameraBtn addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
        
        _cameraBtn.tag = Typelaunch;
    }
    return _cameraBtn;
}

- (UIImageView *)tabBgView
{
    if (!_tabBgView) {
        
        _tabBgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"global_tab_bg"]];
    }
    return _tabBgView;
}

- (void)clickItem:(UIButton *)button
{
    if ([self.deldgate respondsToSelector:@selector(tabbar:clickIndex:)])
    {
        [self.deldgate tabbar:self clickIndex:button.tag];
    }
    if (self.block)
    {
        self.block(self,button.tag);
    }
    if (button.tag == Typelaunch) {
        return;
    }
    self.lastItem.selected = NO;
    button.selected = YES;
    self.lastItem = button;
    
    [UIView animateWithDuration:0.2 animations:^{
        
        button.transform = CGAffineTransformMakeScale(1.2, 1.2);
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.2 animations:^{
            
            button.transform = CGAffineTransformIdentity;
        }];
    }];
}

@end
