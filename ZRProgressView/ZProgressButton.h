//
//  ZProgressButton.h
//  ZProgress
//
//  Created by rogue on 2017/6/12.
//  Copyright © 2017年 dazhongge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZProgressButton : UIButton

+ (instancetype)initWithFrame:(CGRect)frame circleFrame:(CGRect)circleFrame strokeColor:(UIColor *)strokeColor backgroundColor:(UIColor *)backgroundColor duration:(CGFloat)duration;

- (void)beginAnimation;

- (void)endAnimation;

@end
