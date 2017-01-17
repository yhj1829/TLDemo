//
//  UIImage+ClipARC.m
//  TL
//
//  Created by 阳光 on 16/12/15.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "UIImage+ClipARC.h"

@implementation UIImage (ClipARC)
#pragma mark - 压缩成正方形
- (UIImage *)newImageSizeWithNewWith:(CGFloat)width;
{
    CGSize newContext = CGSizeMake(width, width);
    UIGraphicsBeginImageContext(newContext);
    [self drawInRect:CGRectMake(0, 0, newContext.width, newContext.height)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
- (UIImage *)newImageSizeWithNewSize:(CGSize)size
{
    CGSize newContext = size;
    UIGraphicsBeginImageContext(newContext);
    [self drawInRect:CGRectMake(0, 0, newContext.width, newContext.height)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
#pragma mark - 带圆环的头像(有问题)
- (UIImage *)drawLoopImage
{
    CGFloat margin = 5;
    CGSize imageContext = CGSizeMake(self.size.width + margin * 2, self.size.height + margin *2);
    UIGraphicsBeginImageContextWithOptions(imageContext, NO, 0.0);

    CGContextRef ref = UIGraphicsGetCurrentContext();

    CGPoint center = CGPointMake(imageContext.width * 0.5, imageContext.height * 0.5);

    CGFloat radius = (MIN(imageContext.width, imageContext.height) - margin) * 0.5;

    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0 endAngle:M_PI * 2 clockwise:YES];

    CGContextSetLineWidth(ref, margin);

    [[UIColor redColor] set];

    CGContextAddPath(ref, bezierPath.CGPath);

    CGContextDrawPath(ref, kCGPathStroke);

    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius - margin / 2 startAngle:0 endAngle:M_PI *2 clockwise:YES];
    CGContextAddPath(ref, path.CGPath);

    CGContextClip(ref);

    [self drawAtPoint:CGPointMake(margin, margin)];

    UIImage *clipImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return clipImage;
}
#pragma mark - 圆形图片
- (UIImage *)drawCircleImage
{
    CGSize contextSize = CGSizeMake(self.size.width, self.size.width);

    UIGraphicsBeginImageContextWithOptions(contextSize, NO, 0.0);
    CGContextRef ref = UIGraphicsGetCurrentContext();
    CGPoint centerPoint = CGPointMake(self.size.width / 2, self.size.height / 2);
    CGFloat len = self.size.width > self.size.height ? self.size.height : self.size.width;
    CGFloat radius = len / 2;

    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:centerPoint radius:radius startAngle:0 endAngle: M_PI * 2 clockwise:YES];
    CGContextAddPath(ref, circlePath.CGPath);
    CGContextClip(ref);
    [self drawAtPoint:CGPointZero];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndPDFContext();

    return image;
}

//+ (UIImage *)imageWithColor:(UIColor *)color
//{
//    CGRect rect = CGRectMake(0, 0, 1.0, 1.0);
//    UIGraphicsBeginImageContext(rect.size);
//    CGContextRef ref = UIGraphicsGetCurrentContext();
//    CGContextSetFillColorWithColor(ref, color.CGColor);
//    CGContextFillRect(ref, rect);
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return image;
//
//}
#pragma mark- 带下划线图片
+ (UIImage *)lineImageWithHeight:(CGFloat)height
{
    CGSize size = CGSizeMake(height, height);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    CGContextRef ref = UIGraphicsGetCurrentContext();
    UIBezierPath *linePath = [UIBezierPath bezierPathWithRect:CGRectMake(0, height , height, 0.5)];
    CGContextAddPath(ref, linePath.CGPath);
    CGContextStrokePath(ref);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //    UIBezierPath *radiusPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0 , height, height) cornerRadius:5];
    //    CGContextAddPath(ref, radiusPath.CGPath);
    //    CGContextClip(ref);
    //    [image drawInRect:CGRectMake(0, 0, height, height)];
    //    UIImage *imageOther = UIGraphicsGetImageFromCurrentImageContext();
    //    UIGraphicsEndImageContext();
    return image;
    
    
}


@end
