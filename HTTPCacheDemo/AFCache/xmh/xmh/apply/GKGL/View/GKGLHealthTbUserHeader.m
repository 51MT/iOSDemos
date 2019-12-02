//
//  GKGLHealthTbUserHeader.m
//  xmh
//
//  Created by ald_ios on 2019/1/9.
//  Copyright © 2019 享美会-技术研发中心-ios dev. All rights reserved.
//

#import "GKGLHealthTbUserHeader.h"
#import "GKGLHomeCustomerListModel.h"
#import <YYWebImage/YYWebImage.h>
@interface GKGLHealthTbUserHeader ()
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *lbName;
@property (weak, nonatomic) IBOutlet UILabel *lbXF;
@property (weak, nonatomic) IBOutlet UILabel *lbClass;
@property (weak, nonatomic) IBOutlet UILabel *gukeState;
@end
@implementation GKGLHealthTbUserHeader
- (void)awakeFromNib
{
    [super awakeFromNib];
    _gukeState.layer.cornerRadius = _gukeState.height/2;
    _gukeState.layer.borderWidth = 1;
    _gukeState.layer.masksToBounds = YES;
    _icon.layer.cornerRadius = _icon.height/2;
    _icon.layer.masksToBounds = YES;
    _lbXF.textColor = kColor9;
    _lbName.textColor = kColor3;
}
- (IBAction)tapClick:(UIButton *)sender {
    if (_GKGLHealthTbUserHeaderDelBlock) {
        _GKGLHealthTbUserHeaderDelBlock();
    }
}
- (void)updateGKGLHealthTbUserHeaderModel:(GKGLHomeCustomerModel *)model
{
    [_icon yy_setImageWithURL:URLSTR(model.headimgurl) placeholder:kDefaultCustomerImage];
    _gukeState.text = model.zt;
    _lbName.text = model.name;
    _lbXF.text = model.show;
    _lbClass.text = model.grade_name;
    
    if ([model.zt isEqualToString:@"活动顾客"]) {
        _gukeState.backgroundColor = [ColorTools colorWithHexString:@"#FFF3F0"];
        _gukeState.textColor = [ColorTools colorWithHexString:@"#FF9072"];
        _gukeState.layer.borderColor = [ColorTools colorWithHexString:@"#FF9072"].CGColor;
    }
    if ([model.zt isEqualToString:@"休眠顾客"]) {
        _gukeState.backgroundColor = [ColorTools colorWithHexString:@"#FFF7E8"];;
        _gukeState.textColor = [ColorTools colorWithHexString:@"#FFAF19"];
        _gukeState.layer.borderColor = [ColorTools colorWithHexString:@"#FFAF19"].CGColor;
        
    }
    if ([model.zt isEqualToString:@"流失顾客"]) {
        _gukeState.backgroundColor = kColorE5E5E5;
        _gukeState.textColor = kColor9;
        _gukeState.layer.borderColor = kColor9.CGColor;
    }
    if (model.zt.length ==0) {
        _gukeState.hidden = YES;
    }
    
}
@end
