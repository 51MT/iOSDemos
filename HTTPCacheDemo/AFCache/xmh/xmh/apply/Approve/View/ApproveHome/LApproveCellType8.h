//
//  LApproveCellType8.h
//  xmh
//
//  Created by 神灯智能-技术研发中心-ios dev on 2018/2/13.
//  Copyright © 2018年 神灯智能-技术研发中心-ios dev. All rights reserved.
//  个性制单申请 H ： 205

#import <UIKit/UIKit.h>
#import "LApproveCommonModel.h"
@interface LApproveCellType8 : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgV;
@property (weak, nonatomic) IBOutlet UILabel *lb1;
@property (weak, nonatomic) IBOutlet UILabel *lb2;
@property (weak, nonatomic) IBOutlet UILabel *lb3;
@property (weak, nonatomic) IBOutlet UILabel *lb4;
@property (weak, nonatomic) IBOutlet UILabel *lb5;
@property (weak, nonatomic) IBOutlet UILabel *lb6;
@property (weak, nonatomic) IBOutlet UILabel *lb7;
@property (weak, nonatomic) IBOutlet UILabel *lb9;
@property (weak, nonatomic) IBOutlet UILabel *lbRead;
@property (strong, nonatomic)LApproveDetailModel * model;
@property (weak, nonatomic) IBOutlet UILabel *lb8;
@end
