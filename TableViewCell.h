//
//  TableViewCell.h
//  List_03
//
//  Created by lexyguo on 2017/7/16.
//  Copyright © 2017年 lexyguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (nonatomic,strong) UILabel *name; // 商品名称
@property (nonatomic,strong) UILabel *share; // 份额
@property (nonatomic,strong) UILabel *price; //转让价格
@property (nonatomic,strong) UILabel *interest ; // 收益
@property (nonatomic,strong) UILabel *price1;//投资本金
@property (nonatomic,strong) UILabel *yzrstatus;// 已转让状态
@property (nonatomic,strong) UILabel *redstatus;// 回款结束状态
@property (nonatomic,strong) UILabel *unit0;// 元／份
@property (nonatomic,strong) UILabel *unit1;// 元

//静态数据
@property (nonatomic,strong) UILabel *enddate; // 到期日
@property (nonatomic,strong) UILabel *principal; // 本金
@property (nonatomic,strong) UILabel *transferAmount; // 价格
@property (nonatomic,strong) UILabel *inprincipal; // 收益数
@property (nonatomic,strong) UILabel *transhare; // 份额数


-(void)refresh;
@end
