//
//  ColorHeader.h
//  TL
//
//  Created by 阳光 on 16/11/16.
//  Copyright © 2016年 阳光. All rights reserved.
//

#ifndef ColorHeader_h
#define ColorHeader_h

#define time 0.3f

/**
 *define:颜色设置的宏定义
 *prame: _r -- RGB的红
 *parma: _g -- RGB的绿
 *parma: _g -- RGB的蓝
 *parma: _alpha -- RGB的透明度
 */
#define SELECT_COLOR(_r,_g,_b,_alpha) [UIColor colorWithRed:_r / 255.0 green:_g / 255.0 blue:_b / 255.0 alpha:_alpha]

/**
 *define:获取屏幕的宽
 */
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

/**
 *define:获取屏幕的高
 */
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

/**
 *define:iOS 7.0的版本判断
 */
#define iOS7_OR_LATER [UIDevice currentDevice].systemVersion.floatValue >= 7.0

/**
 *define:iOS 8.0的版本判断
 */
#define iOS8_OR_LATER [UIDevice currentDevice].systemVersion.floatValue >= 8.0

/**
 *define:屏幕的宽高比
 */
#define CURRENT_SIZE(_size) _size / 375.0 * SCREEN_WIDTH


// 灰色
#define Gray_Color             HexRGB(0x909090)

#define Main_Color             HexRGB(0x64D5C0)

#define Color333333            HexRGB(0x333333)

#define Color979797            HexRGB(0x979797)

#define Color5C6E7C            HexRGB(0x5C6E7C)

#define ColorE5E5E5            HexRGB(0xE5E5E5)

#define ColorFF5D71            HexRGB(0xFF5D71)

#define Color59CDF0            HexRGB(0x59CDF0)

#define ColorF66E6E           HexRGB(0xF66E6E)

#define ColorD8D8D8            HexRGB(0xD8D8D8)

#define Color666666            HexRGB(0x666666)

#define ColorF2F2F2            HexRGB(0xF2F2F2)

#define Color212121            HexRGB(0x212121)

#define Color64D5C0            HexRGB(0x64D5C0)

#define Color909090            HexRGB(0x909090)

#define Color999999            HexRGB(0x999999)

#define Color757575            HexRGB(0x757575)

#define ColorFFFFFF            HexRGB(0xFFFFFF)

#define Color39C6AC            HexRGB(0x39C6AC)

#define ColorE0E0E0           HexRGB(0xE0E0E0)

#define ColorBDBDBD           HexRGB(0xBDBDBD)

#define ColorFAFAFA          HexRGB(0xFAFAFA)

#define ColorCECECE           HexRGB(0xCECECE)

#endif /* ColorHeader_h */
