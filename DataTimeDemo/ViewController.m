//
//  ViewController.m
//  DataTimeDemo
//
//  Created by mt y on 2017/11/1.
//  Copyright © 2017年 mt y. All rights reserved.
//

#import "ViewController.h"

#import "ClockFaceLayer.h"

#import "CoreGraghClock.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *myData;
@property (nonatomic,strong)ClockFaceLayer *layer;

@property (nonatomic, strong)CoreGraghClock *graghLock;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   //layer绘制的时钟
    self.layer = [ClockFaceLayer layer];
    
    self.layer.position = self.view.center;
    
    [self.view.layer addSublayer:self.layer];
    
    //CoreGraph绘制的时钟
    self.graghLock = [CoreGraghClock layer];
    self.graghLock.position = CGPointMake(100, 100);
    NSDateFormatter *fomatter = [NSDateFormatter new];
    [fomatter setDateFormat:@"HH:mm:ss"];
    NSString *myDate = [fomatter stringFromDate:[NSDate date]];
    NSArray *arr = [myDate componentsSeparatedByString:@":"];
    self.graghLock.house = [arr[0] floatValue];
    self.graghLock.minute = [arr[1] floatValue];
    self.graghLock.scend = [arr[2] floatValue];
    [self.view.layer addSublayer:self.graghLock];
    
    self.layer.date = [NSDate date];
    
 

    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(upData) userInfo:nil repeats:YES];
}


- (void)upData
{
    [self.myData setDate:[NSDate date] animated:YES];
     self.layer.date = self.myData.date;
    
    NSDateFormatter *fomatter = [NSDateFormatter new];
    [fomatter setDateFormat:@"HH:mm:ss"];
    NSString *myDate = [fomatter stringFromDate:self.myData.date];
    NSArray *arr = [myDate componentsSeparatedByString:@":"];
    NSLog(@"%f--%ld",[arr[0] floatValue],[arr[0] integerValue]);
    
    self.graghLock.house = [arr[0] floatValue];
    self.graghLock.minute = [arr[1] floatValue];
    self.graghLock.scend = [arr[2] floatValue];
    
}
@end
