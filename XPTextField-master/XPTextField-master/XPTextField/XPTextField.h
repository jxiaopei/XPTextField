//
//  XPTextField.h
//  XPTextField-master
//
//  Created by iMac on 2017/9/4.
//  Copyright © 2017年 eirc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,TextFieldType){
    
    NormalTextFieldType   = 0,   //默认类型
    PassWordTextFieldType,       //密码类型
};

@interface XPTextField : UITextField

@property(nonatomic,assign)TextFieldType textFieldType;    //输入类型

@property (nonatomic,copy)NSString * promptText;           //提示文字

@property(nonatomic,assign)BOOL isShakeTextField;          //是否震动提示 默认yes

-(instancetype)initWithFrame:(CGRect)frame andTextFieldType:(TextFieldType)textFieldType;

@end
