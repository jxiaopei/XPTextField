//
//  XPTextField.m
//  XPTextField-master
//
//  Created by iMac on 2017/9/4.
//  Copyright © 2017年 eirc. All rights reserved.
//

#import "XPTextField.h"
#import "UIView+ShakeTool.h"
#import "UIView+GetValues.h"

@interface XPTextField()

@property(nonatomic,strong)UIView *promptView;                 //提示view
@property(nonatomic,strong)UILabel *promptLabel;               //提示内容的label
@property (nonatomic, strong) UIImageView * promptImageView;   //警示图

@end

@implementation XPTextField

-(instancetype)initWithFrame:(CGRect)frame{
    if(self == [super initWithFrame:frame]){
        [self setupUI];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if(self == [super initWithCoder:aDecoder]){
        [self setupUI];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame andTextFieldType:(TextFieldType)textFieldType
{
    if(self == [super initWithFrame:frame]){
        [self setupUI];
        //设置密码框的输入隐藏属性
        if(textFieldType == PassWordTextFieldType){
            self.secureTextEntry = YES;
        }
    }
    return self;
}

-(void)setupUI{
    //设置外边框
    self.borderStyle = UITextBorderStyleRoundedRect;
    //设置默认字体
    self.font = [UIFont systemFontOfSize:15];
    //设置清空键的模式
    self.clearButtonMode = UITextFieldViewModeWhileEditing;
    //设置左右view 和默认颜色
    self.leftViewMode = UITextFieldViewModeAlways;
    self.rightViewMode = UITextFieldViewModeAlways;
    self.backgroundColor = [UIColor clearColor];
    //设置震动view
    _isShakeTextField = YES;
    
    //设置开始编辑的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textBeginEditing:) name:UITextFieldTextDidBeginEditingNotification object:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textBeginEditing:) name:UITextFieldTextDidChangeNotification object:self];
}

- (void)textBeginEditing:(NSNotification*)notification
{
    //当开始编辑时 隐藏右边的提示view
    self.rightView.hidden = YES;
    self.rightView = nil;
}

- (void)textEndEditing:(NSNotification*)notification
{
    //停止编辑时 打开右边提示view
    self.rightView = self.promptView;
    self.rightView.backgroundColor = [UIColor blackColor];
    self.rightView.hidden = NO;
    
}

-(void)setTextFieldType:(TextFieldType)textFieldType
{
    //设置密码框的输入隐藏属性
    if(textFieldType == PassWordTextFieldType){
        self.secureTextEntry = YES;
    }
}

- (void)setPromptText:(NSString *)promptText
{
    _promptText = promptText;
    self.promptLabel.text = _promptText;
    //设置字体
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:13]};
    //计算字体占用的面积
    CGSize size = [promptText boundingRectWithSize:CGSizeMake(200, 20)
                                           options: NSStringDrawingTruncatesLastVisibleLine |
                   NSStringDrawingUsesLineFragmentOrigin |
                   NSStringDrawingUsesFontLeading
                                        attributes:attribute
                                           context:nil].size;
    self.promptImageView.frame = CGRectMake(0, 0, 20, 20);
    self.promptLabel.frame = CGRectMake(self.promptImageView.right, 0, size.width, 20);
    //调整提示view的宽度
    self.promptView.width = self.promptImageView.width + size.width;
    
    self.rightView = self.promptView;
    self.rightView.hidden = NO;
    //调用震动view的方法
    if(_isShakeTextField){
       [UIView shakeAnimationForView:self];
    }
    
}

- (UIView *)promptView
{
    if (!_promptView)
    {
        _promptView = [[UIView alloc] initWithFrame:CGRectMake(0, 5, 200, 20)];
    }
    return _promptView;
}

- (UILabel *)promptLabel
{
    if (!_promptLabel)
    {
        _promptLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _promptLabel.backgroundColor = [UIColor clearColor];
        _promptLabel.textColor = [[UIColor redColor] colorWithAlphaComponent:0.6];
        _promptLabel.textAlignment = NSTextAlignmentCenter;
        _promptLabel.numberOfLines = 1;
        _promptLabel.font = [UIFont systemFontOfSize:13];
        [self.promptView addSubview:_promptLabel];
    }
    return _promptLabel;
}

- (UIImageView *)promptImageView
{
    if (!_promptImageView)
    {
        _promptImageView = [[UIImageView alloc] init];
        _promptImageView.image = [UIImage imageNamed:@"Prompt_Note"];
        _promptImageView.contentMode = UIViewContentModeCenter;
        [self.promptView addSubview:_promptImageView];
    }
    return _promptImageView;
}

- (CGRect)rightViewRectForBounds:(CGRect)bounds
{
    return CGRectMake(bounds.size.width - self.promptView.width - 5, (bounds.size.height - self.promptView.height)/2, self.promptView.width, self.promptView.height);
}



@end
