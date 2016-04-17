//
//  AutoVideoViewController.m
//  DietCoach
//
//  Created by jiangliancheng on 16/4/10.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import "AutoVideoViewController.h"
#import "LCPlayer.h"
#import "AutoVideoViewModel.h"
#import "DCFireView.h"
#import "DCTimeView.h"
#import "DCRecordTimeView.h"
#import "Masonry.h"
#import "LCPlayControlView.h"
#import "ModelTableViewDataSource.h"

@interface AutoVideoViewController ()<DCRecordTimeViewDelegate>

@property (nonatomic, strong) LCPlayer *player;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) DCFireView *fireView;
@property (nonatomic, strong) DCTimeView *timeView;
@property (nonatomic, strong) DCRecordTimeView *recordView;
@property (nonatomic, strong) LCPlayControlView *controlView;

@property (nonatomic, strong) ModelTableViewDataSource *dataSource;

@property (nonatomic, strong) AutoVideoViewModel *model;

@end

@implementation AutoVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self layoutPageSubviews];
    [self bindViewWithModel];
}

#pragma mark - bind
- (void)layoutPageSubviews
{
    [self.view addSubview:self.player.playerView];
    [self.player.playerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.offset(0);
        make.height.equalTo(self.player.playerView.mas_width).multipliedBy(9.0/16);
    }];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.player.playerView.mas_bottom);
        make.left.right.offset(0);
        make.height.equalTo(@80);
    }];
    
    [self.view addSubview:self.recordView];
    [self.recordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.equalTo(self.tableView.mas_bottom).offset(40);
    }];
    
    [self.view addSubview:self.fireView];
    [self.fireView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(35);
        make.centerY.equalTo(self.recordView);
    }];
    
    [self.view addSubview:self.timeView];
    [self.timeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-35);
        make.centerY.equalTo(self.recordView);
    }];
    
    [self.view addSubview:self.controlView];
    [self.controlView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(20);
        make.right.offset(-20);
        make.bottom.offset(-36);
    }];
}

- (void)bindViewWithModel
{
    RAC(self.player,playURL) = RACObserve(self, model.URL);
    RAC(self.fireView,model) = RACObserve(self, model.fireModel);
    RAC(self.recordView,totalTime) = RACObserve(self, model.timeModel.second);
    RAC(self.timeView,model) = RACObserve(self, model.timeModel);
    RAC(self.controlView,controlModel) = RACObserve(self, model.controlModel);
    
    @weakify(self);
    [self.controlView.backSignal subscribeNext:^(id x) {
        @strongify(self);
        [self.model goBack];
    }];
    
    [self.controlView.forwardSignal subscribeNext:^(id x) {
        @strongify(self);
        [self.model goForward];
    }];
    
    [self.controlView.playSignal subscribeNext:^(NSNumber *playing) {
        @strongify(self);
        self.model.controlModel.playing = [playing boolValue];
        self.recordView.playing = [playing boolValue];
        if ([playing boolValue]) {
            [self.player play];
        } else {
            [self.player pause];
        }
    }];
    
    RAC(self.dataSource,itemList) = RACObserve(self, model.materialList);
}

#pragma mark - DCRecordTimeViewDelegate
- (void)recordCompletedInTimeView:(DCRecordTimeView *)view
{
    [self.model goForward];
}

#pragma mark - getter
- (LCPlayer *)player
{
    if (_player) {
        return _player;
    }
    
    _player = [LCPlayer new];
    return _player;
}

- (DCFireView *)fireView
{
    if (_fireView) {
        return _fireView;
    }
    _fireView = [DCFireView new];
    return _fireView;
}

- (DCTimeView *)timeView
{
    if (!_timeView) {
        _timeView = [DCTimeView new];
    }
    return _timeView;
}

- (DCRecordTimeView *)recordView
{
    if (!_recordView) {
        _recordView = [DCRecordTimeView new];
        _recordView.delegate = self;
    }
    return _recordView;
}

- (LCPlayControlView *)controlView
{
    if (!_controlView) {
        _controlView = [LCPlayControlView new];
    }
    return _controlView;
}

- (UITableView *)tableView
{
    if (_tableView) {
        return _tableView;
    }
    _tableView = [UITableView new];
    _tableView.dataSource = self.dataSource;
    return _tableView;
}

- (ModelTableViewDataSource *)dataSource
{
    if (_dataSource) {
        return _dataSource;
    }
    _dataSource = [ModelTableViewDataSource new];
    return _dataSource;
}

- (AutoVideoViewModel *)model
{
    if (!_model) {
        _model = [AutoVideoViewModel new];
    }
    return _model;
}

@end
