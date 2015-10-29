//
//  WaterView.m
//  WaterView
//
//  Created by MyMac on 15/10/29.
//  Copyright © 2015年 MyMac. All rights reserved.
//

#import "WaterView.h"

@interface WaterView ()

@property (nonatomic,assign) CGFloat currentLinePointY;

@property (nonatomic,assign) CGFloat a;

@property (nonatomic,assign) CGFloat b;

@property (nonatomic,assign) BOOL jia;

@end

@implementation WaterView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        
        self.a = 1.5;
        self.b = 0;
        self.jia = NO;
        
        self.currentWaterColor = [UIColor blueColor];
        
        [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(animateWave) userInfo:nil repeats:YES];
        
    }
    return self;
}

- (void)animateWave{
    if (self.jia) {
        self.a += 0.01;
    }else{
        self.a -= 0.01;
    }
    
    if (self.a <= 1) {
        self.jia = YES;
    }
    
    if (self.a >= 1.5) {
        self.jia = NO;
    }
    
    self.b += 0.1;
    
    [self setNeedsDisplay];
    
}


- (void)setPercentNum:(CGFloat)percentNum{
    _percentNum = percentNum;
    
    self.currentLinePointY = self.bounds.size.height * (1.0f - _percentNum);
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.layer.cornerRadius = self.bounds.size.width * 0.5;
    self.layer.masksToBounds = YES;
    
}

- (void)drawRect:(CGRect)rect{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    
    //画水
    CGContextSetLineWidth(context, 1);
    CGContextSetFillColorWithColor(context, [self.currentWaterColor CGColor]);
    
    float y = self.currentLinePointY;
    
    CGPathMoveToPoint(path, nil, 0, y);
    
    for(float x = 0; x <= self.bounds.size.width; x++){
        y= self.a * sin( x / 180 * M_PI + 4 * self.b / M_PI ) * 5 + self.currentLinePointY;
        CGPathAddLineToPoint(path, nil, x, y);
    }
    
    CGPathAddLineToPoint(path, nil, self.bounds.size.width, rect.size.height);
    CGPathAddLineToPoint(path, nil, 0, rect.size.height);
    CGPathAddLineToPoint(path, nil, 0, self.currentLinePointY);
    
    CGContextAddPath(context, path);
    CGContextFillPath(context);
    CGContextDrawPath(context, kCGPathStroke);
    CGPathRelease(path);
    
}

@end
