//
//  UIView+ShakeTool.m
//  XPTextField-master
//
//  Created by iMac on 2017/9/5.
//  Copyright © 2017年 eirc. All rights reserved.
//

#import "UIView+ShakeTool.h"
#import <AudioToolbox/AudioToolbox.h>

@implementation UIView (ShakeTool)

+ (void)shakeAnimationForView:(UIView *) view
{
    AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
    // 获取到当前的View
    CALayer *viewLayer = view.layer;
    // 获取当前View的位置
    CGPoint position = viewLayer.position;
    // 移动的两个终点位置
    CGPoint x = CGPointMake(position.x + 10, position.y);
    CGPoint y = CGPointMake(position.x - 10, position.y);
    // 设置动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    // 设置运动形式
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
    // 设置开始位置
    [animation setFromValue:[NSValue valueWithCGPoint:x]];
    // 设置结束位置
    [animation setToValue:[NSValue valueWithCGPoint:y]];
    // 设置自动反转
    [animation setAutoreverses:YES];
    // 设置时间
    [animation setDuration:.06];
    // 设置次数
    [animation setRepeatCount:3];
    // 添加上动画
    [viewLayer addAnimation:animation forKey:nil];
}

@end
