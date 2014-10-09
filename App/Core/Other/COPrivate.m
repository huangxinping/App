//
//  COPrivate.m
//  App
//
//  Created by huangxinping on 7/18/14.
//  Copyright (c) 2014 ShareMerge. All rights reserved.
//

#import "COPrivate.h"
#import <objc/runtime.h>

@implementation COPrivate

+ (void)printfPrivateMethodList:(Class)class
{
    NSString *className = NSStringFromClass(class);
    const char *cClassName = [className UTF8String];

    id theClass = objc_getClass(cClassName);

    unsigned int outCount;

    Method *m =  class_copyMethodList(theClass, &outCount);

//    NSLog(@"%d", outCount);
    NSLog(@"--------private method list-------");

    for (int i = 0; i < outCount; i++)
    {
        SEL a = method_getName(*(m + i));
        NSString *sn = NSStringFromSelector(a);
        NSLog(@"%@", sn);
    }

    NSLog(@"--------private method list-------");
}

+ (UIImage *)scaleImage:(UIImage *)image size:(CGSize)size
{
    CGSize imgSize = image.size; //原图大小
    CGSize viewSize = size;         //视图大小
    CGFloat imgwidth = 0;           //缩放后的图片宽度
    CGFloat imgheight = 0;          //缩放后的图片高度

    //视图横长方形及正方形
    if (viewSize.width >= viewSize.height)
    {
        //缩小
        if (imgSize.width > viewSize.width && imgSize.height > viewSize.height)
        {
            imgwidth = viewSize.width;
            imgheight = imgSize.height / (imgSize.width / imgwidth);
        }

        //放大
        if (imgSize.width < viewSize.width)
        {
            imgwidth = viewSize.width;
            imgheight = (viewSize.width / imgSize.width) * imgSize.height;
        }

        //判断缩放后的高度是否小于视图高度
        imgheight = imgheight < viewSize.height ? viewSize.height : imgheight;
    }

    //视图竖长方形
    if (viewSize.width < viewSize.height)
    {
        //缩小
        if (imgSize.width > viewSize.width && imgSize.height > viewSize.height)
        {
            imgheight = viewSize.height;
            imgwidth = imgSize.width / (imgSize.height / imgheight);
        }

        //放大
        if (imgSize.height < viewSize.height)
        {
            imgheight = viewSize.width;
            imgwidth = (viewSize.height / imgSize.height) * imgSize.width;
        }

        //判断缩放后的高度是否小于视图高度
        imgwidth = imgwidth < viewSize.width ? viewSize.width : imgwidth;
    }

    //重新绘制图片大小
    UIImage *i;
    UIGraphicsBeginImageContext(CGSizeMake(imgwidth, imgheight));
    [image drawInRect:CGRectMake(0, 0, imgwidth, imgheight)];
    i = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    //截取中间部分图片显示
    if (imgwidth > 0)
    {
        CGImageRef newImageRef = CGImageCreateWithImageInRect(i.CGImage, CGRectMake((imgwidth - viewSize.width) / 2, (imgheight - viewSize.height) / 2, viewSize.width, viewSize.height));
        return [UIImage imageWithCGImage:newImageRef];
    }
    else
    {
        CGImageRef newImageRef = CGImageCreateWithImageInRect(image.CGImage, CGRectMake((imgwidth - viewSize.width) / 2, (imgheight - viewSize.height) / 2, viewSize.width, viewSize.height));
        return [UIImage imageWithCGImage:newImageRef];
    }
}

+ (CGSize)downloadPNGImageSizeWithRequest:(NSMutableURLRequest *)request
{
    [request setValue:@"bytes=16-23" forHTTPHeaderField:@"Range"];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];

    if (data.length == 8)
    {
        int w1 = 0, w2 = 0, w3 = 0, w4 = 0;
        [data getBytes:&w1 range:NSMakeRange(0, 1)];
        [data getBytes:&w2 range:NSMakeRange(1, 1)];
        [data getBytes:&w3 range:NSMakeRange(2, 1)];
        [data getBytes:&w4 range:NSMakeRange(3, 1)];
        int w = (w1 << 24) + (w2 << 16) + (w3 << 8) + w4;
        int h1 = 0, h2 = 0, h3 = 0, h4 = 0;
        [data getBytes:&h1 range:NSMakeRange(4, 1)];
        [data getBytes:&h2 range:NSMakeRange(5, 1)];
        [data getBytes:&h3 range:NSMakeRange(6, 1)];
        [data getBytes:&h4 range:NSMakeRange(7, 1)];
        int h = (h1 << 24) + (h2 << 16) + (h3 << 8) + h4;
        return CGSizeMake(w, h);
    }

    return CGSizeZero;
}

+ (CGSize)downloadGIFImageSizeWithRequest:(NSMutableURLRequest *)request
{
    [request setValue:@"bytes=6-9" forHTTPHeaderField:@"Range"];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];

    if (data.length == 4)
    {
        short w1 = 0, w2 = 0;
        [data getBytes:&w1 range:NSMakeRange(0, 1)];
        [data getBytes:&w2 range:NSMakeRange(1, 1)];
        short w = w1 + (w2 << 8);
        short h1 = 0, h2 = 0;
        [data getBytes:&h1 range:NSMakeRange(2, 1)];
        [data getBytes:&h2 range:NSMakeRange(3, 1)];
        short h = h1 + (h2 << 8);
        return CGSizeMake(w, h);
    }

    return CGSizeZero;
}

+ (CGSize)downloadJPGImageSizeWithRequest:(NSMutableURLRequest *)request
{
    [request setValue:@"bytes=0-209" forHTTPHeaderField:@"Range"];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];

    if ([data length] <= 0x58)
    {
        return CGSizeZero;
    }

    if ([data length] < 210)  // 肯定只有一个DQT字段
    {
        short w1 = 0, w2 = 0;
        [data getBytes:&w1 range:NSMakeRange(0x60, 0x1)];
        [data getBytes:&w2 range:NSMakeRange(0x61, 0x1)];
        short w = (w1 << 8) + w2;
        short h1 = 0, h2 = 0;
        [data getBytes:&h1 range:NSMakeRange(0x5e, 0x1)];
        [data getBytes:&h2 range:NSMakeRange(0x5f, 0x1)];
        short h = (h1 << 8) + h2;
        return CGSizeMake(w, h);
    }
    else
    {
        short word = 0x0;
        [data getBytes:&word range:NSMakeRange(0x15, 0x1)];

        if (word == 0xdb)
        {
            [data getBytes:&word range:NSMakeRange(0x5a, 0x1)];

            if (word == 0xdb)  // 两个DQT字段
            {
                short w1 = 0, w2 = 0;
                [data getBytes:&w1 range:NSMakeRange(0xa5, 0x1)];
                [data getBytes:&w2 range:NSMakeRange(0xa6, 0x1)];
                short w = (w1 << 8) + w2;
                short h1 = 0, h2 = 0;
                [data getBytes:&h1 range:NSMakeRange(0xa3, 0x1)];
                [data getBytes:&h2 range:NSMakeRange(0xa4, 0x1)];
                short h = (h1 << 8) + h2;
                return CGSizeMake(w, h);
            }
            else    // 一个DQT字段
            {
                short w1 = 0, w2 = 0;
                [data getBytes:&w1 range:NSMakeRange(0x60, 0x1)];
                [data getBytes:&w2 range:NSMakeRange(0x61, 0x1)];
                short w = (w1 << 8) + w2;
                short h1 = 0, h2 = 0;
                [data getBytes:&h1 range:NSMakeRange(0x5e, 0x1)];
                [data getBytes:&h2 range:NSMakeRange(0x5f, 0x1)];
                short h = (h1 << 8) + h2;
                return CGSizeMake(w, h);
            }
        }
        else
        {
            return CGSizeZero;
        }
    }
}

@end
