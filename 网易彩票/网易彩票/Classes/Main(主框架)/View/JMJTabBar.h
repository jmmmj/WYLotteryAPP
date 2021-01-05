//
//  JMJTabBar.h
//  网易彩票
//
//  Created by HUST on 2020/12/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JMJTabBar : UIView

//1.写block属性——相当于代理的协议，协议方法，id属性；
@property (nonatomic,copy) void (^tabBarButtonBlock)(NSInteger);

-(void)addButtonWithImage:(UIImage *)image andImageSel:(UIImage*)imageSel;

@end

NS_ASSUME_NONNULL_END
