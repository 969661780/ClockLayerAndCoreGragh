//
//  ClockFaceLayer.m
//  DataTimeDemo
//
//  Created by mt y on 2017/11/1.
//  Copyright © 2017年 mt y. All rights reserved.
//




#import "ClockFaceLayer.h"

@interface ClockFaceLayer ()

@property (nonatomic, strong)CAShapeLayer *houseLayer;//小时layer

@property (nonatomic, strong)CAShapeLayer *miuLayer;//分钟Layer

@property (nonatomic, strong)CAShapeLayer *sencenLayer;//秒钟layer

@end

@implementation ClockFaceLayer

- (id)init
{
    self = [super init];
    if (self) {
        self.bounds = CGRectMake(0, 0, 200, 200);
        self.path = [UIBezierPath bezierPathWithOvalInRect:self.bounds].CGPath;
        self.fillColor = [UIColor whiteColor].CGColor;
        self.lineWidth = 4;
        self.strokeColor = [UIColor grayColor].CGColor;
        
        self.houseLayer = [CAShapeLayer layer];
        self.houseLayer.path = [UIBezierPath bezierPathWithRect:CGRectMake(-2, -70, 4, 70)].CGPath;
        self.houseLayer.fillColor = [UIColor blackColor].CGColor;
        self.houseLayer.position = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
        [self addSublayer:self.houseLayer];
        
        self.miuLayer = [CAShapeLayer layer];
        self.miuLayer.path = [UIBezierPath bezierPathWithRect:CGRectMake(-1, -80, 2, 80)].CGPath;
        self.miuLayer.fillColor = [UIColor grayColor].CGColor;
        self.miuLayer.position = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
        [self addSublayer:self.miuLayer];
        
        
        self.sencenLayer = [CAShapeLayer layer];
        self.sencenLayer.path = [UIBezierPath bezierPathWithRect:CGRectMake(-0.5, -90, -1, 90)].CGPath;
        self.sencenLayer.fillColor = [UIColor redColor].CGColor;
        self.sencenLayer.position = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
        [self addSublayer:self.sencenLayer];
    }
    return self;
}
#pragma mark -Seter
- (void)setDate:(NSDate *)date
{
    _date = date;
    NSDateFormatter *fomatter = [NSDateFormatter new];
    [fomatter setDateFormat:@"HH:mm:ss"];
    NSString *myDate = [fomatter stringFromDate:date];
    NSArray *arr = [myDate componentsSeparatedByString:@":"];
    self.houseLayer.affineTransform = CGAffineTransformMakeRotation([arr[0] integerValue]/12.0 * 2.0 * M_PI);
    self.miuLayer.affineTransform = CGAffineTransformMakeRotation([arr[1] integerValue]/60.0 * 2.0 * M_PI);
    self.sencenLayer.affineTransform = CGAffineTransformMakeRotation([arr[2] integerValue]/60.0 * 2.0 *M_PI);
}
@end
