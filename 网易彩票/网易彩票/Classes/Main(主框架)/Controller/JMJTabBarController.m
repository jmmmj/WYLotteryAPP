//
//  JMJTabBarController.m
//  网易彩票
//
//  Created by HUST on 2020/12/28.
//

#import "JMJTabBarController.h"

//自定义tabbar，需要把当前tabbarItem禁用
#import "JMJTabBar.h"


@interface JMJTabBarController ()



@end

@implementation JMJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //获取五个子控制器
    NSArray *nameArray=@[@"Hall",@"Arena",@"Discovery",@"History",@"MyLottery"];
    UIViewController *v1=[self loadSubViewControllerWithSBName:nameArray[0]];
    UIViewController *v2=[self loadSubViewControllerWithSBName:nameArray[1]];
    UIViewController *v3=[self loadSubViewControllerWithSBName:nameArray[2]];
    UIViewController *v4=[self loadSubViewControllerWithSBName:nameArray[3]];
    UIViewController *v5=[self loadSubViewControllerWithSBName:nameArray[4]];
    self.viewControllers=@[v1,v2,v3,v4,v5];
    
    // 创建自定义tabbar
    JMJTabBar *tabBar = [[JMJTabBar alloc]init];
    
    tabBar.tabBarButtonBlock = ^(NSInteger index) {
//        NSLog(@"切换场景🌞");
        self.selectedIndex=index;
    };
    //self.tabBar.userInteractionEnabled = NO;
    
    self.tabBarItem.enabled=NO;//禁用tabBarItem否则会捕获自定义TabBar上按钮的点击事件
//
    // 设置tabbar的frame
    tabBar.frame=self.tabBar.bounds;
    
//    NSMutableArray *array=[[NSMutableArray alloc]initWithCapacity:self.viewControllers.count];
//    NSLog(@"%ld",self.tabBar.items.count);
    
    for(int i=0;i<self.viewControllers.count;++i)
    {
        UIImage *image=[UIImage imageNamed:[NSString stringWithFormat:@"TabBar%d",i+1]];
        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *imageSel=[UIImage imageNamed:[NSString stringWithFormat:@"TabBar%dSel",i+1]];
        imageSel = [imageSel imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
        [tabBar addButtonWithImage:image andImageSel:imageSel];
        
//        self.tabBar.items[i].title=nameArray[i];
//        self.tabBar.items[i].image=image;
//        self.tabBar.items[i].selectedImage=imageSel;
        
        
    }
    
//    [self.tabBar.items arrayByAddingObjectsFromArray:array];
    [self.tabBar addSubview:tabBar];
    [self.tabBar setNeedsDisplay];
    
}


-(UIViewController*)loadSubViewControllerWithSBName:(NSString*)name
{
    UIStoryboard * stortBoard = [UIStoryboard storyboardWithName:name bundle:nil];
    return [stortBoard instantiateInitialViewController];
}



@end
