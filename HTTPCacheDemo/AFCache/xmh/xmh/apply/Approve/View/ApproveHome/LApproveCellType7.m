//
//  LApproveCellType7.m
//  xmh
//
//  Created by 神灯智能-技术研发中心-ios dev on 2018/2/13.
//  Copyright © 2018年 神灯智能-技术研发中心-ios dev. All rights reserved.
//

#import "LApproveCellType7.h"
#import <YYWebImage/YYWebImage.h>
@implementation LApproveCellType7

- (void)layoutSubviews {
    [super layoutSubviews];
    self.contentView.frame = CGRectMake(10, 10, self.width - 20, self.height - 10);
    
    _imgV.layer.cornerRadius = _imgV.width / 2.f;
    _imgV.layer.masksToBounds = YES;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = kColorF5F5F5;
    
    self.contentView.layer.cornerRadius = 5;
    self.contentView.layer.masksToBounds = YES;
    self.contentView.backgroundColor = UIColor.whiteColor;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setModel:(LApproveDetailModel *)model
{
    [_imgV yy_setImageWithURL:[NSURL URLWithString:model.head_img] placeholder:kDefaultJisImage];
    _lb1.text = [NSString stringWithFormat:@"%@的已购置换审批",model.data.initiator];
    _lb2.text = [NSString stringWithFormat:@"开单人: %@",model.data.initiator];
    _lb3.text = [NSString stringWithFormat:@"顾客姓名: %@",model.data.uname];
    _lb4.text = [NSString stringWithFormat:@"顾客电话: %@",model.data.utel];
    _lb5.text = [NSString stringWithFormat:@"开单类型: %@",model.data.type];
    _lb6.text = [NSString stringWithFormat:@"差价类型: %@",model.data.difference];
    _lb7.text = [NSString stringWithFormat:@"%@",model.state];
    _lb7.textColor = [ColorTools colorCauseByText:model.state];
    _lb8.text = [NSString stringWithFormat:@"%@",model.create_time];
    _lb9.text = [NSString stringWithFormat:@"最终定价: %ld",model.data.price_s];
    if (model.isRead ==0){
        _lbRead.hidden = NO;
    }else{
        _lbRead.hidden = YES;
    }
}
@end
