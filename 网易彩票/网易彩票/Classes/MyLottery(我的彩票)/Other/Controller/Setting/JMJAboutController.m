//
//  JMJAboutController.m
//  网易彩票
//
//  Created by HUST on 2020/12/30.
//

#import "JMJAboutController.h"
#import "JMJAboutHeaderView.h"
@interface JMJAboutController ()

@end

@implementation JMJAboutController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableHeaderView = [JMJAboutHeaderView aboutHeaderView];
}


@end
