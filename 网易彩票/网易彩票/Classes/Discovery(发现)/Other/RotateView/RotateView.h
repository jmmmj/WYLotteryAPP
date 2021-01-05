//
//  RotateView.h
//  01-大转盘
//
//  Created by HUST on 2020/12/26.
//

#import <UIKit/UIKit.h>
#import "RotateController.h"


NS_ASSUME_NONNULL_BEGIN
@class RotateViewController;

@interface RotateView : UIView

@property (weak,nonatomic)RotateController * viewController;
-(void)startRotate;
+(instancetype)rotateView;
@end

NS_ASSUME_NONNULL_END
