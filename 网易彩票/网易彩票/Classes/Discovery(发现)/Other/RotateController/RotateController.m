//
//  ViewController.m
//  01-大转盘
//
//  Created by HUST on 2020/12/26.
//

#import "RotateController.h"
#import "RotateView.h"

@interface RotateController ()

@end

@implementation RotateController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置拉伸的背景图片
    self.view.layer.contents=(__bridge id)[UIImage imageNamed:@"手机壁纸01"].CGImage;
    RotateView *rotateView=[RotateView rotateView];
    rotateView.viewController=self;
    rotateView.center=CGPointMake(self.view.center.x, self.view.center.y-100);
    
    [self.view addSubview:rotateView];
    [rotateView startRotate];
    
    
}

-(void)showAlert
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"系统提示" message:@"恭喜您，中奖了！！" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
       handler:^(UIAlertAction * action) {}];

    [alertController addAction:defaultAction];
    [self presentViewController:alertController animated:YES completion:nil];
}
-(void)showError
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"系统提示" message:@"请先选择转盘上的数字来抽奖！" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
       handler:^(UIAlertAction * action) {}];

    [alertController addAction:defaultAction];
    [self presentViewController:alertController animated:YES completion:nil];
}
@end
