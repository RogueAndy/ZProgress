//
//  ZProgressViewController_1.m
//  ZProgress
//
//  Created by rogue on 2017/6/12.
//  Copyright © 2017年 dazhongge. All rights reserved.
//

#import "ZProgressViewController_1.h"
#import "ZProgressButton.h"

@interface ZProgressViewController_1 ()

@property (nonatomic, strong) ZProgressButton *pro;

@end

@implementation ZProgressViewController_1

- (void)loadViews {

    _pro = [ZProgressButton initWithFrame:CGRectMake(0, 0, 200, 200) circleFrame:CGRectMake(0, 0, 184, 184) strokeColor:[UIColor greenColor] backgroundColor:[UIColor grayColor] duration:15];
    _pro.center = CGPointMake(CGRectGetWidth(self.view.frame) / 2.0, CGRectGetHeight(self.view.frame) / 2.0 - 80);
    [self.view addSubview:_pro];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor grayColor];
    [button addTarget:self action:@selector(begin) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [button setTitle:@"开始" forState:UIControlStateNormal];
    button.frame = CGRectMake(30, _pro.frame.size.height + _pro.frame.origin.y + 50, CGRectGetWidth(self.view.frame) - 60, 40);
    [self.view addSubview:button];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.backgroundColor = [UIColor grayColor];
    [button1 addTarget:self action:@selector(end) forControlEvents:UIControlEventTouchUpInside];
    [button1 setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [button1 setTitle:@"停止" forState:UIControlStateNormal];
    button1.frame = CGRectMake(30, button.frame.size.height + button.frame.origin.y + 50, CGRectGetWidth(self.view.frame) - 60, 40);
    [self.view addSubview:button1];

}

- (void)end {

    [_pro endAnimation];

}

- (void)begin {

    [_pro beginAnimation];

}

@end
