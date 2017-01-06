//
//  ZProgressView.h
//  ZProgress
//
//  Created by dazhongge on 2017/1/6.
//  Copyright © 2017年 dazhongge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZProgressView : UIView

@property (nonatomic) CGRect circleFrame;

@property (nonatomic, assign) BOOL startAnimation;

@property (nonatomic, assign) BOOL clearAnimation;

- (instancetype)initWithFrame:(CGRect)frame circleFrame:(CGRect)circleFrame;

@end
