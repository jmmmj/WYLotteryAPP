//
//  JMJProductCell.m
//  网易彩票
//
//  Created by HUST on 2020/12/30.
//

#import "JMJProductCell.h"

@interface JMJProductCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleView;

@end

@implementation JMJProductCell

- (void)setProduct:(JMJProduct *)product
{
    _product = product;
    self.imageView.layer.cornerRadius =10;
    self.imageView.layer.masksToBounds = YES;
    
    self.imageView.image = [UIImage imageNamed:product.icon];
    self.titleView.text = product.title;
}

@end
