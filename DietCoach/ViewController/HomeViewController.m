//
//  HomeViewController.m
//  DietCoach
//
//  Created by jiangliancheng on 16/4/5.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import "HomeViewController.h"
#import "Masonry.h"
#import "HomeTableViewCell.h"
#import "UIColorPicker.h"

static NSString *kIdentifier = @"identifier";
@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataList;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UINavigationBar *bar = self.navigationController.navigationBar;
    [bar setTranslucent:NO];
    [bar setBarTintColor:[UIColorPicker barYellowColor]];
//    [bar setTintColor:[UIColorPicker barYellowColor]];
    [self layoutPageSubviews];
}

- (void)layoutPageSubviews
{
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kIdentifier];
    cell.posterImageView.image = self.dataList[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

#pragma mark - getter
- (UITableView *)tableView
{
    if (_tableView) {
        return _tableView;
    }
    _tableView = [UITableView new];
    [_tableView registerNib:[UINib nibWithNibName:@"HomeTableViewCell" bundle:nil] forCellReuseIdentifier:kIdentifier];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    return _tableView;
}

- (NSArray *)dataList
{
    if (_dataList) {
        return _dataList;
    }
    _dataList = [NSMutableArray new];
    [_dataList addObject:[UIImage imageNamed:@"home1"]];
    [_dataList addObject:[UIImage imageNamed:@"home2"]];
    [_dataList addObject:[UIImage imageNamed:@"home3"]];
    [_dataList addObject:[UIImage imageNamed:@"home4"]];
    return _dataList;
}


@end
