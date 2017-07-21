//
//  TableViewCell.m
//  List_03
//
//  Created by lexyguo on 2017/7/16.
//  Copyright © 2017年 lexyguo. All rights reserved.
//
#import "Masonry.h"
#import "TableViewCell.h"
#define kUIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
@implementation TableViewCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.contentView.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
        [self setup];
    }
    return self;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setup {
    UIView *cellview=[[UIView alloc]init];
    cellview.backgroundColor=[UIColor whiteColor];
    [self.contentView addSubview:cellview];
    [cellview mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.left.right.equalTo(self.contentView).offset(0);
        make.height.mas_offset(144);
    }];
    UIImageView *topSeparator = [[UIImageView alloc] init];
    topSeparator.backgroundColor = kUIColorFromRGB(0xe1e1e1);
    [self.contentView addSubview:topSeparator];
    [topSeparator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(44);
        make.left.equalTo(self.contentView).offset(15);
        make.right.equalTo(self.contentView);
        make.height.mas_equalTo(0.5);
    }];
    UIImageView *midSeparator = [[UIImageView alloc] init];
    midSeparator.backgroundColor = kUIColorFromRGB(0xeeeeee);
    [self.contentView addSubview:midSeparator];
    [midSeparator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(74);
        make.left.equalTo(self.contentView).offset(144);
        make.bottom.equalTo(self.contentView).offset(-30);
        make.width.mas_equalTo(0.5);
    }];
    
    //产品名称
    _name=[[UILabel alloc] init];
    _name.text=@"投资理财1号";
    _name.font=[UIFont systemFontOfSize:15];
    _name.textColor= [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.78/1.0];
    [cellview addSubview:_name];
    [_name mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(cellview).offset(14);
        make.left.equalTo(cellview).offset(15);
        make.height.mas_offset(15);
    }];
    
    //状态
    _yzrstatus=[[UILabel alloc] init];
    _yzrstatus.text=@"已转让";//self.status;
    _yzrstatus.font=[UIFont systemFontOfSize:12];
    _yzrstatus.textColor=kUIColorFromRGB(0xffaa00);
    _yzrstatus.textAlignment=NSTextAlignmentCenter;
    _yzrstatus.layer.borderColor=kUIColorFromRGB(0xffaa00).CGColor;
    _yzrstatus.layer.borderWidth=1.0;
    _yzrstatus.layer.cornerRadius = 2;
    [cellview addSubview:_yzrstatus];
    [_yzrstatus mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(cellview).offset(13);
        make.right.equalTo(cellview).offset(-15);
        make.left.equalTo(cellview).offset(314);
        make.height.mas_offset(18);
    }];
    _redstatus=[[UILabel alloc] init];
    _redstatus.hidden=YES;
    _redstatus.text=@"回款结束";
    _redstatus.font=[UIFont systemFontOfSize:12];
    _redstatus.textColor=kUIColorFromRGB(0xffaa00);
    _redstatus.textAlignment=NSTextAlignmentCenter;
    _redstatus.layer.borderColor=kUIColorFromRGB(0xffaa00).CGColor;
    _redstatus.layer.borderWidth=1.0;
    _redstatus.layer.cornerRadius = 2;
    [cellview addSubview:_redstatus];
    [_redstatus mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(cellview).offset(13);
        make.right.equalTo(cellview).offset(-15);
        make.left.equalTo(cellview).offset(296);
        make.height.mas_offset(18);
    }];
    
    //份额
    _share=[[UILabel alloc] init];
    _share.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.3/1.0];
    _share.font=[UIFont systemFontOfSize:12];
    _share.text=@"转让份额(份)";
    [cellview addSubview:_share];
    [_share mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(cellview).offset(72);
        make.left.equalTo(cellview).offset(15);
    }];
    
    //收益
    _interest=[[UILabel alloc] init];
    _interest.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.3/1.0];
    _interest.font=[UIFont systemFontOfSize:12];
    _interest.text=@"预期收益(元)";
    _interest.hidden=YES;
    [cellview addSubview:_interest];
    [_interest mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(cellview).offset(72);
        make.left.equalTo(cellview).offset(15);
    }];
    
    //份额数
    _transhare=[[UILabel alloc] init];
    _transhare.text=@"10000";
    _transhare.font=[UIFont systemFontOfSize:22];
    _transhare.textColor=[UIColor colorWithRed:247/255.0 green:100/255.0 blue:70/255.0 alpha:1/1.0];
    [cellview addSubview:_transhare];
    [_transhare mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(cellview).offset(94);
        make.left.equalTo(cellview).offset(15);
        make.height.mas_offset(22);
    }];
    
    //收益数
    _inprincipal=[[UILabel alloc]init];
    _inprincipal.hidden=YES;
    _inprincipal.font=[UIFont systemFontOfSize:22];
    _inprincipal.textColor=[UIColor colorWithRed:247/255.0 green:100/255.0 blue:70/255.0 alpha:1/1.0];
    _inprincipal.text=@"820.08";
    [cellview addSubview:_inprincipal];
    [_inprincipal mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(cellview).offset(94);
        make.left.equalTo(cellview).offset(15);
        make.height.mas_offset(22);
    }];
    
    //转让价格
    _price=[[UILabel alloc] init];
    _price.font=[UIFont systemFontOfSize:12];
    _price.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.3/1.0];
    _price.text=@"转让价格：";
    [cellview addSubview:_price];
    [_price mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(cellview).offset(72);
        make.left.equalTo(cellview).offset(185);
        make.right.equalTo(cellview).offset(130);
        make.height.mas_offset(12);
    }];    
    
    //投资本金
    _price1=[[UILabel alloc] init];
    _price1.font=[UIFont systemFontOfSize:12];
    _price1.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.3/1.0];
    _price1.text=@"投资本金:";
    _price1.hidden=YES;
    [cellview addSubview:_price1];
    [_price1 mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(cellview).offset(72);
        make.left.equalTo(cellview).offset(185);
        make.right.equalTo(cellview).offset(130);
        make.height.mas_offset(12);
    }];
    
    //价格
    _transferAmount=[[UILabel alloc] init];
    _transferAmount.text=@"1,000";
    _transferAmount.font=[UIFont systemFontOfSize:13];
    _transferAmount.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.78/1.0];
    [cellview addSubview:_transferAmount];
    [_transferAmount mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_price).offset(-2);
        make.left.equalTo(cellview).offset(246);
    }];
    _unit0=[[UILabel alloc] init];
    _unit0.text=@"元/份";
    _unit0.font=[UIFont systemFontOfSize:12];
    _unit0.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.78/1.0];
    [cellview addSubview:_unit0];
    [_unit0 mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(cellview).offset(71);
        make.left.equalTo(_transferAmount.mas_right).offset(0);
    }];
    
    //本金
    _principal=[[UILabel alloc]init];
    _principal.text=@"8,0000";
    _principal.hidden=YES;
    _principal.font=[UIFont systemFontOfSize:13];
    _principal.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.78/1.0];
    [cellview addSubview:_principal];
    [_principal mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_price1).offset(-2);
        make.left.equalTo(cellview).offset(246);
    }];
    _unit1=[[UILabel alloc] init];
    _unit1.text=@"元";
    _unit1.font=[UIFont systemFontOfSize:12];
    _unit1.hidden=YES;
    _unit1.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.78/1.0];
    [cellview addSubview:_unit1];
    [_unit1 mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(cellview).offset(71);
        make.left.equalTo(_principal.mas_right).offset(0);
    }];

    //到期时间
    UILabel *date=[[UILabel alloc] init];
    date.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.3/1.0];
    date.text=@"到期时间:";
    date.font=[UIFont systemFontOfSize:12];
    [cellview addSubview:date];
    [date mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(cellview).offset(99);
        make.left.equalTo(cellview).offset(185);
        make.right.equalTo(cellview).offset(-130);
    }];
    
    //具体时间
    _enddate=[[UILabel alloc] init];
    _enddate.font=[UIFont systemFontOfSize:13];
    _enddate.text=@"2016-09-08";
    _enddate.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.78/1.0];
    [cellview addSubview:_enddate];
    [_enddate mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(cellview).offset(98);
        make.left.equalTo(_transferAmount).offset(0);
    }];
    
}
-(void)refresh{
    _share.hidden=YES;
    _interest.hidden=NO;
    _price.hidden=YES;
    _price1.hidden=NO;
    _transferAmount.hidden=YES;
    _inprincipal.hidden=NO;
    _transhare.hidden=YES;
    _principal.hidden=NO;
    _unit0.hidden=YES;
    _unit1.hidden=NO;
    
//状态转化可以用if语句进行条件判断，选择状态类型
    _yzrstatus.hidden=YES;
    _redstatus.hidden=NO;

}
#pragma mark - custom setter
- (void)setItemsInfo:(NSObject *)itemsInfo
{

    [self refresh];
}
@end
