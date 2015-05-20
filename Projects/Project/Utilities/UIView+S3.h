//
//  UIView+ARIS.h
//  ARIS VIETNAM
//
//  Created by Hung Tran on 8/3/12.
//  Copyright (c) ARIS VIETNAM. All rights reserved.
//


@interface UIView(S3)

- (void)setFrameOrigin:(CGPoint)newOrigin;
- (void)setFrameSize:(CGSize)newSize;
- (void)setFrameOriginX:(CGFloat)newX;
- (void)setFrameOriginY:(CGFloat)newY;
- (void)setFrameSizeWidth:(CGFloat)newWidth;
- (void)setFrameSizeHeight:(CGFloat)newHeight;

- (void)setCenterX:(CGFloat)newX;
- (void)setCenterY:(CGFloat)newY;

- (CGFloat)convertX:(CGFloat)x toView:(UIView *)anotherView;
- (CGFloat)convertX:(CGFloat)x fromView:(UIView *)anotherView;
- (CGFloat)convertY:(CGFloat)y toView:(UIView *)anotherView;
- (CGFloat)convertY:(CGFloat)y fromView:(UIView *)anotherView;

- (void)addSubview:(UIView *)subview keepSubviewFrameOnScreen:(BOOL)keepPosition;

@end
