//
//  ZProgressViewController.m
//  ZProgress
//
//  Created by dazhongge on 2017/1/6.
//  Copyright © 2017年 dazhongge. All rights reserved.
//

#import "ZProgressViewController.h"
#import "ZProgressView.h"

@interface ZProgressViewController ()

@property (nonatomic, strong) ZProgressView *z1;

@property (nonatomic, assign) BOOL change;

@property (nonatomic, strong) NSTimer *testTime;

@end

@implementation ZProgressViewController

- (void)loadViews {

    [super loadViews];
    
    self.z1 = [[ZProgressView alloc] initWithFrame:CGRectMake(0, 0, 200, 200) circleFrame:CGRectMake(0, 0, 160, 160) strokeColor:[UIColor orangeColor] animationType:ZSlow];
//    self.z1 = [[ZProgressView alloc] init];
    self.z1.strokeStart = 0.1;
    self.z1.strokeEnd = 0.9;
//    self.z1.strokeColor = [UIColor orangeColor];
//    self.z1.animationType = ZSlow;
    [self.view addSubview:self.z1];
    
    UIButton *start = [UIButton buttonWithType:UIButtonTypeCustom];
    [start addTarget:self action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];
    start.backgroundColor = [UIColor orangeColor];
    start.frame = CGRectMake(75, 80, self.view.frame.size.width - 150, 35);
    [self.view addSubview:start];
    
    UIButton *clear = [UIButton buttonWithType:UIButtonTypeCustom];
    [clear addTarget:self action:@selector(clearAction:) forControlEvents:UIControlEventTouchUpInside];
    clear.backgroundColor = [UIColor redColor];
    clear.frame = CGRectMake(75, 120, self.view.frame.size.width - 150, 35);
    [self.view addSubview:clear];
    

    
}

- (void)loadLayout {

    [super loadLayout];
    self.z1.frame = CGRectMake(0, 0, 300, 300);
    self.z1.circleFrame = CGRectMake(0, 0, 300, 300);
    self.z1.center = self.view.center;
    
}

- (void)startAction:(UIButton *)sender {

//    self.z1.startAnimation = YES;
    self.testTime = [NSTimer scheduledTimerWithTimeInterval:0.01
                                                     target:self
                                                   selector:@selector(changesome)
                                                   userInfo:nil
                                                    repeats:YES];
}

- (void)clearAction:(UIButton *)sender {

    self.z1.clearAnimation = YES;

}

- (void)changesome {

    if(self.z1.controlProgress > 0.5) {
    
        [self.testTime invalidate];
        self.testTime = nil;
        return;
    
    }
    
    self.z1.controlProgress += 0.01;

}

@end
