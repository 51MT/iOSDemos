//
//  MWareListModel.m
//  xmh
//
//  Created by 神灯智能-技术研发中心-ios dev on 2018/3/30.
//  Copyright © 2018年 神灯智能-技术研发中心-ios dev. All rights reserved.
//

#import "MWareListModel.h"

@implementation MWareListModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"list" : [MWareModel class]};

}
@end

@implementation MWareModel

@end