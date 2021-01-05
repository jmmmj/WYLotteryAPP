//
//  JMJAboutHeaderView.m
//  网易彩票
//
//  Created by HUST on 2020/12/30.
//

#import "JMJAboutHeaderView.h"

@implementation JMJAboutHeaderView

+(instancetype)aboutHeaderView
{
    return [[NSBundle mainBundle]loadNibNamed:@"JMJAboutHeaderView" owner:nil options:nil][0];
}

@end
