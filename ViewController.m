//
//  ViewController.m
//  AnimationTransitions
//
//  Created by xiangxx on 16/5/30.
//  Copyright © 2016年 xiangxx. All rights reserved.
//

#import "ViewController.h"

#define kBackgroundColor1 [UIColor redColor]
#define kBackgroundColor2 [UIColor yellowColor]
#define kDurationTime 0.7f

@interface ViewController ()

@property (nonatomic,assign) int subType;

@end

typedef enum : NSUInteger{
    Fade = 1,               //淡入淡出
    Push,                   //推挤
    Reveal,                 //揭开
    MoveIn,                 //覆盖
    Cube,                   //立方体
    SuckEffect,             //吸附
    OglFlip,                //翻转
    RippleEffect,           //波纹
    PageCurl,               //翻页
    PageUnCurl,             //反翻页
    CameraIrisHollowOpen,   //开镜头
    CameraIrisHollowClose,  //关镜头
    CurlDown,               //下翻转
    CurlUp,                 //上翻转
    FlipFromLeft,           //左翻转
    FlipFromRight,          //右翻转
    
}AnimationType;


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.subType = 0;
    
    [self showViewBgWithName:kBackgroundColor2];
    
}

- (IBAction)tagButtonAction:(id)sender {
    
    UIButton *button = sender;
    AnimationType animationType = button.tag;
    
    NSString *subtypeString;
    
    // 设置方向
    switch (self.subType) {
        case 0:
            subtypeString = kCATransitionFromLeft;
            break;
        case 1:
            subtypeString = kCATransitionFromBottom;
            break;
        case 2:
            subtypeString = kCATransitionFromRight;
            break;
        case 3:
            subtypeString = kCATransitionFromTop;
            break;
        default:
            break;
    }
    
    _subType += 1;
    if (_subType > 3) {
        _subType = 0;
    }
    
    // QuartzCore 动画
    switch (animationType) {
        case Fade:
            [self transitionWithType:kCATransitionFade WithSubtype:subtypeString ForView:self.view];
            break;
            
        case Push:
            [self transitionWithType:kCATransitionPush WithSubtype:subtypeString ForView:self.view];
            break;
            
        case Reveal:
            [self transitionWithType:kCATransitionReveal WithSubtype:subtypeString ForView:self.view];
            break;
            
        case MoveIn:
            [self transitionWithType:kCATransitionMoveIn WithSubtype:subtypeString ForView:self.view];
            break;
            
        case Cube:
            [self transitionWithType:@"cube" WithSubtype:subtypeString ForView:self.view];
            break;
            
        case SuckEffect:
            [self transitionWithType:@"suckEffect" WithSubtype:subtypeString ForView:self.view];
            break;
            
        case OglFlip:
            [self transitionWithType:@"oglFlip" WithSubtype:subtypeString ForView:self.view];
            break;
            
        case RippleEffect:
            [self transitionWithType:@"rippleEffect" WithSubtype:subtypeString ForView:self.view];
            break;
            
        case PageCurl:
            [self transitionWithType:@"pageCurl" WithSubtype:subtypeString ForView:self.view];
            break;
            
        case PageUnCurl:
            [self transitionWithType:@"pageUnCurl" WithSubtype:subtypeString ForView:self.view];
            break;
            
        case CameraIrisHollowOpen:
            [self transitionWithType:@"cameraIrisHollowOpen" WithSubtype:subtypeString ForView:self.view];
            break;
            
        case CameraIrisHollowClose:
            [self transitionWithType:@"cameraIrisHollowClose" WithSubtype:subtypeString ForView:self.view];
            break;
            
            
            
            
        case CurlDown:
            [self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionCurlDown];
            break;
            
        case CurlUp:
            [self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionCurlUp];
            break;
            
        case FlipFromLeft:
            [self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionFlipFromLeft];
            break;
            
        case FlipFromRight:
            [self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionFlipFromRight];
            break;
            
        default:
            break;
    }
    
    static int i = 0;
    if (i == 0) {
        [self showViewBgWithName:kBackgroundColor1];
        i = 1;
    }else{
        [self showViewBgWithName:kBackgroundColor2];
        i = 0;
    }
}

- (void)showViewBgWithName:(UIColor *)color{
    self.view.backgroundColor = color;
}


#pragma mark CATransition 动画实现
- (void)transitionWithType:(NSString *)type WithSubtype:(NSString *)subType ForView:(UIView *)View{
    
    //创建Catransition对象
    CATransition *animation = [CATransition animation];
    
    //设置运动时间
    animation.duration = kDurationTime;
    
    //设置运动type
    animation.type = type;
    
    if (subType != nil) {
        // 设置子类
        animation.subtype = subType;
    }
    
    // 设置运动速度
    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    
    [View.layer addAnimation:animation forKey:@"animation"];
    
}


#pragma mark UIView 实现动画
- (void)animationWithView:(UIView *)view WithAnimationTransition:(UIViewAnimationTransition)transition{
    
    [UIView animateWithDuration:kDurationTime animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationTransition:transition forView:view cache:YES];
    }];
}


@end
