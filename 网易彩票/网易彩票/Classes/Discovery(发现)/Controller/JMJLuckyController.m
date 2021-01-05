//
//  JMJLuckyController.m
//  网易彩票
//
//  Created by HUST on 2020/12/29.
//

#import "JMJLuckyController.h"
#import "RotateController.h"
@interface JMJLuckyController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation JMJLuckyController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.animationImages=@[[UIImage imageNamed:@"UI17"],[UIImage imageNamed:@"UI18"]];
    self.imageView.animationDuration=0.8;
    self.imageView.animationRepeatCount=0;
    [self.imageView startAnimating];
}
- (IBAction)button1Click:(id)sender {
    RotateController *rc =[[RotateController alloc]init];
    [self.navigationController pushViewController:rc animated:YES];
    
    self.navigationItem.title=@"幸运大转盘";
    
}

@end
