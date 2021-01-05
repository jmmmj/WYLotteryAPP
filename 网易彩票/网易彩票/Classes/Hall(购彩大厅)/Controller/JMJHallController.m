//
//  JMJHallController.m
//  网易彩票
//
//  Created by HUST on 2020/12/28.
//

#import "JMJHallController.h"
#import "UIImage+Scale.h"


@interface JMJHallController ()

@property (nonatomic,weak)UIView *coverView;
@property (nonatomic,weak)UIImageView *imageView;

@end

@implementation JMJHallController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image=[UIImage imageNamed:@"UI16"];
    //取消系统的渲染
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    image = [image scaleToSize:CGSizeMake(50,50)];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(activityClick)];
    
    self.navigationItem.title = @"购彩大厅";
    self.navigationItem.leftBarButtonItem = item;


}


//活动的点击事件
-(void)activityClick{
    //遮
    UIView *coverView = [[UIView alloc]initWithFrame:jmjScreenSize];
    
    coverView.backgroundColor = [UIColor grayColor];
    coverView.alpha = 0.5;
    //添加到最外层的控制器
    [self.tabBarController.view addSubview:coverView];
    self.coverView = coverView;
    
    UIImage *image = [UIImage imageNamed:@"Post01"];
    image = [image scaleToSize:CGSizeMake(self.view.bounds.size.width*0.6, self.view.bounds.size.width*0.9)];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    
    
    imageView.center=self.view.center;
    imageView.userInteractionEnabled = YES;
    
//    [coverView addSubview:imageView];//不添加到cover上，因为也会变得透明
    
    [self.tabBarController.view addSubview:imageView];
    self.imageView=imageView;
    //关闭按钮
    UIButton *closeButton = [[UIButton alloc]init];
    
    UIImage *closeButtonImage = [UIImage imageNamed:@"CloseButton00"];
    closeButtonImage = [closeButtonImage scaleToSize:CGSizeMake(20, 20)];
    
    closeButton.frame = CGRectMake(imageView.bounds.size.width-closeButtonImage.size.width, 0, 0, 0);
    [closeButton setBackgroundImage:closeButtonImage forState:UIControlStateNormal];
    [closeButton sizeToFit];
    [imageView addSubview:closeButton];
    [closeButton addTarget:self action:@selector(closeClick) forControlEvents:UIControlEventTouchUpInside];
    
}

//关闭按钮
-(void)closeClick
{
    [UIView animateWithDuration:0.25 animations:^{
        [self.coverView removeFromSuperview];
        [self.imageView removeFromSuperview];
    }];//默认的许多系统的动画的时间都是0.25秒
}

////改变图片的大小
//- (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size{
//    // 创建一个bitmap的context
//    // 并把它设置成为当前正在使用的context
//    UIGraphicsBeginImageContext(size);
//    // 绘制改变大小的图片
//    [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
//    // 从当前context中创建一个改变大小后的图片
//    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
//    // 使当前的context出堆栈
//    UIGraphicsEndImageContext();
//    // 返回新的改变大小后的图片
//    scaledImage = [scaledImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    return scaledImage;
//}


@end
