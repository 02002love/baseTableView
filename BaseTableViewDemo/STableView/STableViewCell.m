//
//  STableViewCell.m
//  BaseTableViewDemo
//
//  Created by 宋金委 on 2018/11/27.
//  Copyright © 2018 宋金委. All rights reserved.
//


#import "STableViewCell.h"
#import "UIView+Animated.h"
#import "TABMethod.h"

static NSString * cellID = @"STABLEVIEWCELLID";
@interface STableViewCell(){
    
    UIImageView *iconImg;
    UILabel *titleLab;
    UILabel *timeLab;
    UIButton *statusBtn;
}

@end

@implementation STableViewCell

+ (instancetype)initCellInTable:(UITableView *)tableView{
    STableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[STableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style  reuseIdentifier:reuseIdentifier]){
        [self initUI];
    }
    return self;
}

- (void)initUI{
    {
        UIImageView *iv = [[UIImageView alloc] init];
        iv.contentMode = UIViewContentModeScaleAspectFill;
        iv.layer.masksToBounds = YES;
        iv.loadStyle = TABViewLoadAnimationWithOnlySkeleton;
        
        iconImg = iv;
        [self addSubview:iv];
    }
    
    {
        UILabel *lab = [[UILabel alloc]init];
        [lab setFont:tab_kFont(15)];
        [lab setTextColor:[UIColor blackColor]];
        [lab setText:@""];
        lab.loadStyle = TABViewLoadAnimationLong;
        
        titleLab = lab;
        [self addSubview:lab];
    }
    
    {
        UILabel *lab = [[UILabel alloc]init];
        [lab setFont:tab_kFont(12)];
        [lab setTextColor:[UIColor grayColor]];
        [lab setText:@""];
        lab.loadStyle = TABViewLoadAnimationShort;
        
        timeLab = lab;
        [self addSubview:lab];
    }
    
    {
        UIButton *btn = [[UIButton alloc]init];
        [btn setTitle:@"" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn.titleLabel setFont:tab_kFont(12)];
        btn.loadStyle = TABViewLoadAnimationWithOnlySkeleton;
        
        statusBtn = btn;
        [self addSubview:btn];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    //获取对应组件文本大小
    CGSize titleSize = [TABMethod tab_getSizeWithText:titleLab.text sizeWithFont:tab_kFont(15) constrainedToSize:CGSizeMake(MAXFLOAT, 10)];
    CGSize timeSize = [TABMethod tab_getSizeWithText:timeLab.text sizeWithFont:tab_kFont(12) constrainedToSize:CGSizeMake(MAXFLOAT, 25)];
    
    //布局
    iconImg.frame = CGRectMake(15, 10, (self.frame.size.height-20)*1.5, (self.frame.size.height-20));
    iconImg.layer.cornerRadius = 5;
    
    titleLab.frame = CGRectMake(CGRectGetMaxX(iconImg.frame)+15, 10, titleSize.width, 20);
    timeLab.frame = CGRectMake(CGRectGetMaxX(iconImg.frame)+15, CGRectGetMaxY(titleLab.frame)+5, timeSize.width,15);
    statusBtn.frame = CGRectMake(CGRectGetMaxX(iconImg.frame)+15, CGRectGetMaxY(timeLab.frame)+5+5,70, 20);
    
    if ( timeSize.width > 0 ) {
        statusBtn.layer.cornerRadius = 5;
    }
}

#pragma mark - private method
- (void)fillCellWithModel:(SModel *)model{
    if (model) {
        titleLab.text = model.title;
        timeLab.text = [NSString stringWithFormat:@"外文名: %@" ,model.original_title];
        [iconImg sd_setImageWithURL:[NSURL URLWithString:model.images[@"large"]]];
        
        [statusBtn setTitle:model.year forState:UIControlStateNormal];
        [statusBtn setBackgroundColor:[UIColor lightGrayColor]];
    }
}
@end
