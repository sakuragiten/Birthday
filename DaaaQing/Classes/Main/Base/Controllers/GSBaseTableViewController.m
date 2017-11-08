//
//  GSBaseTableViewController.m
//  DaaaQing
//
//  Created by Fireloli on 17/11/7.
//  Copyright © 2017年 Fireloli. All rights reserved.
//

#import "GSBaseTableViewController.h"


NSString *const reuseIdentifier = @"GSTableViewCell";

@interface GSBaseTableViewController ()

/** header */
@property (nonatomic, strong) UIImageView *headerImageView;

@end

@implementation GSBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    

}

- (void)setImageName:(NSString *)imageName
{
    _imageName = imageName;
    
    UIView *view = [[UIView alloc] initWithFrame:self.headerImageView.bounds];
    [view addSubview:self.headerImageView];
    self.tableView.tableHeaderView = view;
}


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"这是第%ld_%ld个Cell", indexPath.section, indexPath.row];
    cell.backgroundColor = [UIColor randomColor];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return CGFLOAT_MIN;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = kBgColor;
    return view;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = kBgColor;
    return view;
}


#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (_headScale && scrollView.contentOffset.y < 0) {
        //下拉的时候
        CGRect frame = self.headerImageView.frame;
        frame.origin.y = scrollView.contentOffset.y;
        frame.size.height = SCREEN_WIDTH * 0.8 - scrollView.contentOffset.y;
        self.headerImageView.frame = frame;
    }
}

#pragma mark - lazy load
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
                                                  style:UITableViewStyleGrouped];
        
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 100;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:reuseIdentifier];
//        _tableView.contentInset = UIEdgeInsetsMake(kNavHeight, 0, 0, 0);
//        _tableView.scrollIndicatorInsets = UIEdgeInsetsMake(kNavHeight, 0, 0, 0);
//        _tableView.contentOffset = CGPointMake(0, -kNavHeight);
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        
    }
    return _tableView;
    
}

- (UIImageView *)headerImageView
{
    if (!_headerImageView) {
        _headerImageView = [[UIImageView alloc] init];
        _headerImageView.image = [UIImage imageNamed:_imageName];
        _headerImageView.contentMode = UIViewContentModeScaleAspectFill;
        _headerImageView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH * 0.8);
        _headerImageView.layer.masksToBounds = YES;
    }
    
    return _headerImageView;
}

@end
