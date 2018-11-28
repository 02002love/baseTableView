//
//  UtilMethods.h
//  BaseTableViewDemo
//
//  Created by 宋金委 on 2018/11/27.
//  Copyright © 2018 宋金委. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
// judge is iphone
#define tab_kIsIPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
// get screen width
#define tab_kScreenWidth ([[UIScreen mainScreen] bounds].size.width)
// get screen height
#define tab_kScreenHeight ([[UIScreen mainScreen] bounds].size.height)

#define tab_kFont(x) [UIFont systemFontOfSize:x]

#define tab_kColor(c) [UIColor colorWithRed:((c>>24)&0xFF)/255.0 green:((c>>16)&0xFF)/255.0 blue:((c>>8)&0xFF)/255.0 alpha:((c)&0xFF)/255.0]
#define tab_kBackColor tab_kColor(0xEEEEEEFF)

@interface UtilMethods : NSObject

/**
 get text size
 
 @param text text content
 @param font font size
 @param size max text area
 @return CGSize new text size
 */
+ (CGSize)tab_getSizeWithText:(NSString *)text sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
