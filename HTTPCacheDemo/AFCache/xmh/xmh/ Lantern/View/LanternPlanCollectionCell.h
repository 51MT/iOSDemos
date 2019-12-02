//
//  LanternPlanCollectionCell.h
//  xmh
//
//  Created by ald_ios on 2019/1/2.
//  Copyright © 2019 享美会-技术研发中心-ios dev. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class LanternPlanProModel;
@interface LanternPlanCollectionCell : UICollectionViewCell
- (void)updateLanternPlanCollectionCellModel:(LanternPlanProModel *)model;
- (void)updateCellParam:(NSDictionary *)param;
- (void)updateCellParam:(NSDictionary *)param tag:(NSInteger)tag;
@end

NS_ASSUME_NONNULL_END
