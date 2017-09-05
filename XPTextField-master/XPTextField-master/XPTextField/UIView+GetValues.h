//
//  UIView+GetValues.h
//  XPTextField-master
//
//  Created by iMac on 2017/9/4.
//  Copyright © 2017年 eirc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (GetValues)

@property (nonatomic, assign) CGPoint origin;   //X,Y值
@property (nonatomic, assign) CGFloat left;     //最右 即X
@property (nonatomic, assign) CGFloat right;    //最左 即X+宽度
@property (nonatomic, assign) CGFloat top;      //上  即Y
@property (nonatomic, assign) CGFloat bottom;   //下  即Y+高度
@property (nonatomic, assign) CGFloat width;    //宽度
@property (nonatomic, assign) CGFloat height;   //高度
@property (nonatomic, assign) CGFloat cx;       //中心点X
@property (nonatomic, assign) CGFloat cy;       //中心点Y
@property (nonatomic, assign) CGSize size;      //宽和高

@end
