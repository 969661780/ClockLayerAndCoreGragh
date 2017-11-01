//
//  CoreGraghClock.h
//  DataTimeDemo
//
//  Created by mt y on 2017/11/1.
//  Copyright © 2017年 mt y. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import <UIKit/UIKit.h>

@interface CoreGraghClock : CAShapeLayer

@property (nonatomic, assign)CGFloat house;//小时

@property (nonatomic, assign)CGFloat minute;//分

@property (nonatomic, assign)CGFloat scend;//秒

@end
