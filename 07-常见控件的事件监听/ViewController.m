//
//  ViewController.m
//  07-常见控件的事件监听
//
//  Created by xiaomage on 16/6/7.
//  Copyright © 2016年 赵恩峰. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate ,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.UIButton
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

    // 2.UIScrollView
    UIScrollView *scrollView = nil;
    //代理
    scrollView.delegate  = self;
    
    // 3.UISegmentedControl
//    UISegmentedControl *control = [[UISegmentedControl alloc] initWithItems:@[@"123",@"234",@"345",@"789"]];
//    control.selectedSegmentIndex = 0;
//    control.center = CGPointMake(100, 200);
//    [control addTarget:self action:@selector(sgClick:) forControlEvents:UIControlEventValueChanged];
//    [self.view addSubview:control];
    
    // 4.textField
    //这里使用了继承UIControl的方法,有addtaiget   下边我们做了3个方法.
//    [self.textField addTarget:self action:@selector(tfEditingDidBegin) forControlEvents:UIControlEventEditingDidBegin];
//     [self.textField addTarget:self action:@selector(tfEditingDidEnd) forControlEvents:UIControlEventEditingDidEnd];
//    [self.textField addTarget:self action:@selector(tfEditingChange:) forControlEvents:UIControlEventEditingChanged];
    self.textField.delegate = self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 退出键盘
//    [self.textField endEditing:YES];
    // 辞去第一响应者
//    [self.textField resignFirstResponder];
    
    [self.view endEditing:YES];
    
    
}
#pragma mark  - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"开始编辑");
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"结束编辑");
}

/**
 *  当textField文字发生改变的时候就会调用这个方法
 *  @param string    用户输入的文字
 *
 *  @return YES:允许用户输入;NO:禁止用户输入
 */
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSLog(@"shouldChangeCharactersInRange--%@",string);
    
    if ([string isEqualToString:@"1"]) {
        return NO;
    }
    return YES;
}


#pragma mark - textField的监听方法
- (void)tfEditingDidBegin
{
    NSLog(@"开始编辑");
}

- (void)tfEditingDidEnd
{
    NSLog(@"结束编辑");
}

- (void)tfEditingChange:(UITextField *)tf
{
    NSLog(@"文字改变--%@",tf.text);
}






- (void)sgClick:(UISegmentedControl *)sg
{
    NSLog(@"sgClick-%zd",sg.selectedSegmentIndex);
}
- (void)btnClick:(UIButton *)btn
{
    NSLog(@"btnClick");
}

@end
