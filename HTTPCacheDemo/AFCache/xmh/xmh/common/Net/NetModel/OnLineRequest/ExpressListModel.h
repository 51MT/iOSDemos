//
//  ExpressListModel.h
//  xmh
//
//  Created by 神灯智能-技术研发中心-ios dev on 2018/4/4.
//  Copyright © 2018年 神灯智能-技术研发中心-ios dev. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ExpressModel;
@interface ExpressListModel : NSObject
@property (nonatomic, strong)NSArray <ExpressModel *>* list;
@end

@interface ExpressModel : NSObject
@property (nonatomic, copy)NSString * name;
@property (nonatomic, copy)NSString * code;
@end