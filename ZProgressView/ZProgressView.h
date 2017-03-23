//
//  ZProgressView.h
//  ZProgress
//
//  Created by dazhongge on 2017/1/6.
//  Copyright © 2017年 dazhongge. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 动画效果的快慢类型

 - ZQuickly: 较快的动画速度
 - ZCommon: 普通的动画速度
 - ZSlow: 较慢的动画速度
 */
typedef NS_ENUM(NSInteger, ZAnimationType) {

    ZQuickly = 0,
    ZCommon  = 1,
    ZSlow    = 2

};

@interface ZProgressView : UIView

/**
 动画效果的快慢类型
 */
@property (nonatomic) ZAnimationType animationType;

/**
 设置环形动画填充需要的颜色
 */
@property (nonatomic, strong) UIColor *strokeColor;

/**
 设置圆形进度条的大小
 */
@property (nonatomic) CGRect circleFrame;

/**
 开始动画
 */
@property (nonatomic, assign) BOOL startAnimation;

/**
 清除界面效果的时候是否添加动画
 */
@property (nonatomic, assign) BOOL clearAnimation;

/**
 环形进度条起始的位置（以 X 轴正方向水平线为起始位置, 0 <= strokeStart < 1，顺时针旋转）
 */
@property (nonatomic) CGFloat strokeStart;

/**
 环形进度条结束的位置（以 X 轴正方向水平线为结束位置, 0 < strokeStart =< 1，顺时针旋转）
 */
@property (nonatomic) CGFloat strokeEnd;

/**
 初始化一个对象

 @param frame 当前view的frame大小
 @param circleFrame 进度条的大小
 @param strokeColor 填充进度条的颜色
 @param type 动画效果的速度
 @return 对象
 */
- (instancetype)initWithFrame:(CGRect)frame circleFrame:(CGRect)circleFrame strokeColor:(UIColor *)strokeColor animationType:(ZAnimationType)type;




/**
 控制当前的完成的百分比
 */
@property (nonatomic) CGFloat controlProgress;

@end
