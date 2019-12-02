//
//  LanternAddGoodsTopView.h
//  xmh
//
//  Created by ald_ios on 2018/12/29.
//  Copyright © 2018 享美会-技术研发中心-ios dev. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LanternPlanInfoModel;
@interface LanternAddGoodsTopView : UIView
@property (nonatomic, copy)void (^LanternAddGoodsTopViewSearchBlock)(NSString *key);
- (void)updateLanternAddGoodsTopViewModel:(LanternPlanInfoModel *)model;
@end
