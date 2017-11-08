//
//  GSBaseTableViewController.h
//  DaaaQing
//
//  Created by Fireloli on 17/11/7.
//  Copyright © 2017年 Fireloli. All rights reserved.
//

#import "GSBaseViewController.h"

@interface GSBaseTableViewController : GSBaseViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

/** tableView header 拉动缩放 */
@property (nonatomic, assign) BOOL headScale;

@property (nonatomic, copy) NSString *imageName;

@end
