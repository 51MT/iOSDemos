//
//  LApproveCellType3.h
//  xmh
//
//  Created by 神灯智能-技术研发中心-ios dev on 2018/2/10.
//  Copyright © 2018年 神灯智能-技术研发中心-ios dev. All rights reserved.
//  顾客清卡申请  H ： 185

#import <UIKit/UIKit.h>
#import "LApproveCommonModel.h"
@interface LApproveCellType3 : UITableViewCell
@property (strong, nonatomic)LApproveDetailModel * model;
@property (weak, nonatomic) IBOutlet UIImageView *imgV;
@property (weak, nonatomic) IBOutlet UILabel *lb1;
@property (weak, nonatomic) IBOutlet UILabel *lb2;
@property (weak, nonatomic) IBOutlet UILabel *lb3;
@property (weak, nonatomic) IBOutlet UILabel *lb4;
@property (weak, nonatomic) IBOutlet UILabel *lb5;
@property (weak, nonatomic) IBOutlet UILabel *lb6;
@property (weak, nonatomic) IBOutlet UILabel *lb7;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *lbRead;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *lb8;
@end
