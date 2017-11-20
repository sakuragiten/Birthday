//
//  GSDiaryController.m
//  DaaaQing
//
//  Created by Fireloli on 17/11/7.
//  Copyright © 2017年 Fireloli. All rights reserved.
//

#import "GSDiaryController.h"
#import "GSDiaryDetailController.h"
#import "GSFireViewController.h"

@interface GSDiaryController ()

@property (nonatomic, strong) UIView *navView;

/** 标题 */
@property (nonatomic, strong) UILabel *titleLbale;

@end

@implementation GSDiaryController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
    
    
}

- (void)setupUI
{
    //
    self.imageName = @"birthday.jpeg";
    self.headScale = YES;
    
    self.navigationController.navigationBar.hidden = YES;
    
    [self.view addSubview:self.navView];
    
    [self settingNavigationView];
    
  
    
}
- (void)settingNavigationView
{
    UIImage *normalImage = [UIImage imageNamed:@"ic_nav_back"];
    CGSize size = normalImage.size;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:normalImage forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    [self.navView addSubview:button];
    GSWeakSelf(weakSelf)
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.titleLbale);
        make.left.mas_equalTo(20);
        make.size.mas_equalTo(size);
    }];
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UItableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = @[@"Memories about you.", @"Code for you.", @"Words for you.", @"Everything for you."][indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:kCoolFontName size:16];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

#pragma mark - UITbaleViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        GSDiaryDetailController *vc = [[GSDiaryDetailController alloc] init];
        
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.row == 1) {
        GSFireViewController *vc = [[GSFireViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}




#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [super scrollViewDidScroll:scrollView];
    CGFloat y = scrollView.contentOffset.y;
    CGFloat alpha = y > 100 ? 1 : y / 100.0;
    self.navView.backgroundColor = RGBAlpha(255, 255, 255, alpha);
    self.titleLbale.alpha = alpha;
}

#pragma mark - lazyload
- (UIView *)navView
{
    if (!_navView) {
        _navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, kNavHeight)];
        _navView.backgroundColor = RGBAlpha(255, 255, 255, 0);
        [_navView addSubview:self.titleLbale];
        GSWeakSelf(weakSelf)
        [_titleLbale mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(weakSelf.navView.mas_centerX);
            make.bottom.equalTo(weakSelf.navView.mas_bottom).offset(-10);
            make.height.mas_equalTo(24);
        }];
        
    }
    
    return _navView;
}
- (UILabel *)titleLbale
{
    if (!_titleLbale) {
        _titleLbale = [[UILabel alloc] init];
        _titleLbale.text = @"宝贝生日快乐";
        _titleLbale.textColor = RGB(51, 51, 51);
        _titleLbale.alpha = 0;
        _titleLbale.textAlignment = NSTextAlignmentCenter;
        _titleLbale.font = [UIFont systemFontOfSize:18];
    }
    
    return _titleLbale;
}
@end
