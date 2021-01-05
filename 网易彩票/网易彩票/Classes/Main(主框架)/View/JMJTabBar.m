//
//  JMJTabBar.m
//  网易彩票
//
//  Created by HUST on 2020/12/28.
//

#import "JMJTabBar.h"

//自定义一个不会高亮的按钮
@interface JMJTabBarButton : UIButton

@end

@implementation JMJTabBarButton

-(void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
}
@end

@interface JMJTabBar ()

@property(weak,nonatomic)UIButton *currentButton;

@end

@implementation JMJTabBar


-(void)addButtonWithImage:(UIImage *)image andImageSel:(UIImage*)imageSel
{
    JMJTabBarButton *tabBarButton = [[JMJTabBarButton alloc]init];
    
    [tabBarButton setBackgroundImage:image forState:UIControlStateNormal];
    [tabBarButton setBackgroundImage:imageSel forState:UIControlStateSelected];
    
    [tabBarButton addTarget:self action:@selector(tabBarButtonClick:) forControlEvents:UIControlEventTouchDown];
    
    [self addSubview:tabBarButton];
}


-(void)layoutSubviews
{
    //设置子视图
    [super layoutSubviews];
    for (int i=0; i<self.subviews.count; ++i) {
//        获取button
        UIButton *tabBarButton=self.subviews[i];
        tabBarButton.tag=i;
        CGFloat w=jmjScreenWidth/5*0.6;
        CGFloat h=w;
        CGFloat x=i*jmjScreenWidth/5+jmjScreenWidth/5*0.2;
        CGFloat y=10;
        tabBarButton.frame = CGRectMake(x, y, w, h);
        
        if(i==0){
            [self tabBarButtonClick:tabBarButton];
        }
    }
    
}

-(void)tabBarButtonClick:(UIButton*)sender
{
    
    if(self.currentButton){
        self.currentButton.selected=NO;
    }
//    NSLog(@"sender selected:%ld!",(long)sender.tag);
    sender.selected = YES;
    self.currentButton=sender;
    
    //切换控制器
    if(self.tabBarButtonBlock){
        self.tabBarButtonBlock(sender.tag);
    }
}

@end
