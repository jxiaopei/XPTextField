//
//  ViewController.m
//  XPTextField-master
//
//  Created by iMac on 2017/9/4.
//  Copyright © 2017年 eirc. All rights reserved.
//

#import "ViewController.h"
#import "XPTextField.h"
#import "NSString+Utility.h"

#define SCREENHEIGHT  [UIScreen mainScreen].bounds.size.height   //屏幕高
#define SCREENWIDTH   [UIScreen mainScreen].bounds.size.width    //屏幕宽

@interface ViewController ()

@property(nonatomic,strong)XPTextField *normalTextField;
@property(nonatomic,strong)XPTextField *passwordTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化normalTextField
    _normalTextField = [[XPTextField alloc]initWithFrame:CGRectMake(10, SCREENHEIGHT/2 -50, SCREENWIDTH -20, 30) andTextFieldType:NormalTextFieldType];
    [self.view addSubview:_normalTextField];
    //设置提示文字
    _normalTextField.placeholder = @"请输入您的昵称";
    //初始化passwordTextField
    _passwordTextField = [[XPTextField alloc]initWithFrame:CGRectMake(10, SCREENHEIGHT/2 -10, SCREENWIDTH-20, 30) andTextFieldType:PassWordTextFieldType];
    [self.view addSubview:_passwordTextField];
    //设置提示文字
    _passwordTextField.placeholder = @"请输入您的密码";
    UIButton *testBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREENWIDTH/2 -30 , SCREENHEIGHT/2 + 40, 60, 30)];
    [self.view addSubview:testBtn];
    //设置按钮外边框
    testBtn.layer.borderWidth = 1;
    //设置圆角
    testBtn.layer.masksToBounds = YES;
    testBtn.layer.cornerRadius = 8;
    //设置按钮文字
    [testBtn setTitle:@"测试" forState:UIControlStateNormal];
    //设置按钮文字颜色
    [testBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //添加点击事件
    [testBtn addTarget:self action:@selector(didClickTestBtn:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)didClickTestBtn:(UIButton *)sender{
    //判断文字是否不符合条件
    if(![_normalTextField.text isNotNil]){
        //设置提示内容
        _normalTextField.promptText = @"昵称不能为空";
        return;
    }
    //判断文字是否不符合条件
    if(![_passwordTextField.text isNotNil]){
        //设置提示内容
        _passwordTextField.promptText = @"密码不能为空";
        return;
    }
    
    //添加提示成功对话框  表明测试成功
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"恭喜!" message:@"测试成功" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *completeAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:completeAction];
    [self presentViewController:alert animated:YES completion:nil];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //点击页面是结束输入
    [_normalTextField endEditing:YES];
    [_passwordTextField endEditing:YES];
}



@end
