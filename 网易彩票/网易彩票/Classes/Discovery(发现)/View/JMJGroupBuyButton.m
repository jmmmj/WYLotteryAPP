//
//  JMJGroupBuyButton.m
//  网易彩票
//
//  Created by HUST on 2020/12/29.
//

#import "JMJGroupBuyButton.h"
#import "UIView+Frame.h"//分类可以直接改x


@implementation JMJGroupBuyButton

-(void)layoutSubviews
{
    [super layoutSubviews];
    //交换内部控件位置
    
    self.titleLabel.x=0;
    self.imageView.x=self.titleLabel.w;
    //
//    CGRect labelRect = self.titleLabel.frame;
//    labelRect.origin.x=0;
//    self.titleLabel.frame = labelRect;

//    CGRect imageRect = self.imageView.frame;
//    imageRect.origin.x=labelRect.size.width;
//    self.imageView.frame = imageRect;

    
}

@end
