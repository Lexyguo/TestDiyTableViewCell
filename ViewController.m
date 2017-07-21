//
//  ViewController.m
//  List_03
//
//  Created by lexyguo on 2017/7/14.
//  Copyright © 2017年 lexyguo. All rights reserved.
//
#define kUIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define SCREEN_HEIGHT             ([UIScreen mainScreen].bounds.size.height)
#define SCREEN_WIDTH              ([UIScreen mainScreen].bounds.size.width)
#define kScaleH  SCREEN_HEIGHT/667.0    // 4.7屏幕高度尺寸比例
#define kScaleW  SCREEN_WIDTH/375.0     // 4.7屏幕宽度尺寸比例
#import "ViewController.h"
#import "Masonry.h"
#import "TableViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) TableViewController *bodyview;
@property (nonatomic,strong) UISegmentedControl *select;
@property (nonatomic,strong) UILabel *titlelabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.automaticallyAdjustsScrollViewInsets=NO;
    [self setup];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setup{
    UIView *NavigationBar=[[UIView alloc]init];
    [self.view addSubview:NavigationBar];
    [NavigationBar mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.view).offset(20*kScaleH);
        make.left.equalTo(self.view).offset(0);
        make.right.equalTo(self.view).offset(0);
        make.height.mas_offset(85*kScaleH);
    }];
    
    self.titlelabel=[[UILabel alloc] init];
    self.titlelabel.text=@"我的投资";
    self.titlelabel.backgroundColor=[UIColor clearColor];
    self.titlelabel.textColor= [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.78/1.0];
    self.titlelabel.textAlignment=NSTextAlignmentCenter;
    [NavigationBar addSubview:self.titlelabel];
    [self.titlelabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(NavigationBar).offset(12);
        make.centerX.equalTo(NavigationBar);
        make.height.mas_offset(18);
    }];
    UIButton *leftBarButton=[UIButton buttonWithType:UIButtonTypeCustom];
    leftBarButton.backgroundColor=[UIColor clearColor];
    [NavigationBar addSubview:leftBarButton];
    [leftBarButton setImage:[UIImage imageNamed:@"nav_ic_back_hig@2x.png"] forState:UIControlStateNormal];
    [leftBarButton mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(NavigationBar).offset(12);
        make.left.equalTo(NavigationBar).offset(15);
        make.width.mas_offset(10);
        make.height.mas_offset(20);
    }];
    
    NSArray *SegmentArray=[[NSArray alloc] initWithObjects:@"已持有",@"处理中",@"已完成", nil];
    _select=[[UISegmentedControl alloc]initWithItems:SegmentArray];
    _select.selectedSegmentIndex=3;
    _select.tintColor=kUIColorFromRGB(0x00aaff);
    _select.segmentedControlStyle=UISegmentedControlSegmentCenter;
    _select.momentary=NO;
    [NavigationBar addSubview:_select];
    [_select mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(NavigationBar).offset(44*kScaleH);
        make.left.equalTo(NavigationBar).offset(15*kScaleW);
        make.right.equalTo(NavigationBar).offset(-15*kScaleW);
        make.bottom.equalTo(NavigationBar).offset(-11*kScaleH);
    }];
    
    
    UIView *body=[[UIView alloc]initWithFrame:CGRectMake(0,105,375, 562)];
    body.backgroundColor=[UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1/1.0];
    [self.view addSubview:body];
    self.bodyview=[[TableViewController alloc] init];
    [self addChildViewController:self.bodyview];
    [body addSubview:self.bodyview.view];
    [self.bodyview didMoveToParentViewController:self];
//    [self.bodyview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(body);
//        make.left.and.right.equalTo(self.view);
//    }];
}

@end
