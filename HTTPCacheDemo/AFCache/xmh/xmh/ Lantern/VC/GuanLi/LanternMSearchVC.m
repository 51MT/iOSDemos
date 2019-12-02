//
//  LanternMSearchVC.m
//  xmh
//
//  Created by ald_ios on 2019/2/18.
//  Copyright © 2019 享美会-技术研发中心-ios dev. All rights reserved.
//

#import "LanternMSearchVC.h"
/** 网路请求 */
#import "LanternRequest.h"
#import "MzzCustomerRequest.h"
/** 通用 */
#import "JasonSearchView.h"
#import "ShareWorkInstance.h"
/** 自定义Cell */
#import "LanternMResultCell.h"
/** 自定义View */
/** VC */
/** 模型 */
#import "CustomerListModel.h"
#import "UIScrollView+EmptyDataSet.h"
#import "XMHRefreshGifHeader.h"
@interface LanternMSearchVC ()<UITableViewDataSource,UITableViewDelegate,DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>
@property (nonatomic, strong)UITableView * tbView;
/** 刷新 */
@property (nonatomic, strong)XMHRefreshGifHeader * gifHeader;
@end

@implementation LanternMSearchVC
{
    NSString * _searchText;
    NSInteger _currentPage;
    NSMutableArray * _dataSource;
    JasonSearchView * _search;
    UIImageView * _imgV;
    UILabel * _notice;
    
    /** 加载更多 */
    BOOL _isMore;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _currentPage = 1;
    _isMore = NO;
    _dataSource = [[NSMutableArray alloc] init];
    
    self.view.backgroundColor = kBackgroundColor;
    [self.navView setNavViewTitle:@"" backBtnShow:YES];
    self.navView.backgroundColor = kBtn_Commen_Color;
    JasonSearchView * search = [[JasonSearchView alloc] initWithFrame:CGRectMake(40, 27, SCREEN_WIDTH - 70 - 40, 30) withPlaceholder:@"请输入项目名称"];
    search.searchBar.btnRightBlock = ^{
        _searchText = search.searchBar.text;
        [_dataSource removeAllObjects];
        [self requestData];
    };
    search.searchBar.btnleftBlock = ^{
        _searchText = @"";
        [self requestData];
    };
    search.searchBar.frame = CGRectMake(0, 0, search.width, search.height);
    search.layer.cornerRadius = 5;
    search.layer.masksToBounds = YES;
    _search = search;
    [self.navView addSubview:search];
    
    UIButton * sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [sureBtn setTitle:@"确定" forState:UIControlStateNormal];
    [sureBtn setTitle:@"取消" forState:UIControlStateSelected];
    sureBtn.titleLabel.font = FONT_SIZE(15);
    sureBtn.frame = CGRectMake(search.right, 20, 70, 44);
    [sureBtn addTarget:self action:@selector(sureClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.navView addSubview:sureBtn];
    
    [self.view addSubview:self.tbView];
    
    UIImage * img = UIImageName(@"styygl_zaiwu");
    _imgV = [[UIImageView alloc] initWithImage:img];
    _imgV.frame = CGRectMake((SCREEN_WIDTH - img.size.width)/2, 200, img.size.width, img.size.height);
    _imgV.hidden = YES;
    [self.view addSubview:_imgV];
    
    _notice = [[UILabel alloc] init];
    _notice.font = FONT_SIZE(15);
    _notice.textColor = kLabelText_Commen_Color_9;
    _notice.text = @"暂无此顾客";
    [_notice sizeToFit];
    _notice.frame = CGRectMake((SCREEN_WIDTH - _notice.width)/2, _imgV.bottom + 18, _notice.width, _notice.height);
    _notice.hidden = YES;
    [self.view addSubview:_notice];
    
    
    
}
- (void)sureClick:(UIButton *)btn
{
    btn.selected = !btn.selected;
    if ([btn.currentTitle isEqualToString:@"确定"]) {
        [_dataSource removeAllObjects];
        _searchText = _search.searchBar.text;
        [self requestData];
    }
    if ([btn.currentTitle isEqualToString:@"取消"]) {
        _searchText = @"";
        _search.searchBar.text = @"";
    }
    [_search.searchBar resignFirstResponder];
}
- (UITableView *)tbView
{
    if (!_tbView) {
        _tbView = [[UITableView alloc]initWithFrame:CGRectMake(0, Heigh_Nav, SCREEN_WIDTH, SCREEN_HEIGHT - Heigh_Nav) style:UITableViewStylePlain];
        _tbView.delegate = self;
        _tbView.dataSource = self;
        _tbView.backgroundColor = [UIColor clearColor];
        _tbView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tbView.emptyDataSetDelegate = self;
        _tbView.emptyDataSetSource = self;
        _tbView.mj_header = self.gifHeader;
//        [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//            [self refreshTbData];
//        }];
        _tbView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [self requestMoreData];
        }];
        [_tbView.mj_header beginRefreshing];
    }
    return _tbView;
}
- (XMHRefreshGifHeader *)gifHeader {
    if (!_gifHeader) {
        _gifHeader = [XMHRefreshGifHeader headerWithRefreshingBlock:^{
           [self refreshTbData];
        
        }];
    }
    return _gifHeader;
}
- (void)requestMoreData
{
    _currentPage ++;
    _isMore = YES;
    [self requestData];
}
- (void)refreshTbData
{
    _currentPage = 1;
    _isMore = NO;
//    [_dataSource removeAllObjects];
    [self requestData];
}
- (void)endRefreshing{
    [_tbView.mj_header endRefreshing];
    [_tbView.mj_footer endRefreshing];
}
#pragma mark ------UITableViewDelegate------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return 10;
    return _dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * kLanternMResultCell = @"kLanternMResultCell";
    LanternMResultCell * cell = [tableView dequeueReusableCellWithIdentifier:kLanternMResultCell];
    if (!cell) {
        cell = loadNibName(@"LanternMResultCell");
    }
    [cell updateCellParam:_dataSource[indexPath.row]];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 85.0f;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if (_BookSearchCustomerVCBlock) {
//        _BookSearchCustomerVCBlock(_dataSource[indexPath.row]);
//    }
//    [self.navigationController popViewControllerAnimated:NO];
}
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIImage imageNamed:@"xmhdefault_zanwutishi"];
}
#pragma mark ------网络请求------
- (void)requestData
{
    NSString * framid = [NSString stringWithFormat:@"%ld",(long)[ShareWorkInstance shareInstance].share_join_code.fram_id];
    NSMutableDictionary * param = [[NSMutableDictionary alloc] init];
    [param setValue:_searchText?_searchText:@"" forKey:@"name"];
    [param setValue:framid?framid:@"" forKey:@"fram_id"];
//    [param setValue:_searchText?_searchText:@"" forKey:@"search_where"];
    NSString * page = [NSString stringWithFormat:@"%ld",_currentPage];
    [param setValue:page ?page:@"1" forKey:@"page"];
    [LanternRequest requestCommonUrl:kLANTERN_MANAGE_SEARCHPRO_URL Param:param resultBlock:^(NSDictionary *resultDic, BOOL isSuccess, NSDictionary *errorDic) {
        [self endRefreshing];
        if (isSuccess) {
            if (!_isMore) {
                [_dataSource removeAllObjects];
            }
            [_dataSource addObjectsFromArray:resultDic[@"list"]];
            if ([resultDic[@"list"]count] ) {
                [_tbView.mj_footer endRefreshingWithNoMoreData];
            }
            [_tbView reloadData];
        }else{}
    }];
}
//- (void)requestCustomer
//{
//    NSMutableDictionary * params = [[NSMutableDictionary alloc] init];
//    NSString * oneClick = [NSString stringWithFormat:@"%ld",(long)[ShareWorkInstance shareInstance].share_join_code.fram_id];
//    NSString * inId = [ShareWorkInstance shareInstance].cinId;
//    [params setValue:oneClick?oneClick:@"" forKey:@"oneClick"];
//    [params setValue:@"-1" forKey:@"twoListId"];
//    [params setValue:inId?inId:@"" forKey:@"inId"];
//    [params setValue:@"0" forKey:@"page"];
//    [params setValue:_searchText?_searchText:@"" forKey:@"q"];
//    [MzzCustomerRequest requestCustomerListParams:params resultBlock:^(CustomerListModel *listModel, BOOL isSuccess, NSDictionary *errorDic) {
//        [self endRefreshing];
//        if (isSuccess) {
//            if (listModel.list.count == 0) {
//                _notice.hidden = NO;
//                _imgV.hidden = NO;
//                _tbView.hidden = YES;
//                [_tbView.mj_footer endRefreshingWithNoMoreData];
//            }else{
//                _notice.hidden = YES;
//                _imgV.hidden = YES;
//                _tbView.hidden = NO;
//            }
//            [_dataSource addObjectsFromArray:listModel.list];
//            [_tbView reloadData];
//        }else{
//
//        }
//    }];
//
//}

@end
