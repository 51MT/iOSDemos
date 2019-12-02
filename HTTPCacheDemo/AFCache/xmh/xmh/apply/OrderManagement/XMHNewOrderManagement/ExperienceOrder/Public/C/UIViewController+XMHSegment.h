//
//  UIViewController+XMHSegment.h
//  xmh
//
//  Created by KFW on 2019/3/14.
//  Copyright © 2019 享美会-技术研发中心-ios dev. All rights reserved.
//



NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (XMHSegment)

/**
 将要显示
 */
- (void)viewWillAppear;

/**
 将要隐藏
 */
- (void)viewWillDisappear;

@end

NS_ASSUME_NONNULL_END
