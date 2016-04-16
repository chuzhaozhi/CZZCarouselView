//
//  ViewController.m
//  CZZCarouselView
//
//  Created by CZZ on 16/4/15.
//  Copyright © 2016年 CZZ. All rights reserved.
//

#import "ViewController.h"
#import "CZZCarouselView.h"
@interface ViewController ()<CZZCarouselViewDelegate>
@property (nonatomic,strong)CZZCarouselView *carouselView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //  本地图片
    NSArray *localImageArray = @[[UIImage imageNamed:@"1.jpg"],[UIImage imageNamed:@"2.jpg"],[UIImage imageNamed:@"3.jpg"]];
    //  网络图片
    NSArray *netImageArray = @[@"http://www.5068.com/u/faceimg/20140725173411.jpg",@"http://file27.mafengwo.net/M00/52/F2/wKgB6lO_PTyAKKPBACID2dURuk410.jpeg",@"http://file27.mafengwo.net/M00/B2/12/wKgB6lO0ahWAMhL8AAV1yBFJDJw20.jpeg"];
    //  混合图片
    NSArray *maxImageArray = @[@"http://file27.mafengwo.net/M00/B2/12/wKgB6lO0ahWAMhL8AAV1yBFJDJw20.jpeg",[UIImage imageNamed:@"1.jpg"],@"http://file27.mafengwo.net/M00/52/F2/wKgB6lO_PTyAKKPBACID2dURuk410.jpeg",[UIImage imageNamed:@"1.jpg"]];
    
    //  图片描述数组
    NSArray *describleArray = @[@"1",@"2",@"3",@"4"];
    
    self.carouselView = [CZZCarouselView carouselViewWithImageArray:maxImageArray describeArray:describleArray];
    
    //  设置frame
    self.carouselView.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 180);
    
    //  用block处理图片点击
    self.carouselView.imageClickBlock = ^(NSInteger index){
        NSLog(@"点击了第%ld张图片",index);
    };
    
    //  用代理处理点击图片事件，如果两个方法都实现，block优先级高于代理
//    self.carouselView.delegate = self;
    
    //  设置每张图片的停留时间
    _carouselView.time = 1;
    
    //  设置分页控件的图片，不设置则为系统默认
    [_carouselView setPageImage:[UIImage imageNamed:@"other"] andCurrentImage:[UIImage imageNamed:@"current"]];
    
    //  设置分页控制的位置，默认为PositionBottomCenter
    _carouselView.pagePosition = PositionBottomCenter;
    
    /**
     *  设置图片描述控件
     */
    //  设置背景颜色，默认为黑色半透明
    _carouselView.desLabelBgColor = [[UIColor blueColor] colorWithAlphaComponent:0.5];
    //  设置字体，默认为13号字
    _carouselView.desLabelFont = [UIFont systemFontOfSize:14];
    //  设置文字颜色，默认为白色
    _carouselView.desLabelColor = [UIColor greenColor];
    _carouselView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_carouselView];
}

#pragma mark - CZZCarouseViewDelagate  方法
-(void)carouselView:(CZZCarouselView *)carouselView didClickImage:(NSInteger)index
{
    NSLog(@"点击了第%ld张图片",index);
}
- (IBAction)startButton:(id)sender {
    [_carouselView startTimer];
}
- (IBAction)stopButton:(id)sender {
    [_carouselView stopTimer];
}

@end
