//
//  LSmartAllocationCell.h
//  xmh
//
//  Created by 神灯智能-技术研发中心-ios dev on 2018/1/9.
//  Copyright © 2018年 神灯智能-技术研发中心-ios dev. All rights reserved.
//  H : 105

#import <UIKit/UIKit.h>
#import "LSADaiFenPeiModel.h"
@interface LSmartAllocationCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (nonatomic, strong)LSAUserModel * model;
@property (weak, nonatomic) IBOutlet UIImageView *imgV1;
@property (weak, nonatomic) IBOutlet UILabel *lbName1;
@property (weak, nonatomic) IBOutlet UILabel *lbStore;
@property (weak, nonatomic) IBOutlet UIImageView *imgV2;
@property (weak, nonatomic) IBOutlet UILabel *lbName2;
@property (weak, nonatomic) IBOutlet UILabel *lbManageNum;
@end
