//
//  CoreGraghClock.m
//  DataTimeDemo
//
//  Created by mt y on 2017/11/1.
//  Copyright © 2017年 mt y. All rights reserved.
//

#import "CoreGraghClock.h"

@implementation CoreGraghClock

@dynamic house;

@dynamic minute;

@dynamic scend;
- (id)init
{
    if ((self = [super init])) {
        self.bounds = CGRectMake(0, 0, 200, 200);
        [self setNeedsDisplay];
    }
    return self;
}
//监听属性的变化

+(BOOL)needsDisplayForKey:(NSString *)key
{
    if ([@"house" isEqualToString:key] || [@"minute" isEqualToString:key] || [@"scend" isEqualToString:key]) {
        return YES;
    }
    return [super needsDisplayForKey:key];
}

- (id<CAAction>)actionForKey:(NSString *)key
{
    if ([@"house" isEqualToString:key])
    {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:key];
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];

        animation.fromValue = @([[self presentationLayer] house]);
        return animation;
    }else if ([@"minute" isEqualToString:key])
    {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:key];
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];

        animation.fromValue = @([[self presentationLayer] minute]);
        return animation;
    }else if([@"scend" isEqualToString:key]){
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:key];
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];

        animation.fromValue = @([[self presentationLayer] scend]);
        return animation;
    }
    return [super actionForKey:key];
}
- (void)display
{
    NSLog(@"%f---%f----%f",[self.presentationLayer house],[self.presentationLayer minute],[self.presentationLayer scend]);
    
    //创建绘制的上下文
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0);
    CGContextRef ctx= UIGraphicsGetCurrentContext();
    //绘制时钟面板
    CGContextSetLineWidth(ctx, 4);
    CGContextAddEllipseInRect(ctx, CGRectInset(self.bounds, 2, 2));
    //绘制时帧
    CGFloat angle = [self.presentationLayer house]/12.0 * 2.0 *M_PI;
    CGPoint point = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    CGContextSetLineWidth(ctx, 4);
    CGContextMoveToPoint(ctx, point.x, point.y);
    CGContextAddLineToPoint(ctx, point.x + sin(angle)*70, point.y - cos(angle)*70);
    CGContextStrokePath(ctx);
    
    //绘制分帧
    CGFloat angleMinute = [self.presentationLayer minute]/60.0 * 2.0 *M_PI;
    CGPoint pointMinute = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    CGContextSetLineWidth(ctx, 2);
    CGContextSetFillColorWithColor(ctx, [UIColor grayColor].CGColor);
    CGContextMoveToPoint(ctx, pointMinute.x, pointMinute.y);
    CGContextAddLineToPoint(ctx, point.x + sin(angleMinute)*80, point.y - cos(angleMinute)*80);
    CGContextStrokePath(ctx);
    
    //绘制秒针
    CGFloat angleScend = [self.presentationLayer scend]/60.0 * 2.0 *M_PI;
    CGPoint pointScend = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    CGContextSetLineWidth(ctx, 2);
    CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextMoveToPoint(ctx, pointScend.x, pointScend.y);
    CGContextAddLineToPoint(ctx, point.x + sin(angleScend)*80, point.y - cos(angleScend)*80);
    CGContextStrokePath(ctx);
    
    self.contents = (id)UIGraphicsGetImageFromCurrentImageContext().CGImage;
    UIGraphicsEndImageContext();
}
@end
