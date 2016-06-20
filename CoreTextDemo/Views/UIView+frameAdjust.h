//
//  UIView+frameAdjust.h
//  CoreTextDemo
//
//  Created by 刘帅 on 6/12/16.
//  Copyright © 2016 刘帅. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  为UIView 的frame调整添加拓展
 *  可以通过 view.x 获取x， ［view setX: xx] 来设置x
 */
@interface  UIView(frameAdjust)

- (CGFloat)x;
- (void)setX:(CGFloat)x;

- (CGFloat)y;
- (void)setY:(CGFloat)y;

- (CGFloat)height;
- (void)setHeight:(CGFloat)height;

- (CGFloat)width;
- (void)setWidth:(CGFloat)width;

@end
