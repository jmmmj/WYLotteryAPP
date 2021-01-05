//
//  JMJArenaController.m
//  网易彩票
//
//  Created by HUST on 2020/12/28.
//

#import "JMJArenaController.h"

@interface JMJArenaController ()

@end

@implementation JMJArenaController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.layer.contents = (__bridge id)[UIImage imageNamed:@"手机壁纸01"].CGImage;//设置拉伸到背景图片
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"UI00"] forBarMetrics:UIBarMetricsDefault];
    //最后一个传入的参数枚举和横竖屏显示于有无父标题显示有关
    
    UISegmentedControl *seg = (UISegmentedControl*)self.navigationItem.titleView;
    [seg setBackgroundColor:[UIColor clearColor] ];
    [seg setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
    [seg setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateSelected];
    [seg setTintColor:[UIColor clearColor]];
}

@end
