//
//  BookManagerHomeCell.h
//  xmh
//
//  Created by ald_ios on 2019/3/4.
//  Copyright © 2019 享美会-技术研发中心-ios dev. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MineCellModel;
NS_ASSUME_NONNULL_BEGIN

@interface BookManagerHomeCell : UITableViewCell
- (void)updatecellModel:(MineCellModel *)model;
@end

NS_ASSUME_NONNULL_END