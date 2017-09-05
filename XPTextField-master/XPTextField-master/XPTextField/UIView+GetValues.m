//
//  UIView+GetValues.m
//  XPTextField-master
//
//  Created by iMac on 2017/9/4.
//  Copyright © 2017年 eirc. All rights reserved.
//

#import "UIView+GetValues.h"

@implementation UIView (GetValues)

- (CGSize)size {
    return self.frame.size;
}

- (CGFloat)cx
{
    return self.center.x;
}

- (CGFloat)cy
{
    return self.center.y;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (void)setCx:(CGFloat)cx
{
    CGPoint center = self.center;
    center.x = cx;
    self.center = center;
}

- (void)setCy:(CGFloat)cy
{
    CGPoint center = self.center;
    center.y = cy;
    self.center = center;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setLeft:(CGFloat)left
{
    CGRect ori = self.frame;
    ori.origin.x = left;
    self.frame = ori;
}

- (CGFloat)left
{
    return self.frame.origin.x;
}

- (void)setRight:(CGFloat)right
{
    CGFloat left = right - self.width;
    [self setLeft:left];
}

- (CGFloat)right
{
    return self.left + self.width;
}

- (CGFloat)top
{
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)top
{
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}

- (void)setBottom:(CGFloat)bottom
{
    CGFloat top = bottom - self.height;
    [self setTop:top];
}

- (CGFloat)bottom
{
    return self.top + self.height;
}



@end
