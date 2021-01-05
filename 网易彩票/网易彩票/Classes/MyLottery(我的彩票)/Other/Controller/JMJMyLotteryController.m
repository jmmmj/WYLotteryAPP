//
//  JMJMyLotteryController.m
//  网易彩票
//
//  Created by HUST on 2020/12/29.
//

#import "JMJMyLotteryController.h"
#import "JMJSettingController.h"
@interface JMJMyLotteryController ()
@property (weak, nonatomic) IBOutlet UIButton *loginButton;



@end

@implementation JMJMyLotteryController
- (IBAction)settingClick:(id)sender {
    JMJSettingController * setting = [[JMJSettingController alloc]init];
    setting.plistName = @"Setting";
    setting.navigationItem.title = @"设 置";
    [self.navigationController pushViewController:setting animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"ButtonImage01"];
    image = [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
    [self.loginButton setBackgroundImage:image forState:UIControlStateNormal];
    
    
}


@end
