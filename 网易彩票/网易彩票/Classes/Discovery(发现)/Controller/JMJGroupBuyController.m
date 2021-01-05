//
//  JMJGroupBuyController.m
//  网易彩票
//
//  Created by HUST on 2020/12/29.
//

#import "JMJGroupBuyController.h"
#import "UIView+Frame.h"
@interface JMJGroupBuyController ()

@property (nonatomic,weak) UIView *blueView;


@end

@implementation JMJGroupBuyController

-(UIView *)blueView{
    if(!_blueView){
        UIView* blueView = [[UIView alloc]init];
        blueView.backgroundColor = [UIColor blueColor];
        blueView.frame  = CGRectMake(0, 0, jmjScreenWidth, 0);
        [self.view addSubview:blueView];
        _blueView=blueView;
    }
    return _blueView;
}


- (IBAction)groupBuy:(UIButton *)sender {
    
    [UIView animateWithDuration:0.25 animations:^{
        self.blueView.h = self.blueView.h==0?150:0;
        sender.imageView.transform = CGAffineTransformRotate(sender.imageView.transform, M_PI);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self blueView];
    [self.navigationController.navigationBar setTranslucent:NO];
}


@end
