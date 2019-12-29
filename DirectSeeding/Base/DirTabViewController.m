//
//  DirTabViewController.m
//  DirectSeeding
//
//  Created by apple on 2019/12/29.
//  Copyright © 2019 apple. All rights reserved.
//

#import "DirTabViewController.h"
#import "DirTabBar.h"

@interface DirTabViewController ()<DirTbaBarDelegate>

@end

@implementation DirTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tabBar addSubview:self.dirTabbar];
}

- (DirTabBar *)dirTabbar
{
    if (!_dirTabbar) {
        _dirTabbar = [[DirTabBar alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 49)];
        _dirTabbar.delegate = self;
    }
    return _dirTabbar;
}

#pragma mark - DirTbaBarDelegate
- (void)tabbar:(DirTabBar *)tabbar clickIndex:(DirItemType)idx
{
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
