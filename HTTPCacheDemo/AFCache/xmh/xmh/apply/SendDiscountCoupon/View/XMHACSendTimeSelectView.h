//
//  XMHACSendTimeSelectView.h
//  xmh
//
//  Created by ald_ios on 2019/5/10.
//  Copyright © 2019 享美会-技术研发中心-ios dev. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XMHACSendTimeSelectView : UIView
@property (nonatomic, copy) void(^XMHACSendTimeSelectViewBlock)(NSString * time,NSString *order);
@end

NS_ASSUME_NONNULL_END
