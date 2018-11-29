//
//  UITableView+EmptyTableViewPlaceHolder.m
//  XHMall
//
//  Created by XH on 2017/7/16.
//  Copyright © 2017年 XH. All rights reserved.
//

#import "UITableView+EmptyTableViewPlaceHolder.h"

@implementation UITableView (EmptyTableViewPlaceHolder)


- (void)tableViewPlaceHolderShowLabelText:(NSString *)message img:(NSString *)imgName row:(NSInteger )row{
    
    //么有数据
    if (row == 0) {
        
        UIView * bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        bgView.backgroundColor = setRGBColor(250, 250, 250, 1);
        
        self.backgroundView = bgView;
        
        //提示图片
        UIImageView * noticeImg = [UIImageView new];
        noticeImg.width = 105;
        noticeImg.height = 105;
        noticeImg.center = CGPointMake(bgView.center.x , bgView.center.y - 70) ;
        
        
//        [noticeImg sd_setImageWithURL:[NSURL URLWithString:imgName]];
        [noticeImg setImage:[UIImage imageNamed:imgName]];
        noticeImg.contentMode = UIViewContentModeScaleAspectFit;
        
        [bgView addSubview:noticeImg];
        
        //提示信息
        UILabel * noticeMsg = [UILabel new];
        noticeMsg.text = message;
        [noticeMsg sizeToFit];
        noticeMsg.font = [UIFont systemFontOfSize:14];
        noticeMsg.textColor = getThemeColor;
        
        noticeMsg.centerX = noticeImg.centerX;
        noticeMsg.y = noticeImg.y +  noticeImg.height + 20;
        noticeMsg.textAlignment = NSTextAlignmentCenter;
        
        [bgView addSubview:noticeMsg];
        
        //去逛逛
         UIButton * goHome = [UIButton new];
        [goHome setTitle:@"去逛逛" forState:UIControlStateNormal];
        //[goHome sizeToFit];
        goHome.titleLabel. font = [UIFont systemFontOfSize:14];
        [goHome setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [goHome setBackgroundColor:setRGBColor(210, 121, 107, 1)];
        
        goHome.y = noticeMsg.y +  noticeMsg.height + 20;
        goHome.height = 32;
        goHome.width = 80;
        goHome.centerX = noticeMsg.centerX;
        
        [bgView addSubview:goHome];
        
        
    }else{
        
        self.backgroundView = nil;
    }
    
    
}

@end
