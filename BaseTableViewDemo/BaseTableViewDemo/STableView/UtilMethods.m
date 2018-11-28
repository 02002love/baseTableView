//
//  UtilMethods.m
//  BaseTableViewDemo
//
//  Created by 宋金委 on 2018/11/27.
//  Copyright © 2018 宋金委. All rights reserved.
//

#import "UtilMethods.h"

@implementation UtilMethods

+ (CGSize)tab_getSizeWithText:(NSString *)text sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size {
    
    NSDictionary *attributesDictionary = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
    CGRect frame = [text boundingRectWithSize:size options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) attributes:attributesDictionary context:nil];
    
    return frame.size;
}

@end
