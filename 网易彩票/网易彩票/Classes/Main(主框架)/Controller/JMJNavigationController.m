//
//  JMJNavigationController.m
//  网易彩票
//
//  Created by HUST on 2020/12/28.
//

#import "JMJNavigationController.h"

@interface JMJNavigationController ()

@end

@implementation JMJNavigationController

- (void)viewDidLoad {
    
    //设置导航栏图片
    [super viewDidLoad];
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"UI10"] forBarMetrics:UIBarMetricsDefault];
    
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationBar setTintColor:[UIColor whiteColor]];
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:animated];//
    
}
@end
