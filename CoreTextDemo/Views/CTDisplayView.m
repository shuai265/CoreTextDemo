//
//  CTDisplayView.m
//  CoreTextDemo
//
//  Created by 刘帅 on 6/12/16.
//  Copyright © 2016 刘帅. All rights reserved.
//

#import "CTDisplayView.h"
#import "CoretextUtils.h"
#import "MagnifiterView.h"
#import <CoreText/CoreText.h>

NSString *const CTDisplayViewImagePressedNotification = @"CTDisplayViewImagePressedNotification";
NSString *const CTDisplayViewLinkPressedNotification = @"CTDisplayViewLinkPressedNotification";

typedef enum CTisplayViewState : NSInteger {
    CTDisplayViewStateNormal,       // 普通状态
    CTDisplayViewStateTouching,     // 正在按下，需要弹出放大镜
    CTDisplayViewStateSelecting     // 选中了一些文本，需要弹出复制菜单
}CTDisplayViewState;

#define ANCHOR_TARGET_TAG 1
#define FONTHEIGHT 40

@interface CTDisplayView ()<UIGestureRecognizerDelegate>

@property (nonatomic) NSInteger selectionStartPosition;
@property (nonatomic) NSInteger selectionEndPosition;
@property (nonatomic) CTDisplayViewState state;
@property (strong, nonatomic) UIImageView *leftSelectionAnchor;
@property (strong, nonatomic) UIImageView *rightSelectionAnchor;
@property (strong, nonatomic) MagnifiterView *magnifierView;

@end

@implementation CTDisplayView

- (instancetype)init {
    return [self initWithFrame:CGRectZero];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    //1 GET CURRENT 绘制画布的上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //2 将坐标系上下翻转，底层绘制引擎，屏幕左下角是（0，0），上层
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    //3
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.bounds);
    
    
    //4
    NSAttributedString *attString = [[NSAttributedString alloc]initWithString:@"Hello World""创建绘制的区域""CoreText 支持各种文字排版的区域,coretextbenshe""本身支持各种""ceshi设置不同的绘制区域"];
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attString);
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, [attString length]), path, NULL);
    
    //5
    CTFrameDraw(frame, context);
    
    //6
    CFRelease(frame);
    CFRelease(path);
    CFRelease(framesetter);
}


@end
