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

@interface AutoVideoViewController ()

@property (nonatomic, strong) LCPlayer *player;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) DCFireView *fireView;
@property (nonatomic, strong) DCTimeView *timeView;

@property (nonatomic, strong) AutoVideoViewModel *viewModel;

@end

@implementation AutoVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - bind
- (void)bindViewWithModel
{
    
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

#pragma mark - getter


@end
