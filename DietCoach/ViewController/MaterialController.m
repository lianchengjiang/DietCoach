//
//  MaterialController.m
//  DietCoach
//
//  Created by jiangliancheng on 16/4/9.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import "MaterialController.h"
#import <AVFoundation/AVFoundation.h>
#import "LCPlayer.h"
#import "Masonry.h"
#import "GreenBottomBar.h"
#import "ModelTableViewDataSource.h"
#import "MateriaModel.h"
#import "MaterialTableViewCell.h"
#import "ManualVideoViewController.h"

@interface MaterialController()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) LCPlayer *player;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) GreenBottomBar *bottomBar;
@property (nonatomic, strong) NSArray *dataList;
@end

@implementation MaterialController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"食材";
    [self layoutPageSubviews];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.player play];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.player pause];
}

- (void)layoutPageSubviews
{
    [self.view addSubview:self.player.playerView];
    [self.player.playerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.offset(0);
        make.height.equalTo(self.player.playerView.mas_width).multipliedBy(9.0/16);
    }];
    
    [self.view addSubview:self.bottomBar];
    [self.bottomBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0);
    }];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(self.player.playerView.mas_bottom);
        make.bottom.equalTo(self.bottomBar.mas_top);
    }];
}
#pragma mark - action
- (void)bottomBarAction
{
    ManualVideoViewController *controller = [ManualVideoViewController new];
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *identifier = @"identifier";
    [tableView registerNib:[UINib nibWithNibName:@"MaterialTableViewCell" bundle:nil] forCellReuseIdentifier:identifier];
    
    MateriaModel *model = self.dataList[indexPath.row];
    MaterialTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    [cell updateUIWithModel:model];
    return cell;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"食材";
    }
    return nil;
}


#pragma mark - getter
- (LCPlayer *)player
{
    if (_player) {
        return _player;
    }
    
    _player = [LCPlayer new];
    NSURL *URL = [[NSBundle mainBundle] URLForResource:@"meterial" withExtension:@"mov"];
    _player.playURL = URL;
    return _player;
}

- (GreenBottomBar *)bottomBar
{
    if (_bottomBar) {
        return _bottomBar;
    }
    _bottomBar = [GreenBottomBar new];
    [_bottomBar setTitle:@"准备做菜" forState:UIControlStateNormal];
    [_bottomBar addTarget:self action:@selector(bottomBarAction) forControlEvents:UIControlEventTouchUpInside];
    return _bottomBar;
}

- (UITableView *)tableView
{
    if (_tableView) {
        return _tableView;
    }
    _tableView = [UITableView new];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    return _tableView;
}

- (NSArray *)dataList
{
    if (_dataList) {
        return _dataList;
    }
    NSMutableArray *list = [NSMutableArray new];
    [list addObject:[MateriaModel modelWithName:@"辣椒" dosage:@"2只"]];
    [list addObject:[MateriaModel modelWithName:@"洋葱" dosage:@"1个"]];
    [list addObject:[MateriaModel modelWithName:@"腊肉" dosage:@"100g"]];
    _dataList = list;
    return _dataList;
}


@end
