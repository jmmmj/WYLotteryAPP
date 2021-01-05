//
//  RotateView.m
//  01-大转盘
//
//  Created by HUST on 2020/12/26.
//

#import "RotateView.h"


@interface RotateView ()
@property (weak, nonatomic) IBOutlet UIImageView *rotateImage;
@property (weak,nonatomic)UIButton *currentButton;
@property (strong,nonatomic)CADisplayLink *link;
@end

@implementation RotateView

+(instancetype)rotateView
{
    return [[NSBundle mainBundle]loadNibNamed:@"RotateView" owner:nil options:nil][0];
}


//创建十二个button
-(void)awakeFromNib{
    [super awakeFromNib];
    for(int i=0;i<12;++i){
        UIButton *btn = [[UIButton alloc]init];
        
        btn.tag=i;
        
        [btn setUserInteractionEnabled:YES];
        UIImage *image=[UIImage imageNamed:@"UI06"];
        image = [self clipImageWithImage:image withIndex:i];
        [btn setImage:image forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor clearColor]];
        UIImage *imagePressed=[UIImage imageNamed:@"UI07"];
        imagePressed = [self clipImageWithImage:imagePressed withIndex:i];
        [btn setImage:imagePressed forState:UIControlStateSelected];
       
        
        [btn setImageEdgeInsets:UIEdgeInsetsMake(-70, 0, 0, 0)];
        
        [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.rotateImage addSubview:btn];
    }
}

- (IBAction)pickNunber:(id)sender
{
    
    
    if([self.rotateImage.layer animationForKey:@"rotateKey"]){
        return;
    }
    
    
    self.link.paused=YES;
    CABasicAnimation* anim = [[CABasicAnimation alloc]init];
    anim.keyPath = @"transform.rotation";
    
    CGFloat angle= 2*M_PI/12*self.currentButton.tag;
    anim.toValue = @(5*M_PI*2-angle);
    anim.duration=1;
    
    anim.fillMode=kCAFillModeForwards;
    anim.removedOnCompletion=NO;
    [self.rotateImage.layer addAnimation:anim forKey:@"rotateKey"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW,(int64_t)(anim.duration *NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.rotateImage.transform=CGAffineTransformMakeRotation(-angle);
        
        if(self.currentButton){
            [self.viewController showAlert];
        }else{
            [self.viewController showError];
        }
        
        [self.rotateImage.layer removeAnimationForKey:@"rotateKey"];
    });
}


-(void)startRotate
{
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(rotate)];
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    self.link = link;
}

-(void)rotate
{
    self.rotateImage.transform = CGAffineTransformRotate(self.rotateImage.transform,2*M_PI/60/10);
}


//布局子控件的位置
-(void)layoutSubviews{
    [super layoutSubviews];
    for(int i=0;i<self.rotateImage.subviews.count;++i)
    {
        UIButton* btn = self.rotateImage.subviews[i];
        
        //摄制中心
        btn.center=self.rotateImage.center;
        //设置frame
        btn.bounds=CGRectMake(0,0, 68, 163);
        btn.layer.anchorPoint=CGPointMake(0.5, 1);
        //计算一个按钮的夹角
        CGFloat angle=2*M_PI/12;
        btn.transform = CGAffineTransformMakeRotation(angle*i);
    }
    
}


-(void)buttonClick:(UIButton*)sender{
    self.currentButton.selected=NO;
    sender.selected=YES;
    self.currentButton =sender;
}

- (UIImage*)clipImageWithImage:(UIImage*)image withIndex:(NSInteger)index{
    
    CGFloat w=image.size.width/12;
    CGFloat h=image.size.height;
    CGFloat x=index*w;
    CGFloat y=0;
    
    CGImageRef imageRef = CGImageCreateWithImageInRect(image.CGImage, CGRectMake(x, y, w, h));
    
    
    return [[UIImage alloc]initWithCGImage:imageRef scale:1.0 orientation:UIImageOrientationUp];
}
@end
