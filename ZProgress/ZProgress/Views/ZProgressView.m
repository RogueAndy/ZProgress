//
//  ZProgressView.m
//  ZProgress
//
//  Created by dazhongge on 2017/1/6.
//  Copyright © 2017年 dazhongge. All rights reserved.
//

#import "ZProgressView.h"

@interface ZProgressView()

@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@property (nonatomic, strong) NSTimer *animationTimer;

@property (nonatomic) CGFloat countNumber;

@end

@implementation ZProgressView

- (instancetype)initWithFrame:(CGRect)frame circleFrame:(CGRect)circleFrame {

    if(self = [super initWithFrame:frame]) {
    
        self.circleFrame = circleFrame;
        [self loadInit];
        [self loadViews];
        [self loadLayout];
        
    }
    
    return self;

}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if(self = [super initWithFrame:frame]) {
        
        [self loadInit];
        [self loadViews];
        [self loadLayout];
        
    }
    
    return self;
    
}

- (void)setCircleFrame:(CGRect)circleFrame {

    _circleFrame = circleFrame;
    [self loadLayout];

}

- (void)setStartAnimation:(BOOL)startAnimation {

    _startAnimation = startAnimation;
    if(_startAnimation) {
    
        [self.animationTimer invalidate];
        self.animationTimer = nil;
        self.countNumber = self.shapeLayer.strokeEnd;
        self.animationTimer = [NSTimer scheduledTimerWithTimeInterval:0.005 target:self selector:@selector(startAction:) userInfo:nil repeats:YES];
        return;
        
    }
    
    [self.animationTimer invalidate];
    self.animationTimer = nil;
    

}

- (void)setClearAnimation:(BOOL)clearAnimation {

    _clearAnimation = clearAnimation;
    if(_clearAnimation) {
    
        [self.animationTimer invalidate];
        self.animationTimer = nil;
        self.countNumber = self.shapeLayer.strokeEnd;
        self.animationTimer = [NSTimer scheduledTimerWithTimeInterval:0.005 target:self selector:@selector(clearAction:) userInfo:nil repeats:YES];
        return;
        
    }
    
    self.shapeLayer.strokeEnd = 0;

}

- (void)loadInit {

    
    
}

- (void)loadViews {

    self.shapeLayer = [CAShapeLayer layer];
    self.shapeLayer.fillColor = [[UIColor clearColor] CGColor];
    self.shapeLayer.lineWidth = 75.f;
    self.shapeLayer.strokeColor = [[UIColor blueColor] CGColor];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.circleFrame];
    self.shapeLayer.path = path.CGPath;
    [self.layer addSublayer:self.shapeLayer];
    
}

- (void)loadLayout {

    self.shapeLayer.frame = self.circleFrame;
    self.shapeLayer.position = CGPointMake(self.frame.size.width / 2.0, self.frame.size.height / 2.0);
    
}


- (void)layoutSubviews {

    [super layoutSubviews];
    
    [self loadLayout];
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.circleFrame];
    self.shapeLayer.path = path.CGPath;
    self.shapeLayer.strokeStart = 0;
    self.shapeLayer.strokeEnd = 0.1;
    
}

#pragma mark - selector action

- (void)startAction:(NSTimer *)timer {

    if(self.countNumber >= 1) {
    
        self.shapeLayer.strokeEnd = 1;
        [self.animationTimer invalidate];
        self.animationTimer = nil;
        return;
    
    }
    
    self.shapeLayer.strokeEnd = self.countNumber;
    self.countNumber += 0.001;

}

- (void)clearAction:(NSTimer *)timer {

    if(self.countNumber <= 0) {
    
        self.shapeLayer.strokeEnd = 0;
        [self.animationTimer invalidate];
        self.animationTimer = nil;
        return;
        
    }
    
    self.shapeLayer.strokeEnd = self.countNumber;
    self.countNumber -= 0.001;

}

@end
