//
//  BeautyHomeListModel.m
//  xmh
//
//  Created by 神灯智能-技术研发中心-ios dev on 2018/1/6.
//  Copyright © 2018年 神灯智能-技术研发中心-ios dev. All rights reserved.
//

#import "BeautyHomeListModel.h"

@implementation BeautyHomeListModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"dList" : [BeautyHomeDModel class],
             @"uList" : [BeautyHomeUModel class]
             };
}

@end
