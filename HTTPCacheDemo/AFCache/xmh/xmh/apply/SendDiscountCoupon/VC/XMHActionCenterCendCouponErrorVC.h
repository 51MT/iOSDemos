//
//  XMHActionCenterCendCouponErrorVC.h
//  xmh
//
//  Created by ald_ios on 2019/5/17.
//  Copyright © 2019 享美会-技术研发中心-ios dev. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XMHActionCenterCendCouponErrorVC : UIViewController
@property (nonatomic, copy) void(^XMHActionCenterCendCouponErrorVCBlock)(NSMutableArray *dataSource);
@property (nonatomic ,strong) NSMutableArray * dataSource;
@end

NS_ASSUME_NONNULL_END
