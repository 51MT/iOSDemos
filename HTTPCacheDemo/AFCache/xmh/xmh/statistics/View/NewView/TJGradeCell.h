//
//  TJGradeCell.h
//  xmh
//
//  Created by ald_ios on 2018/12/7.
//  Copyright © 2018 享美会-技术研发中心-ios dev. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CustomerSubGradeModel;
@interface TJGradeCell : UICollectionViewCell
- (void)updateTJGradeCellModel:(CustomerSubGradeModel *)model type:(NSString *)type;
@end
